module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
	 //module add16 ( input[15:0] a, input[15:0] b, input cin, output[15:0] sum, output cout );
    wire w1, w2;
    add16 adder1(.a(a[15:0]), .b(b[15:0]), .cin(0), .sum(sum[15:0]), .cout(w1));
    add16 adder2(.a(a[31:16]), .b(b[31:16]), .cin(w1), .sum(sum[31:16]), .cout(w2)); 
    
    //example:
    //wire con1, con2;
    //add16 adder_1(a[15:0], b[15:0], 0, sum[15:0], con1);
    //add16 adder_2(a[31:16], b[31:16], con1, sum[31:16], con2);
endmodule
