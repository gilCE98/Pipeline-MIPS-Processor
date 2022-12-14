module controlunit (
        input  wire [5:0]  opcode,
        input  wire [5:0]  funct,
        output wire        branch,
        output wire        jump,
        output wire        reg_dst,
        output wire        we_reg,
        output wire        alu_src,
        output wire        we_dm,
        output wire        dm2reg,
        output wire [2:0]  alu_ctrl,
        output wire rf_mult_shift_wd_sel,
        output wire mult_shift_sel,
        output wire hi_lo_sel,
        output wire pc_jr_sel,
        output wire sl_sr_sel,
        output wire we,
        output wire       rf_wd_jal_sel,
        output wire       rf_wa_jal_sel      
    );
    
    wire [1:0] alu_op;

    maindec md (
        .opcode         (opcode),
        .branch         (branch),
        .jump           (jump),
        .reg_dst        (reg_dst),
        .we_reg         (we_reg),
        .alu_src        (alu_src),
        .we_dm          (we_dm),
        .dm2reg         (dm2reg),
        .rf_wa_jal_sel  (rf_wa_jal_sel),
        .rf_wd_jal_sel  (rf_wd_jal_sel),
        .alu_op         (alu_op)
    );

    auxdec ad (
        .alu_op         (alu_op),
        .funct          (funct),
        .alu_ctrl       (alu_ctrl),
        .rf_mult_shift_wd_sel(rf_mult_shift_wd_sel),
        .mult_shift_sel(mult_shift_sel),
        .hi_lo_sel(hi_lo_sel),
        .pc_jr_sel(pc_jr_sel),
        .sl_sr_sel(sl_sr_sel),
        .we(we)
    );

endmodule