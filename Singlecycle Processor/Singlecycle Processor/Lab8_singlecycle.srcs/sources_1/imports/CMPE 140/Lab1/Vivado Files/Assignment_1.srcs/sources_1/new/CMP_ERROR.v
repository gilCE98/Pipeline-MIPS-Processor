`timescale 1ns / 1ps
module CMP(input [3:0] A,B, output reg error);
always @(*) begin
if ( B > A)
error = 1;
else
error = 0;
end
endmodule