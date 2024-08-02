module top_module(
    input clk,
    input reset,    // Active-high synchronous reset to 5'h1
    output [4:0] q
); 
    always @(posedge clk)begin
        if(reset) q <= 5'b1;
        else begin
            q[4] <= q[0]; //q[0] ^ 0
            q[3] <= q[4]; 
            q[2] <= q[3] ^ q[0];
            q[1] <= q[2];
            q[0] <= q[1];
        end
    end
endmodule
/*賦給暫存器的初始值叫做「種子」，因為線性反饋移位暫存器的運算是確定性的，所以，由暫存器所生成的數據流
完全決定於暫存器當時或者之前的狀態。而且，由於暫存器的狀態是有限的，它最終肯定會是一個重複的循環。然而，
通過本原多項式，線性反饋移位暫存器可以生成看起來是隨機的且循環周期非常長的序列。*/
//The first few states starting at 1 are 00001, 10100, 01010, 00101, ... 
//The LFSR should cycle through 31 states before returning to 00001.
//the LFSR can be made to be "maximum-length". A maximum-length LFSR of n bits cycles through 2n-1 states 
//before repeating (the all-zero state is never reached).
