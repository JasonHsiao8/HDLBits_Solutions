module top_module (
    input [7:0] a, b, c, d,
    output [7:0] min);//
    // assign intermediate_result1 = compare? true: false;
    wire [7:0]min_ab, min_cd;
    assign min_ab = (a < b) ? a : b; // compare a and b
    assign min_cd = (c < d) ? c : d; // compare c and d
    assign min = (min_ab < min_cd) ? min_ab : min_cd; // find the smallest value
endmodule
