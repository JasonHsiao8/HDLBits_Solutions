module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
); 
    wire w1, w2;
    wire[15:0]sel1, sel2;
    add16 mod1(.a(a[15:0]), .b(b[15:0]), .cin(0), .sum(sum[15:0]), .cout(w1));//lower bits 15~0
    add16 mod2(.a(a[31:16]), .b(b[31:16]), .cin(0), .sum(sel1), .cout(w2));//higher bits with carry 0
    add16 mod3(.a(a[31:16]), .b(b[31:16]), .cin(1), .sum(sel2), .cout(w2));//higher bits with carry 1
    
    always @(*) begin
        case(w1)
            0 : sum[31:16] = sel1;
            1 : sum[31:16] = sel2;
        endcase
    end
endmodule
//module add16 ( input[15:0] a, input[15:0] b, input cin, output[15:0] sum, output cout );
