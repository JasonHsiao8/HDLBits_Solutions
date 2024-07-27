module top_module (
    input clk,
    input d,
    output q
);
 	reg r1, r2; // r1 -> record the change when the posedge happened, r2 -> record the change when the negedge happened
    always @(posedge clk)begin
       	r1 <= r2 ^ d;
    end
    
   	always @(negedge clk)begin
       	r2 <= r1 ^ d;
    end
    assign q = r1 ^ r2;
endmodule
