module top_module (
    input clk,
    input [7:0] in,
    output [7:0] anyedge
);
	reg [7:0]data;
	always @(posedge clk)begin
    	data <= in;
        anyedge <= data ^ in;
    end
endmodule

