// Suggested answer:
// The concatenation {cout, sum} is a 101-bit vector.
// assign {cout, sum} = a+b+cin;
module top_module( 
    input [99:0] a, b,
    input cin,
    output cout,
    output [99:0] sum );

    wire [99:0] cwire;
    
    onebit_FA FA1(a[0], b[0], cin, cwire[0], sum[0]);
    onebit_FA FA2(a[99], b[99], cwire[98], cout, sum[99]);
    genvar i;
    generate 
        for(i = 1; i < 99; i++)begin:hundredsbitFA
            onebit_FA FA(a[i], b[i], cwire[i-1], cwire[i], sum[i]);
        end
        
    endgenerate
   
endmodule

module onebit_FA(
    input a, b, cin,
    output cout, sum ); 
    
    assign cout = (a&b)|(a&cin)|(b&cin);
    assign sum = a ^ b ^ cin;
endmodule
