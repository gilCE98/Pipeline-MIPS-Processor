module hiloregister # (parameter WIDTH = 32) (
        input  wire             clk,
        input  wire             we,
        input  wire [WIDTH-1:0] d,
        output reg  [WIDTH-1:0] q
    );

    always @ (posedge clk) begin
        if (we) q <= d;
        else     q <= q;
    end
endmodule