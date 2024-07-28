module top_module (
    input clk,
    input reset,
    input enable,
    output [3:0] Q,
    output c_enable,
    output c_load,
    output [3:0] c_d
); 
    assign c_enable = enable; // enable = 0 -> stay current state
    assign c_load = reset || (Q == 12 && enable == 1);//重置
    assign c_d = {{3{1'b0}}, c_load};
    count4 the_counter (clk, c_enable, c_load, c_d, Q);
	// c_enable 的功能等同上題的 slowena，藉此判斷是否要重置( 即 c_load )，並歸位為 c_d 。
endmodule

/*module count4(
	input clk,
	input enable,
	input load,
	input [3:0] d,
	output reg [3:0] Q
);*/
