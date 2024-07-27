module top_module (
    input clk,
    input reset,
    output [3:0] q);
	
    always @(posedge clk)begin
      if(q == 4'd10 || reset) q <= 4'd1; // q is 4 bits, reset is 1 bit so we have to use || instead of | 
        else q <= q + 4'd1;
    end
endmodule
