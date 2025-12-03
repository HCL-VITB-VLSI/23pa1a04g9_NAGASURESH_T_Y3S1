module ring_buffer #(
    parameter WIDTH = 8,
    parameter DEPTH = 16
)(
    input clk,
    input rst,
    input wr_en,
    input rd_en,
    input [WIDTH-1:0] data_in,
    output [WIDTH-1:0] data_out,
    output empty,
    output full
);

reg [WIDTH-1:0] buffer [DEPTH-1:0];
reg [$clog2(DEPTH)-1:0] wr_ptr, rd_ptr;
reg [WIDTH-1:0] data_out_reg;
reg empty_reg, full_reg;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        wr_ptr <= 0;
        rd_ptr <= 0;
        empty_reg <= 1;
        full_reg <= 0;
    end else begin
        if (wr_en && !full_reg) begin
            buffer[wr_ptr] <= data_in;
            wr_ptr <= (wr_ptr + 1) % DEPTH;
            empty_reg <= 0;
            if (wr_ptr == rd_ptr) full_reg <= 1;
        end
        if (rd_en && !empty_reg) begin
            data_out_reg <= buffer[rd_ptr];
            rd_ptr <= (rd_ptr + 1) % DEPTH;
            full_reg <= 0;
            if (rd_ptr == wr_ptr) empty_reg <= 1;
        end
    end
end

assign data_out = data_out_reg;
assign empty = empty_reg;
assign full = full_reg;

endmodule
