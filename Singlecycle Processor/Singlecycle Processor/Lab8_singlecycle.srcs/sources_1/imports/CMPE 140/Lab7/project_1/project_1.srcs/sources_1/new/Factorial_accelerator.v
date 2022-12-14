`timescale 1ns / 1ps

module fact_top(
        input   wire    [1:0]   A,
        input   wire            WE,        
        input   wire    [3:0]   WD,
        input   wire            Rst,
        input   wire            Clk,
        output          [31:0]  RD
    );
    
    wire        WE1, WE2;
    wire [1:0]  RdSel;
    wire [3:0]  n;
    wire        Go;
    wire        GoPulseCmb;
    wire        GoPulse;
    wire [31:0] nf;
    wire        Done;
    wire [31:0] Result;
    wire        Err;
    wire        ResDone, ResErr;
    
    Ad_decoder fact_ad (
        .A(A),
        .WE(WE),
        .WE1(WE1),
        .WE2(WE2),
        .RdSel(RdSel)
    );
    
    fact_reg #(4) n_register (
        .Clk(Clk),
        .Rst(Rst),
        .D(WD),
        .Load_Reg(WE1),
        .Q(n)
    );
    
    fact_reg #(1) go_register (
        .Clk(Clk),
        .Rst(Rst),
        .D(WD[0]),
        .Load_Reg(WE2),
        .Q(Go)
    );
    
    fact_reg #(1) go_pulse_reg (
        .Clk(Clk),
        .Rst(Rst),
        .D(GoPulseCmb),
        .Load_Reg(1'b1),
        .Q(GoPulse)    
    );
    
    fact_reg #(32) result_reg (
        .Clk(Clk),
        .Rst(Rst),
        .D(nf),
        .Load_Reg(Done),
        .Q(Result)        
    );
    
    Factorial factorial (
        .go(GoPulse),
        .clk(Clk),
        .n(n),
        .done(Done),
        .error(Err),
        .product(nf)
    );

    factorial_and fact_and (
        .a(WE2),
        .b(WD[0]),
        .c(GoPulseCmb)
    );
    
    fact_mux4 fact_mux4 (
        .RdSel(RdSel),
        .n(n),
        .Go(Go),
        .ResDone(ResDone),
        .ResErr(ResErr),
        .Result(Result),
        .RD(RD)
    );
    
    reg_factorial done (
        .clk(Clk),
        .rst(Rst),
        .gopulsecmb(GoPulseCmb),
        .signal(Done),
        .Res(ResDone)
    );
    
    reg_factorial error (
        .clk(Clk),
        .rst(Rst),
        .gopulsecmb(GoPulseCmb),
        .signal(Err),
        .Res(ResErr)
    );
endmodule


