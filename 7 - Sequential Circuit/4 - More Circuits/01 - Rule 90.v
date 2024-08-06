module top_module(
    input clk,
    input load,
    input [511:0] data,
    output [511:0] q ); 
    //(The name "Rule 90" comes from reading the "next state" column: 01011010 is decimal 90.)
    integer i;
    always @(posedge clk)begin
        if(load) q <= data;
        else begin
            for(i=1;i<511;i++)begin
                q[i] <= q[i-1] ^ q[i+1];
            end
            q[0] <= q[1]; // q[0] = q[1]^q[-1](0) = q[1]
            q[511] <= q[510]; // q[511] = q[510]^q[512](0) = q[512]
        end
    end
endmodule
//center's next state = left right do XOR
//There is a one-dimensional array of cells (on or off). At each time step, the next state of each
//cell is the XOR of the cell's two current neighbours. 
