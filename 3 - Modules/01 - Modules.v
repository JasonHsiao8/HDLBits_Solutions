module top_module ( input a, input b, output out );
	//module mod_a ( input in1, input in2, output out );
    // module content
	//endmodule
  mod_a instance1(.in1(a), .in2(b), .out(out)); // a, b, out為來自module外部的信號

endmodule
