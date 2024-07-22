module top_module (
    input clk,
    input resetn,
    input [1:0] byteena,
    input [15:0] d,
    output [15:0] q
);
    always @(posedge clk)begin
        if(resetn == 0) q <= 0;
        else begin
            case(byteena)
                //if enable equal to 0 means q is "no change"
                2'b00 : q <= q;
                2'b01 : q[7:0] <= d[7:0];
                2'b10 : q[15:8] <= d[15:8];
                2'b11 : q <= d;
            endcase
        end
    end
endmodule