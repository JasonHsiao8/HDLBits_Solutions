module top_module ( input [1:0] A, input [1:0] B, output z ); 
    assign z = (A == B);
endmodule
//It is wrong if used the logical opearator && cause 邏輯與（&&）：對2個運算元進行邏輯與，如果二者同不為0，則結果為1，否則為0。
