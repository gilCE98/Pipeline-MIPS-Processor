`timescale 1ns / 1ps
module MUX(input [31:0] in0, in1, input sel, output reg [31:0] out);
always @ (in0, in1, sel)
begin
if (sel)
out = in1;
else
out = in0;
end
endmodule