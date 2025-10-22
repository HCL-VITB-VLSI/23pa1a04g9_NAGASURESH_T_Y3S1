// Define a module for a 4x8 register file
module BitVault(
    input clk,         // Clock input
    input write_enable, // Write enable input
    input [1:0] address, // Address input
    input [7:0] data_in, // Data input
    output [7:0] data_out // Data output
);

// Define a register file
reg [7:0] registers [3:0];

// Always block to handle write operation
always @(posedge clk) begin
    if (write_enable) begin
        // Write data to the register file
        registers[address] <= data_in;
    end
end

// Assign the data output
assign data_out = registers[address];

endmodule
