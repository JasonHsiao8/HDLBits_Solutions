module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 
    //sum of products(sop)
    //assign out = a | (~a&~b&c);
    
    //product of sums(pos)
    assign out = (a|c)&(a|~b);
endmodule
