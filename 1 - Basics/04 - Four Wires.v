module top_module( input a,b,c, output w,x,y,z );
	assign w = a; //When we have multiple assign statements,the order in which they appear in the code doesn't matter
	assign x = b; //assign statements aren't creating wires, they are creating the connections between the 7 wires that already exist.
	assign y = b;
	assign z = c;
endmodule
