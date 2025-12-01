module stop_timer_tb;

reg clk;
reg start;
reg stop;
wire [7:0] count;

stop_timer uut (
    .clk(clk),
    .start(start),
    .stop(stop),
    .count(count)
);

initial begin
    clk = 0;
    forever #10 clk = ~clk;
end

initial begin
    start = 0;
    stop = 0;
    #20;
    start = 1;
    #20;
    start = 0;
    #100;
    stop = 1;
    #20;
    $finish;
end

initial begin
    $monitor("Time: %0t, Count: %d", $time, count);
end

endmodule
