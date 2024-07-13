module top_module (
    input in1,
    input in2,
    input in3,
    output out);
    
	wire w12;
    assign w12 = ~(in1 ^ in2);
    assign out = w12 ^ in3;
    
endmodule
