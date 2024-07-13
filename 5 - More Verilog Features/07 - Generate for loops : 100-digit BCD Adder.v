//BCD one-digit adder named bcd_fadd that adds two BCD digits and carry-in, and produces a sum and carry-out.
/*module bcd_fadd (
    input [3:0] a,
    input [3:0] b,
    input     cin,
    output   cout,
    output [3:0] sum );*/
module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );
	
    genvar i;
    wire [99:0]coutw100; //declare a wire which store the value of each onedigit FA's cout
    bcd_fadd BCD_FA(.a(a[3:0]), .b(b[3:0]), .cin(cin), .cout(coutw100[0]), .sum(sum[3:0]));
    generate 
        for(i = 4; i < 400; i = i + 4)begin : bcd_100_digit_adder
            bcd_fadd BCD_FA(a[i+3:i], b[i+3:i], coutw100[i/4-1], coutw100[i/4], sum[i+3:i]);
        end
    endgenerate
    assign cout = coutw100[99]; 
endmodule
