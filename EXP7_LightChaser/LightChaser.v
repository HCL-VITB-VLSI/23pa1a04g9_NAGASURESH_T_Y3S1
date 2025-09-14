//  lightchaser
// Creates a rotating LED pattern with a configurable speed and width.
module lightchaser #(
    parameter WIDTH          = 8,
    parameter TICKS_PER_STEP = 4
) (
    input  wire clk,
    input  wire rst_n,      // Active-low asynchronous reset
    input  wire enable,      // Pauses the rotation when low
    output reg  [WIDTH-1:0] led_out
);

    // This counter controls how many clock cycles to wait before each rotation step.
    reg [$clog2(TICKS_PER_STEP)-1:0] counter;

    // The main sequential block contains all the logic for the light chaser.
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            // On reset, initialize the pattern to a single '1' at the LSB.
            led_out <= {{WIDTH-1{1'b0}}, 1'b1};
            counter <= 0;
        end else begin
            // All operations are gated by the enable signal. If enable is low,
            // no assignments are made, so the registers hold their state (pause).
            if (enable) begin
                // When the counter reaches its max value, it's time to rotate.
                if (counter == TICKS_PER_STEP - 1) begin
                    // Perform a circular left shift on the led_out pattern.
                    led_out <= {led_out[WIDTH-2:0], led_out[WIDTH-1]};
                    // Reset the counter to start the next step's timing.
                    counter <= 0;
                end else begin
                    // If not yet time to rotate, just increment the counter.
                    counter <= counter + 1;
                end
            end
        end
    end

endmodule
