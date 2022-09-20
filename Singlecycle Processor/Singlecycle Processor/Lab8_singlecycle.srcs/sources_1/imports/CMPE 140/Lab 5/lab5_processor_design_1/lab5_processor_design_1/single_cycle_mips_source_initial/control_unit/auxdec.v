module auxdec (
        input  wire [1:0] alu_op,
        input  wire [5:0] funct,
        output wire [2:0] alu_ctrl,
        output wire rf_mult_shift_wd_sel,
        output wire mult_shift_sel,
        output wire hi_lo_sel,
        output wire pc_jr_sel,
        output wire sl_sr_sel,
        output wire we
    );

    reg [9:0] ctrl;

    assign {alu_ctrl,hi_lo_sel,mult_shift_sel,rf_mult_shift_wd_sel,we,pc_jr_sel,sl_sr_sel} = ctrl;

    always @ (alu_op, funct) begin
        case (alu_op)
            2'b00: ctrl = 9'b010_0_0_0_0_0_0;          // ADD
            2'b01: ctrl = 9'b110_0_0_0_0_0_0;          // SUB
            default: case (funct)
                6'b10_0100: ctrl = 9'b000_0_0_0_0_0_0; // AND
                6'b10_0101: ctrl = 9'b001_0_0_0_0_0_0; // OR
                6'b10_0000: ctrl = 9'b010_0_0_0_0_0_0; // ADD
                6'b10_0010: ctrl = 9'b110_0_0_0_0_0_0; // SUB
                6'b10_1010: ctrl = 9'b111_0_0_0_0_0_0; // SLT
                
                6'b01_1001: ctrl = 9'b000_0_0_0_1_0_0; // MULTU
                6'b01_0000: ctrl = 9'b000_0_0_1_0_0_0; // MFHI
                6'b01_0010: ctrl = 9'b000_1_0_1_0_0_0; // MFLO
                6'b00_1000: ctrl = 9'b000_0_0_0_0_1_0; // JR
                6'b00_0000: ctrl = 9'b000_0_1_1_0_0_0; // SLL
                6'b00_0010: ctrl = 9'b000_0_1_1_0_0_1; // SLR
                
                default:    ctrl = 9'bxxx_x;
            endcase
        endcase
    end

endmodule