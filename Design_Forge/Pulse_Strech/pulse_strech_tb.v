module pulse_stretcher_tb;

reg clk;
reg pulse_in;
wire pulse_out;

pulse_stretcher uut (
    .clk(clk),
    .pulse_in(pulse_in),
    .pulse_out(pulse_out)
);

initial begin
    clk = 0;
    forever #10 clk = ~clk;
end

initial begin
    pulse_in = 0;
    #100;
    pulse_in = 1;
    #20;
    pulse_in = 0;
    #200;
    $finish;
end

initial begin
    $monitor("Time: %0t, Pulse Out: %b", $time, pulse_out);
end

endmodule
