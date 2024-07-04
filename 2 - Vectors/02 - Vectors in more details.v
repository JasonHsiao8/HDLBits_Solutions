`default_nettype none     // Disable implicit nets. Reduces some types of bugs.
                          // if we don't have this sentence, there would be an implicit wire when we assign a statement without declaration
module top_module( 
    input wire [15:0] in,
    output wire [7:0] out_hi,
    output wire [7:0] out_lo );
    assign out_hi = in[15:8]; //lower [7:0] 8bits
    assign out_lo = in[7:0]; //higher [15:8] 8bits (little-endian)
    //The unpacked dimensions are declared after the name. They are generally used to declare memory arrays. 
endmodule
