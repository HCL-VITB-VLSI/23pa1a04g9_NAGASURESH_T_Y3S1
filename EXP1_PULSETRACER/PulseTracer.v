module PulseTracer #(
    parameter FILTER_LEN = 3  // Number of consecutive cycles required for signal validation
)(
    input  wire clk,
    input  wire rst_n,
    input  wire noisy_in,
    output reg  pulse_out
);

    // Internal registers
    reg [FILTER_LEN-1:0] filter_reg;  // Shift register for input stabilization
    reg                  debounced;   // Filtered stable signal
    reg                  prev_debounced;  // Previous state for edge detection

    // Signal conditioning and pulse generation
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            filter_reg      <= 0;      // Clear filter register
            debounced       <= 0;      // Reset filtered signal
            prev_debounced  <= 0;      // Clear previous state
            pulse_out       <= 0;      // Deassert output pulse
        end else begin
            // Shift new input sample into filter register
            filter_reg <= {filter_reg[FILTER_LEN-2:0], noisy_in};

            // Update debounced signal when input stabilizes
            if (&filter_reg) begin           // All bits high → stable high
                debounced <= 1'b1;
            end else if (~|filter_reg) begin // All bits low → stable low  
                debounced <= 1'b0;
            end
            // Otherwise maintain current debounced state

            // Edge detection for pulse generation
            prev_debounced <= debounced;                    // Store previous state
            pulse_out <= (debounced & ~prev_debounced);     // Generate pulse on rising edge
        end
    end

endmodule
