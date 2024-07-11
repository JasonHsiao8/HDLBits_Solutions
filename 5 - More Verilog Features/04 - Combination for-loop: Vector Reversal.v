module top_module( 
    input [99:0] in,
    output [99:0] out
);
    //變數通常宣告成integer的型態
    integer i;
    always @(*) begin
        for(i = 0; i < 100; i = i + 1)begin
            out[99-i] = in[i];
        end
    end
endmodule
