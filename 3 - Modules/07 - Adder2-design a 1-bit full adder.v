module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);//
    wire w1,w2;
    add16 adder1(.a(a[15:0]), .b(b[15:0]), .cin(0), .sum(sum[15:0]), .cout(w1));
    add16 adder2(.a(a[31:16]), .b(b[31:16]), .cin(w1), .sum(sum[31:16]), .cout(w2));
endmodule

module add1 ( input a, input b, input cin, output sum, output cout );
// Full adder module here
    assign sum = a ^ b ^ cin;
    assign cout = (a&b)|(b&cin)|(a&cin);

endmodule

//module add16 ( input[15:0] a, input[15:0] b, input cin, output[15:0] sum, output cout );
