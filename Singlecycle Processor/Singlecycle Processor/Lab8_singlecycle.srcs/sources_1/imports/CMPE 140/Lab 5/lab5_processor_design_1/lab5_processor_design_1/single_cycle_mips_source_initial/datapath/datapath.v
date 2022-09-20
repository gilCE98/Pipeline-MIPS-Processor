module mips_datapath (
        input  wire        clk,
        input  wire        rst,
        input  wire        branch,
        input  wire        jump,
        input  wire        reg_dst,
        input  wire        we_reg,
        input  wire        alu_src,
        input  wire        dm2reg,
        input  wire        we,
        input  wire        rf_wa_jal_sel,
        input  wire        sl_sr_sel,
        input  wire        pc_jr_sel,
        input  wire        rf_mult_shift_wd_sel,
        input  wire        rf_wd_jal_sel,
        input  wire        hi_lo_sel,
        input  wire        mult_shift_sel,
        input  wire [2:0]  alu_ctrl,
        input  wire [4:0]  ra3,
        input  wire [31:0] instr,
        input  wire [31:0] rd_dm,
        output wire [31:0] pc_current,
        output wire [31:0] alu_out,
        output wire [31:0] wd_dm,
        output wire [31:0] rd3
    );

    wire [4:0]  rf_wa;
    wire        pc_src;
    wire [31:0] pc_plus4;
    wire [31:0] pc_pre;
    wire [31:0] pc_next;
    wire [31:0] sext_imm;
    wire [31:0] ba;
    wire [31:0] bta;
    wire [31:0] jta;
    wire [31:0] alu_pa;
    wire [31:0] alu_pb;
    wire [31:0] wd_rf;
    wire        zero;
    
    wire [31:0] pc_final;
    wire [63:0] mult;
    wire [31:0] mfhi;
    wire [31:0] mflo;
    wire [31:0] mult_out;
    wire [31:0] shift;
    wire [31:0] mult_shift;
    wire [31:0] mux_alu_dm_jal;
    wire [31:0] mux_alu_dm;
    wire [4:0] rf_out;
    
    
    
    assign pc_src = branch & zero;
    assign ba = {sext_imm[29:0], 2'b00};
    assign jta = {pc_plus4[31:28], instr[25:0], 2'b00};
    
    // --- PC Logic --- //
    dreg pc_reg (
            .clk            (clk),
            .rst            (rst),
            .d              (pc_final),
            .q              (pc_current)
        );

    adder pc_plus_4 (
            .a              (pc_current),
            .b              (32'd4),
            .y              (pc_plus4)
        );

    adder pc_plus_br (
            .a              (pc_plus4),
            .b              (ba),
            .y              (bta)
        );

    mux2 #(32) pc_src_mux (
            .sel            (pc_src),
            .a              (pc_plus4),
            .b              (bta),
            .y              (pc_pre)
        );

    mux2 #(32) pc_jmp_mux (
            .sel            (jump),
            .a              (pc_pre),
            .b              (jta),
            .y              (pc_next)
        );
        


    // --- RF Logic --- //
    mux2 #(5) rf_wa_mux (
            .sel            (reg_dst),
            .a              (instr[20:16]),
            .b              (instr[15:11]),
            .y              (rf_out)
        );

    regfile rf (
            .clk            (clk),
            .we             (we_reg),
            .ra1            (instr[25:21]),
            .ra2            (instr[20:16]),
            .ra3            (ra3),
            .wa             (rf_wa),
            .wd             (wd_rf),
            .rd1            (alu_pa),
            .rd2            (wd_dm),
            .rd3            (rd3)
        );

    signext se (
            .a              (instr[15:0]),
            .y              (sext_imm)
        );

    // --- ALU Logic --- //
    mux2 #(32) alu_pb_mux (
            .sel            (alu_src),
            .a              (wd_dm),
            .b              (sext_imm),
            .y              (alu_pb)
        );

    alu alu (
            .op             (alu_ctrl),
            .a              (alu_pa),
            .b              (alu_pb),
            .zero           (zero),
            .y              (alu_out)
        );

    // --- MEM Logic --- //
    mux2 #(32) rf_wd_mux (
            .sel            (dm2reg),
            .a              (alu_out),
            .b              (rd_dm),
            .y              (mux_alu_dm)
        );
        
      
    // --- JR Instruction --- //    
    mux2 #(32) pc_jr_mux (
            .sel            (pc_jr_sel),
            .a              (pc_next),
            .b              (alu_pa),
            .y              (pc_final)
        );
        
     // --- Multu Instruction --- //   
     multiplier  multiplier (
            .a              (alu_pa),
            .b              (wd_dm),
            .y              (mult)
    );
    
     // --- Mfhi and Mflo Instruction --- //  
 
       hiloregister HI (
            .clk            (clk),
            .we            (we),
            .d              (mult[63:32]),
            .q              (mfhi)
        );
       hiloregister LO (
            .clk            (clk),
            .we            (we),
            .d              (mult[31:0]),
            .q              (mflo)
        );
    
  
    // --- SLL and SRL Instruction --- //  
     shifter #32 shifter (
            .shamt          (instr[10:6]),
            .sel            (sl_sr_sel),
            .d              (wd_dm),
            .y              (shift)
        );
           
    // --- MFHI or MFLO--- // 
    mux2 #(32) Hi_Lo_mux (
            .sel            (hi_lo_sel),
            .a              (mfhi),
            .b              (mflo),
            .y              (mult_out)
        );
        
  // --- Mult or Shift--- // 
    mux2 #(32) mult_shift_mux (
            .sel            (mult_shift_sel),
            .a              (mult_out),
            .b              (shift),
            .y              (mult_shift)
        );    

    // --- RF_WD or JAL--- //      
    mux2 #(32) rf_wd_jal_mux (
            .sel            (rf_wd_jal_sel),
            .a              (mux_alu_dm),
            .b              (pc_plus4),
            .y              (mux_alu_dm_jal)
        );
     
     // --- (RF_WD or JAL) or MULT/Shift--- //    
    mux2 #(32) rf_wd_jal_mult_shift (
            .sel            (rf_mult_shift_wd_sel),
            .a              (mux_alu_dm_jal),
            .b              (mult_shift),
            .y              (wd_rf)
        );         
    
    
    mux2 #(5) rf_wa_jal (
            .sel            (rf_wa_jal_sel),
            .a              (rf_out),
            .b              (5'd31),
            .y              (rf_wa)
        );
 
endmodule