// Define a testbench for the ByteStreamer module
module ByteStreamer_tb;

// Define inputs and outputs
reg clk;
reg shift_enable;
reg serial_in;
wire [7:0] parallel_out;

// Instantiate the ByteStreamer module
ByteStreamer uut (
    .clk(clk),
    .shift_enable(shift_enable),
    .serial_in(serial_in),
    .parallel_out(parallel_out)
);

// Clock generation
initial begin
    clk = 0;
    forever #10 clk = ~clk;
end

// Testbench logic
initial begin
    // Initialize inputs
    shift_enable = 0;
    serial_in = 0;
    #20;
    // Shift in a byte of data
    shift_enable = 1;
    serial_in = 1;
    #20;
    serial_in = 0;
    #20;
    serial_in = 1;
    #20;
    serial_in = 0;
    #20;
    serial_in = 0;
    #20;
    serial_in = 1;
    #20;
    serial_in = 1;
    #20;
    serial_in = 0;
    #20;
    shift_enable = 0;
    #20;
    $finish;
end

// Monitor the output
initial begin
    $monitor("Time: %0t, Parallel Out: %b", $time, parallel_out);
end

endmodule
