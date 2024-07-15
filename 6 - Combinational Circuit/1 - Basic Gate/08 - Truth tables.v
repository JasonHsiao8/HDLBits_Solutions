module top_module( 
    input x3,
    input x2,
    input x1,  // three inputs
    output f   // one output
);
    //simplify the circuit by using k maps
    assign f = (~x3&x2) | (x1&x3);
endmodule
