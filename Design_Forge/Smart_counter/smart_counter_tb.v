// Define a testbench for the SmartCounter module
module SmartCounter_tb;

// Define inputs and outputs
reg clk;
reg reset;
reg enable;
reg load;
reg [7:0] data_in;
wire [7:0] count_out;

// Instantiate the SmartCounter module
SmartCounter uut (
    .clk(clk),
    .reset(reset),
    .enable(enable),
    .load(load),
    .data_in(data_in),
    .count_out(count_out)
);

// Clock generation
initial begin
    clk = 0;
    forever #10 clk = ~clk;
end

// Testbench logic
initial begin
    // Initialize inputs
    reset = 1;
    enable = 0;
    load = 0;
    data_in = 8'd0;
    #20;
    // Reset the counter
    reset = 0;
    #20;
    // Load a value into the counter
    load = 1;
    data_in = 8'd10;
    #20;
    // Enable the counter
    load = 0;
    enable = 1;
    #40;
    // Disable the counter
    enable = 0;
    #20;
    $finish;
end

// Monitor the output
initial begin
    $monitor("Time: %0t, Count: %d", $time, count_out);
end

endmodule
