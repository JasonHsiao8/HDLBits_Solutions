module top_module (
    input clk,
    input resetn,   // synchronous reset
    input in,
    output out);
    reg [3:0]R;
    always @(posedge clk)begin
        R <= (resetn) ? {in, R[3:1]}: 4'd0;
    end
    assign out = R[0]; 
endmodule
