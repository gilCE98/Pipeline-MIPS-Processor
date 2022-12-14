module SOC_Decoder(
        input   wire            WE,
        input   wire    [31:0]  A,
        output  reg             WE1, WE2, WEM,
        output  reg     [1:0]   RdSel
    );
    
    always @ (*) begin
        if (A >= 32'h0 && A <= 32'hFC) begin
            WEM = WE;
            WE1 = 0;
            WE2 = 0;
            RdSel = 2'b00;
        end
        else if (A >= 32'h800 && A <= 32'h80C) begin
            WEM = 0;
            WE1 = WE;
            WE2 = 0;
            RdSel = 2'b10;
        end
        else if (A >= 32'h900 && A <= 32'h90C) begin
            WEM = 0;
            WE1 = 0;
            WE2 = WE;
            RdSel = 2'b11;
        end
        else begin
            WEM = 0;
            WE1 = 0;
            WE2 = 0;
            RdSel = 2'b00;
        end
    end
endmodule