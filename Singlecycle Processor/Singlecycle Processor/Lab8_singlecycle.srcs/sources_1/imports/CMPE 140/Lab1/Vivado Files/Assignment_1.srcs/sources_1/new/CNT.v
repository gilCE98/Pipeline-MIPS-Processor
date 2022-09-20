`timescale 1ns / 1ps
module Counter( input [3:0] D, input load_counter,enable,clk,
output reg [31:0] Q);
always @(posedge clk) begin
if(enable) begin
if(load_counter)
Q <= D;
else
Q <= Q -1;
end else
Q <= Q;
end
endmodule