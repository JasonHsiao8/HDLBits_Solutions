module top_module (
    input clk,
    input enable,
    input S,
    input A, B, C,
    output Z ); 
    
    reg [7:0]temp;
    always @(posedge clk)begin
        if(enable) temp <= {temp[6:0], S};
        else temp <= temp;
    end
    assign Z = temp[{A,B,C}];
endmodule
//S, which feeds the input of Q[0] (MSB is shifted in first)
//enable input controls whether to shift
