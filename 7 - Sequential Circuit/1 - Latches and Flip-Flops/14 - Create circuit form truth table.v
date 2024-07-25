module top_module (
    input clk,
    input j,
    input k,
    output Q);
    
    wire [1:0]w1;
    assign w1 = {j,k};
    always @(posedge clk)begin
        case(w1)
            2'b00 : Q <= Q; // 1 : Q <= Q;
            2'b01 : Q <= 0;
            2'b10 : Q <= 1;
            2'b11 : Q <= ~Q;
        endcase
    end
endmodule
