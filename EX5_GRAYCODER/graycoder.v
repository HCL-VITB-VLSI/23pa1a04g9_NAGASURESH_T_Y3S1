module graycoder(
    input clk,         // Clock signal
    input [3:0] bin_in, // Binary input
    output reg [3:0] gray_out // Gray code output
);

// Trigger on the rising edge of the clock
always @(posedge clk) begin
    // Generate Gray code
    gray_out[3] <= bin_in[3]; // MSB remains the same
    gray_out[2] <= bin_in[3] ^ bin_in[2]; // XOR operation
    gray_out[1] <= bin_in[2] ^ bin_in[1]; // XOR operation
    gray_out[0] <= bin_in[1] ^ bin_in[0]; // XOR operation
end

endmodule

