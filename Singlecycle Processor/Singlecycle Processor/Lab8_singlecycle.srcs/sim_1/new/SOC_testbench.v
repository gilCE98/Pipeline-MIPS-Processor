module SOC_testbench;

reg clk,rst;
reg [31:0] gpI1,gpI2;
reg [4:0] ra3;
wire we_dm;
wire [31:0] pc_current,instr, alu_out, wd_dm,rd_dm,gpO1,gpO2,rd3;

SingleCycle_SOC S1 (
        .clk(clk),
        .rst(rst),
        .ra3(ra3),
        .gpI1(gpI1),
        .gpI2(gpI2),
        .we_dm(we_dm),
        .pc_current(pc_current),
        .instr(instr),
        .alu_out(alu_out),
        .wd_dm(wd_dm),
        .rd_dm(rd_dm),
        .rd3(rd3),
        .gpO1(gpO1),
        .gpO2(gpO2)
        
        );
        
        task tick;
        begin 
        clk = 0;
        #5;
        clk = 1;
        #5;
        end
        endtask
        
        initial begin
        gpI1 = 32'b10011;
        rst = 1'b0; #5;
        rst = 1'b1; #5;
        rst = 1'b0;
        tick;
        gpI2 = gpO2;
        tick;
        
        while(pc_current != 32'h40) tick;
        end
endmodule