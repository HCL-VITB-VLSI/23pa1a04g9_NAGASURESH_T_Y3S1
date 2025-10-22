// Define a module for a serial-to-parallel converter
module ByteStreamer(
    input clk,         // Clock input
    input shift_enable, // Shift enable input
    input serial_in,   // Serial input
    output [7:0] parallel_out // Parallel output
);

// Define a shift register
reg [7:0] shift_reg;

// Always block to handle shift operation
always @(posedge clk) begin
    if (shift_enable) begin
        // Shift in the serial data
        shift_reg <= {shift_reg[6:0], serial_in};
    end
end

// Assign the parallel output
assign parallel_out = shift_reg;

endmodule
