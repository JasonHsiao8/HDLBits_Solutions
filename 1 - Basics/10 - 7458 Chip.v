module top_module ( input p1a, p1b, p1c, p1d, p1e, p1f, output p1y, input p2a, p2b, p2c, p2d, output p2y );
	wire L1, L2, R1, R2; // decalring interior wires
    
    assign L1 = p2a & p2b;
    assign L2 = p2c & p2d;
    assign p2y = L1|L2;
    
    assign R1 = p1a & p1b & p1c;
    assign R2 = p1d & p1e & p1f;
	  assign p1y = R1|R2;
endmodule
