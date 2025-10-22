// Define a testbench for the BitVault module
module BitVault_tb;

// Define inputs and outputs
reg clk;
reg write_enable;
reg [1:0] address;
reg [7:0] data_in;
wire [7:0] data_out;

// Instantiate the BitVault module
BitVault uut (
    .clk(clk),
    .write_enable(write_enable),
    .address(address),
    .data_in(data_in),
    .data_out(data_out)
);

// Clock generation
initial begin
    clk = 0;
    forever #10 clk = ~clk;
end

// Testbench logic
initial begin
    // Initialize inputs
    write_enable = 0;
    address = 2'd0;
    data_in = 8'd0;
    #20;
    // Write data to the register file
    write_enable = 1;
    address = 2'd0;
    data_in = 8'd10;
    #20;
    // Write data to another address
    address = 2'd1;
    data_in = 8'd20;
    #20;
    // Read data from the register file
    write_enable = 0;
    address = 2'd0;
    #20;
    address = 2'd1;
    #20;
    $finish;
end

// Monitor the output
initial begin
    $monitor("Time: %0t, Address: %d, Data Out: %d", $time, address, data_out);
end

endmodule
