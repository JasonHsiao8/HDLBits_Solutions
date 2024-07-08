module top_module ( 
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output [7:0] q 
);
    //always 是用來建立電路中必須根據時鐘訊號或其他信號變化來改變狀態的部分
    //@(*) 是 @ 列表的一個簡寫，表示當所有輸入信號發生變化時觸發。
    //module my_dff8 ( input clk, input [7:0] d, output [7:0] q )
    wire [7:0]w1, w2, w3;
    my_dff8 dff1(.clk(clk), .d(d), .q(w1));
    my_dff8 dff2(.clk(clk), .d(w1), .q(w2));
    my_dff8 dff3(.clk(clk), .d(w2), .q(w3));
	
    //若寫成always @(*) 或 always @* 代表always內任一變化即執行敘述
    always @(*) begin
        case(sel)	//根據sel[1:0]選擇輸出的内容(0输入d的值、1第一個Dff後的值、2第二個Dff的值、3第三個Dff的值)
            2'b00 : q = d;
            2'b01 : q = w1;
            2'b10 : q = w2;
            2'b11 : q = w3;
        endcase
	end

endmodule
