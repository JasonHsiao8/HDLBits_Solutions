module top_module( 
    input [1023:0] in,
    input [7:0] sel,
    output [3:0]out );

    always @(*)begin
       
        out = in[sel*4 +: 4];
        //out = in[(sel*4)+3 -: 4];
    end
    //r_BCD[r_Digit_Index*4 + 3:r_Digit_Index*4] is not allowed. (means it couldn't prove that the select width is constant)
    //Since 2001 you can do variable part-select using the special +: syntax.
	//for example :
    //r_BCD[r_Digit_Index*4 +: 4] 
   //[ index          +: width] 
endmodule
