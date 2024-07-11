module top_module (
    input [7:0] in,
    output parity); 
//We will use "even" parity, where the parity bit is just the XOR of all 8 data bits 
//to check whether the transmitting data is correct or not
    
    assign parity = ^ in;
endmodule
/*& a[3:0]     // AND: a[3]&a[2]&a[1]&a[0]. Equivalent to (a[3:0] == 4'hf)
| b[3:0]     // OR:  b[3]|b[2]|b[1]|b[0]. Equivalent to (b[3:0] != 4'h0)
^ c[2:0]     // XOR: c[2]^c[1]^c[0]*/
