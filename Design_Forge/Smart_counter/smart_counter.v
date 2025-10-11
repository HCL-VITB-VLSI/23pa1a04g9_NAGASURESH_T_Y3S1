// Define a module for an 8-bit smart counter
module SmartCounter(
    input clk,         // Clock input
    input reset,       // Reset input
    input enable,      // Enable input
    input load,        // Load input
    input [7:0] data_in, // Data input
    output [7:0] count_out // Count output
);

// Define a register to store the count value
reg [7:0] count;

// Always block to handle clock and reset
always @(posedge clk or posedge reset) begin
    if (reset) begin
        // Reset the count value to 0
        count <= 8'd0;
    end else if (load) begin
        // Load the data input into the count register
        count <= data_in;
    end else if (enable) begin
        // Increment the count value
        count <= count + 1;
    end
end

// Assign the count value to the output
assign count_out = count;

endmodule
