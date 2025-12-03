module dual_clock_fifo_tb;

reg wr_clk;
reg rd_clk;
reg wr_en;
reg rd_en;
reg [7:0] data_in;
wire [7:0] data_out;
wire empty;
wire full;

dual_clock_fifo uut (
    .wr_clk(wr_clk),
    .rd_clk(rd_clk),
    .wr_en(wr_en),
    .rd_en(rd_en),
    .data_in(data_in),
    .data_out(data_out),
    .empty(empty),
    .full(full)
);

initial begin
    wr_clk = 0;
    forever #10 wr_clk = ~wr_clk;
end

initial begin
    rd_clk = 0;
    forever #15 rd_clk = ~rd_clk;
end

initial begin
    wr_en = 0;
    rd_en = 0;
    data_in = 0;
    #100;
    wr_en = 1;
    data_in = 8'd1;
    #20;
    data_in = 8'd2;
    #20;
    wr_en = 0;
    rd_en = 1;
    #30;
    rd_en = 0;
    $finish;
end

initial begin
    $monitor("Time: %0t, Data Out: %d, Empty: %b, Full: %b", 
             $time, data_out, empty, full);
end

endmodule
