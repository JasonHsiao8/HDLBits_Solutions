module top_module( input a, b, c, d, output out, out_n   ); 
	wire line1, line2; // declaration of internal wires
    
    assign line1 = a & b;
    assign line2 = c & d;
    
    assign out = line1 | line2;
    assign out_n = ~out;
endmodule
