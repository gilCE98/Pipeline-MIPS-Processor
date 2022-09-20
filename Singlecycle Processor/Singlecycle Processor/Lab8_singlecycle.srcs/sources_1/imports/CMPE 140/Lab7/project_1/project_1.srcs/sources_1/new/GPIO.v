`timescale 1ns / 1ps
module GPIO(
        input   wire    [1:0]   A,
        input   wire            WE,
        input   wire    [31:0]  gpI1, gpI2,
        input   wire    [31:0]  WD,
        input   wire            Rst, Clk,
        output          [31:0]  gpO1, gpO2, 
        output          [31:0]  RD
    );
    
    wire            WE1, WE2;
    wire    [1:0]   RdSel;
    
    gpio_ad gpio_ad (
        .A(A),
        .WE(WE),
        .WE1(WE1),
        .WE2(WE2),
        .RdSel(RdSel)
    );
    
    fact_reg gpO1_reg (
        .D(WD),
        .Clk(Clk),
        .Rst(Rst),
        .Load_Reg(WE1),
        .Q(gpO1)
    );
    
    fact_reg gpO2_reg (
        .D(WD),
        .Clk(Clk),
        .Rst(Rst),
        .Load_Reg(WE2),
        .Q(gpO2)
    );
    
    mux_4 gpio_mux4(
        .A(gpI1),
        .B(gpI2),
        .C(gpO1),
        .D(gpO2),
        .RdSel(RdSel),
        .RD(RD)
    );
endmodule