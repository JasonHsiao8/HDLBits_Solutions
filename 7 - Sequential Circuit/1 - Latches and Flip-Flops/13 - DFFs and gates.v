module top_module (
    input clk,
    input x,
    output z
); 
    reg r1, r2, r3;
    always @(posedge clk)begin
        r1 <= x ^ r1;
        r2 <= x & (~r2);
        r3 <= x | (~r3);
    end
    assign z = ~(r1|r2|r3);
endmodule
