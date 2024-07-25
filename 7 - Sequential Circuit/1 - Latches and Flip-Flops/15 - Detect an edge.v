module top_module (
    input clk,
    input [7:0] in,
    output [7:0] pedge
); 
//detect when the input signal changes from 0 in one clock cycle to 1 
    reg [7:0]store_data;
    always @(posedge clk)begin
		store_data <= in;
        pedge <= (~store_data) & in;
    end
endmodule
