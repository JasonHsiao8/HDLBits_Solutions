module top_module(
    input clk,
    input reset,
    input ena,
    output pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss); 
   
    sixty sec(clk, reset, ena, ss);
    sixty min(clk, reset, ena && (ss == 8'h59), mm);
    twelve hr(clk, reset, ena && (mm == 8'h59) && (ss == 8'h59), pm, hh);
//11:59:59 PM advances to 12:00:00 AM, and 12:59:59 PM advances to 01:00:00 PM. There is no 00:00:00.
//reset resets the clock to 12:00 A.M.
//reset has higher priority than enable, and can occur even when not enabled
endmodule

module sixty(
	input clk,
    input reset,
    input ena,
    output [7:0]nn
);
    always @(posedge clk)begin
        if(reset) nn <= 8'd0;
        else if(ena)begin
            if(nn == 8'h59) nn <= 8'd0;
            else if(nn[3:0] == 4'd9)begin
                nn[7:4] <= nn[7:4] + 4'd1;
                nn[3:0] <= 4'd0;
            end
            else nn <= nn + 8'd1;
        end
    end
endmodule

module twelve(
	input clk,
    input reset,
    input ena,
    output pm,
    output [7:0]nn
);
    always @(posedge clk)begin
    	if(reset)begin
    		nn <= 8'h12;
        	pm <= 1'd0;
    	end
        else if(ena)begin
            if(nn == 8'h11)begin
                nn <= 8'h12;
                pm <= ~pm;
        	end
            else if(nn[3:0] == 4'd9)begin
                nn[7:4] <= nn[7:4] + 4'd1;
                nn[3:0] <= 4'd0;
            end
            else if(nn == 8'h12) nn <= 1'h1;
            else nn <= nn + 8'd1;
        end
    end
endmodule
