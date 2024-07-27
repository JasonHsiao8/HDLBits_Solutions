module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);
    reg [31:0]data;
    integer i;
    always@(posedge clk)begin // (<=) means synchronous
        data <= in; // store the current input
        for(i = 0;i < 32; i++)begin
            case({data[i] & (~in[i]),reset}) // capture when the input signal changes from 1 in one clock cycle to 0 the next 1 -> 0(data = 1, in = 0)
                2'b00 : out[i] <= out[i];
                2'b01, 2'b11 : out[i] <= 1'b0; // reset
                2'b10 : out[i] <= 1'b1;
            endcase
        end
    end
endmodule
