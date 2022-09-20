module shifter # (parameter WIDTH = 32) (
        input   wire [4:0]       shamt,
        input   wire             sel,
        input   wire [WIDTH-1:0] d,
        output  reg  [WIDTH-1:0] y
    );
    
    always @ (*) begin
        if  (sel)  y = d >> shamt;
        else            y = d << shamt;
    end

endmodule
