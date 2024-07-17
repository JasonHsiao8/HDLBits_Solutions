module top_module ( input a, input b, output out );
	//module mod_a ( input in1, input in2, output out );
    // module content
	//endmodule
	mod_a instance1(.in1(a), .in2(b), .out(out)); // a, b, out are the external signal which are outside the module

endmodule
