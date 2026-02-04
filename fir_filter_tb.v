module FIR_Filter_tb;

reg clk;
reg reset;
reg signed [7:0] x;
wire signed [15:0] y;

FIR_Filter uut (
    .clk(clk),
    .reset(reset),
    .x(x),
    .y(y)
);

// Clock
always #5 clk = ~clk;

initial begin

    clk = 0;
    reset = 1;
    x = 0;

    #10 reset = 0;

    // Input Samples
    #10 x = 5;
    #10 x = 10;
    #10 x = 15;
    #10 x = 20;
    #10 x = 25;
    #10 x = 30;

    #100 $stop;

end

endmodule
