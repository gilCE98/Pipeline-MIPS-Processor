`timescale 1ns / 1ps
module Factorial(
input wire go, clk, rst, input wire [3:0]n,
output wire done, error, output wire [31:0]product);

wire load_counter,enable, load_register,sel1, sel2,DP_error,GT;

factorial_datapath DP0(
    .n(n),
    .clk(clk),
    .enable(enable),
    .sel1(sel1),
    .sel2(sel2),
    .load_register(load_register),
    .load_counter(load_counter),
    .out1(product),
    .GT(GT),
    .error(DP_error));

CU CU0(
    .go(go),
    .clk(clk),
    .GT(GT),
    .DP_error(DP_error),
    .load_cnt(load_counter),
    .en(enable),
    .load_reg(load_register),
    .sel1(sel1),
    .sel2(sel2),
    .done(done),
    .CU_error(error)
);
endmodule