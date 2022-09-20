`timescale 1ns / 1ps

module mux_4(
    input wire [31:0] A,
    input wire [31:0] B,
    input wire [31:0] C,
    input wire [31:0] D,
    input wire [1:0] RdSel,
    output reg [31:0] RD
    );
    
    always @(*)
    begin
    case(RdSel)
        2'b00: RD = A;
        2'b01: RD = B;
        2'b10: RD = C;
        2'b11: RD = D;
       default: RD = {31{1'bx}};
    endcase
    end
endmodule
