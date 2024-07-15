module top_module (
    input ring,
    input vibrate_mode,
    output ringer,       // Make sound
    output motor         // Vibrate
);
	assign ringer =  ~vibrate_mode & ring;
    assign motor = vibrate_mode & ring;
endmodule
//Try to use only assign statements
//軟體寫法為照著題目敘述寫條件，硬體寫法從輸出推輸入之間的關係
