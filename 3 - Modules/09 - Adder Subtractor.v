//The net result is a circuit that can do two operations: (a + b + 0) and (a + ~b + 1)
module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire w1, w2;
    wire [31:0]b_xor;
    //An XOR gate can also be viewed as a programmable inverter, where one input controls whether the other should be inverted. 
    
    assign b_xor = b ^ {32{sub}};
    add16 adder1(.a(a[15:0]), .b(b_xor[15:0]), .cin(sub), .sum(sum[15:0]), .cout(w1));
    add16 adder2(.a(a[31:16]), .b(b_xor[31:16]), .cin(w1), .sum(sum[31:16]), .cout(w2));
endmodule
//module add16 ( input[15:0] a, input[15:0] b, input cin, output[15:0] sum, output cout )
