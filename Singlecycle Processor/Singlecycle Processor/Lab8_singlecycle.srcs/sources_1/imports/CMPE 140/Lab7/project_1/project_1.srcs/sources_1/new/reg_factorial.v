module reg_factorial(input clk, rst, gopulsecmb, signal,
                     output reg Res);
              
always @(posedge clk, posedge rst) begin

if(rst)
    Res <= 1'b0;
else
    Res <= (~gopulsecmb) & (signal|Res);
end
endmodule

