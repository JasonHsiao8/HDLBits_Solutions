module top_module( 
    input a, b, sel,
    output out ); 
    //多路復用器，可以從多個類比或數位輸入訊號中選擇一個訊號進行輸出的元件，一個有2n 輸入端的數據多工器有n個可選擇的輸入－輸出線路
	assign out = sel? b:a;
endmodule
