// synthesis verilog_input_version verilog_2001
/* 若A>B, Out = A 反之 若A<=B, Out = B 
Out = ( A>B ) ? A : B;
使用if-else 
If( A>B )
    Out = A;
else
    Out = B; */
module top_module(
    input a,
    input b,
    input sel_b1,
    input sel_b2,
    output wire out_assign,
    output reg out_always   ); 
	
    assign out_assign = (sel_b1 == 1'b1 && sel_b2 == 1'b1) ? b : a;
    
    always @(*)begin
        if(sel_b1 == 1'b1 && sel_b2 == 1'b1)
            out_always = b;
        else
            out_always = a;
    end
endmodule
