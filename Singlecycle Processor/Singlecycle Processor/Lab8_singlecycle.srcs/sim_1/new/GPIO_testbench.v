`timescale 1ns / 1ps
module GPIO_testbench;

reg [1:0] A;
reg clk, rst, WE;
reg [31:0] gpI1,gpI2, WD;

wire [31:0] gpO1, gpO2, RD;

    task tick;
        begin
            clk = 0; #1;
            clk = 1; #1;
        end   
    endtask
GPIO G1 (
    .A(A),
    .WE(WE),
    .gpI1(gpI1),
    .gpI2(gpI2),
    .WD(WD),
    .Rst(rst),
    .Clk(clk),
    .gpO1(gpO1),
    .gpO2(gpO2),
    .RD(RD)
    );
    
    initial begin
    begin
    
    rst = 1;
    tick;
    rst = 0;
    
    WE = 1;
    
    WD = 3;
    gpI1 = 5;
    gpI2 = 7;
    
    A = 2'b00;
    tick;
    
    A = 2'b01;
    tick;
    
     A = 2'b10;
    tick;
    
    A = 2'b11;
    tick;
    
    end
    end
    
endmodule