`timescale 1ns / 1ps
module REG( input [31:0] D, input clk, load_register, output reg [31:0] Q );
always @ (posedge clk)
if(load_register)
Q <= D;
else
Q <= Q;
endmodule