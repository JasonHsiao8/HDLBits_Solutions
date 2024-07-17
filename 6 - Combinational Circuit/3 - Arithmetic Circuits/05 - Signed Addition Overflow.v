module top_module (
    input [7:0] a,
    input [7:0] b,
    output [7:0] s,
    output overflow
); //
// A signed overflow occurs when adding two positive numbers produces a negative result,
// or adding two negative numbers produces a positive result.
	assign s = a + b;
    assign overflow = (a[7] && b[7] && ~s[7]) || (~a[7] && ~b[7] && s[7]); // && means if one of the value equal 0 then output 0.
    				//(1, 1, 0) || (0, 0, 1)
endmodule
