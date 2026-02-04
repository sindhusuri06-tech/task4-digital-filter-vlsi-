module FIR_Filter (
    input clk,
    input reset,
    input signed [7:0] x,        // Input signal
    output reg signed [15:0] y   // Output signal
);

// Filter Coefficients
parameter signed [7:0] h0 = 2;
parameter signed [7:0] h1 = 4;
parameter signed [7:0] h2 = 4;
parameter signed [7:0] h3 = 2;

// Delay Registers
reg signed [7:0] d0, d1, d2, d3;

always @(posedge clk) begin
    if(reset) begin
        d0 <= 0;
        d1 <= 0;
        d2 <= 0;
        d3 <= 0;
        y  <= 0;
    end
    else begin
        // Shift Register
        d3 <= d2;
        d2 <= d1;
        d1 <= d0;
        d0 <= x;

        // FIR Equation
        y <= (h0*d0) + (h1*d1) + (h2*d2) + (h3*d3);
    end
end

endmodule
