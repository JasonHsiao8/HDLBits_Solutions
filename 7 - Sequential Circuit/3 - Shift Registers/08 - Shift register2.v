module top_module (
    input [3:0] SW,
    input [3:0] KEY, //clk to KEY[0], E to KEY[1], L to KEY[2], w to KEY[3]
    output [3:0] LEDR
); //Connect the R inputs to the SW switches
    MUXDFF mux0(KEY[0], KEY[1], KEY[2], LEDR[1], SW[0], LEDR[0]);
    MUXDFF mux1(KEY[0], KEY[1], KEY[2], LEDR[2], SW[1], LEDR[1]);
    MUXDFF mux2(KEY[0], KEY[1], KEY[2], LEDR[3], SW[2], LEDR[2]);
    MUXDFF mux3(KEY[0], KEY[1], KEY[2], KEY[3], SW[3], LEDR[3]);
    // MUXDFF obj[3:0]({4{clk}}, {4{E}}, {4{L}}, {w, LEDR[3:1]}, R, LEDR);
endmodule

module MUXDFF (
	input clk,
    input E,
    input L,
    input W,
    input R,
    output Q);
    //00 Q, 10 w, 01 11 R
    always @(posedge clk)begin
        Q <= L ? R:(E?W:Q);
    end
endmodule
