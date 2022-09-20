module factorial_datapath( 
input [3:0] n, 
input load_counter, 
input enable,
input load_register,
input sel1,
input sel2,
input clk,
output [31:0] out1, 
output GT,
output error );

wire [31:0] counter_out;
wire [31:0] mux_out;
wire [31:0] reg_out;
wire [31:0] mul_out;

CMP C1(.A(4'b1100),.B(n),.error(error));

CMP1 C2(.A(32'h00000001), .B(counter_out), .GT(GT));

Counter C3(.D(n), .load_counter(load_counter), .enable(enable), .clk(clk),.Q(counter_out));

MUL C4(.X(counter_out), .Y(reg_out),.Z(mul_out));

MUX C5(.in0(1), .in1(mul_out), .sel(sel1), .out(mux_out));

MUX C6(.in0(0),.in1(reg_out),.sel(sel2),.out(out1));

REG C7 (.D(mux_out),.clk(clk), .load_register(load_register) ,.Q(reg_out));
endmodule