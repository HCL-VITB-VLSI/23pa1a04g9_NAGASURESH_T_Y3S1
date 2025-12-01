module pulse_stretcher(
    input clk,
    input pulse_in,
    output pulse_out
);

reg [7:0] counter;
reg pulse_out_reg;

always @(posedge clk) begin
    if (pulse_in) begin
        counter <= 8'd100; // Stretch pulse for 100 clock cycles
        pulse_out_reg <= 1'b1;
    end else if (counter > 0) begin
        counter <= counter - 1;
        pulse_out_reg <= 1'b1;
    end else begin
        pulse_out_reg <= 1'b0;
    end
end

assign pulse_out = pulse_out_reg;

endmodule
