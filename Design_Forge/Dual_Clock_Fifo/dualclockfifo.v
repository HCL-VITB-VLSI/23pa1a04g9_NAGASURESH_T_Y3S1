module dual_clock_fifo #(
    parameter WIDTH = 8,
    parameter DEPTH = 16
)(
    input wr_clk,
    input rd_clk,
    input wr_en,
    input rd_en,
    input [WIDTH-1:0] data_in,
    output [WIDTH-1:0] data_out,
    output empty,
    output full
);

reg [WIDTH-1:0] fifo[DEPTH-1:0];
reg [$clog2(DEPTH)-1:0] wr_ptr, rd_ptr;
reg [WIDTH-1:0] data_out_reg;

reg [1:0] wr_sync_reg;
reg [1:0] rd_sync_reg;

wire wr_clk_sync;
wire rd_clk_sync;

assign wr_clk_sync = wr_sync_reg[1];
assign rd_clk_sync = rd_sync_reg[1];

always @(posedge wr_clk) begin
    wr_sync_reg <= {wr_sync_reg[0], rd_clk};
end

always @(posedge rd_clk) begin
    rd_sync_reg <= {rd_sync_reg[0], wr_clk};
end

always @(posedge wr_clk) begin
    if (wr_en && !full) begin
        fifo[wr_ptr] <= data_in;
        wr_ptr <= wr_ptr + 1;
    end
end

always @(posedge rd_clk) begin
    if (rd_en && !empty) begin
        data_out_reg <= fifo[rd_ptr];
        rd_ptr <= rd_ptr + 1;
    end
end

assign data_out = data_out_reg;

assign empty = (wr_ptr == rd_ptr) && !wr_clk_sync;
assign full = (wr_ptr == rd_ptr) && wr_clk_sync;

endmodule
