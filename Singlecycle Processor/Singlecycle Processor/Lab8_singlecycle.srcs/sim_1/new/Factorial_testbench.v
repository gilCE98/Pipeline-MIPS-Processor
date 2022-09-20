`timescale 1ns / 1ps

module Factorial_testbench;
    reg     [1:0]   A_tb;
    reg             WE_tb;
    reg     [3:0]   WD_tb;
    reg             Rst_tb;
    reg             Clk_tb;
    wire    [31:0]  RD_tb;
    integer i;


    task tick;
        begin
            Clk_tb = 0; #1;
            Clk_tb = 1; #1;
        end   
    endtask
    
    fact_top DUT1 (
        .A(A_tb),
        .WE(WE_tb),
        .WD(WD_tb),
        .Rst(Rst_tb),
        .Clk(Clk_tb),
        .RD(RD_tb)
    );

    initial begin
        
        Rst_tb = 1;
        tick;
        Rst_tb = 0;
       
        for (i=0; i<14; i=i+1) begin

            WD_tb = i;
            WE_tb = 1;
            A_tb = 2'b00;
            tick;
            
            WD_tb = 1;
            A_tb = 2'b01;
            tick;
            
            A_tb = 2'b10;
            tick;
            while (RD_tb == 0)
            begin
            tick;
            end
            
            if(RD_tb == 1)
            begin
            A_tb = 2'b11;
            tick;
            end
            
            if(RD_tb == 2)
            begin
            $display("Error", i);
            tick;
            end
 
            Rst_tb = 0;
            WD_tb = 0;
            A_tb = 0;
            tick;
        end
    end
endmodule
