module top_module (
    input clk,
    input reset,
    output OneHertz,
    output [2:0] c_enable
); //
    wire [3:0]w1, w10, w100;
    assign c_enable = (w1 == 4'd9 && w10 == 4'd9,w1 == 4'd9,1'b1); //(enable counter2 start counting, counter1 start counting, counter0 count) 
    assign OneHertz = (w1 == 4'd9 && w10 == 4'd9 && w100 == 4'd9); // 999 + 1 times
    
    bcdcount counter0 (clk, reset, c_enable[0], w1);
    bcdcount counter1 (clk, reset, c_enable[1], w10);
    bcdcount counter2 (clk, reset, c_enable[2], w100); 
//題目給了一個 BCD 計數器模組 bcdcount，但只能計算到 10 ，因此要分為 w1 w10 w100 三個權重，作為進位累積的基準。
//當計數來到 999 (0~999 共 1000) 時就輸出 OneHertz 為 1 。
//Enable must be high for the counter to run.
endmodule
/*module bcdcount (
	input clk,
	input reset,
	input enable,
	output reg [3:0] Q
);*/
