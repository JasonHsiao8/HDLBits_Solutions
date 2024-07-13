module onebit_FA(
    input a, b,
    input cin,
    output cout, sum);
    
    assign sum = a ^ b ^ cin;
    assign cout = (a&b) | (a&cin) | (b&cin);
endmodule

module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );

    onebit_FA FA1(a[0],b[0],cin,cout[0],sum[0]);
    
    //this is a generte block
    //The loop generate construct provides an easy and concise method to create multiple instances 
    //of module items such as module instances, assign statements, assertions, interface instances 
    //In essence generate block is a special type of for loop with the loop index variable of datatype genvar.
    genvar i;
    generate 
        for(i = 1; i < 100; i++)begin: FA_block //generate block needs a label in order to indicate the instantial name of for-loop
            onebit_FA FA(.a(a[i]), .b(b[i]), .cin(cout[i-1]), .cout(cout[i]), .sum(sum[i]));
        end
    endgenerate
endmodule
