module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 
  //sum of products(SOP)
    //assign out = (~a & ~d)|(~b & ~c)|(a & c & d)|(~a & b & c & d);
    
  //product of sum(POS)
    assign out = (~b|c|~d) & (~a|~c|d) & (~a|~b|c) & (a|b|~c|~d);
endmodule
