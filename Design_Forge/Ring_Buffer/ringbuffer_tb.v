module ring_buffer_tb;

reg clk;
reg rst;
reg wr_en;
reg rd_en;
reg [7:0] data_in;
wire [7:0] data_out;
wire empty;
wire full;

ring_buffer uut (
    .clk(clk),
    .rst(rst),
    .wr_en(wr_en),
    .rd_en(rd_en),
    .data_in(data_in),
    .data_out(data_out),
    .empty(empty),
    .full(full)
);

initial begin
    clk = 0;
    forever #10 clk = ~clk;
end

initial begin
    rst = 1;
    #20;
    rst = 0;
    wr_en = 1;
    data_in = 8'd1;
    #20;
    data_in = 8'd2;
    #20;
    wr_en = 0;
    rd_en = 1;
    #20;
    rd_en = 0;
    $finish;
end

initial begin
    $monitor("Time: %0t, Data Out: %d, Empty: %b, Full: %b", 
             $time, data_out, empty, full);
end

endmodule
