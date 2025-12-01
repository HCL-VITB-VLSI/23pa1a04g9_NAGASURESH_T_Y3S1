module stop_timer(
    input clk,
    input start,
    input stop,
    output reg [7:0] count
);

reg running;

always @(posedge clk) begin
    if (start) begin
        running <= 1;
        count <= 0;
    end else if (stop) begin
        running <= 0;
    end else if (running) begin
        count <= count + 1;
    end
end

endmodule
