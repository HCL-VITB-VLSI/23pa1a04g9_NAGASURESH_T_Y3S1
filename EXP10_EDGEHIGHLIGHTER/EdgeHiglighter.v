// edgehighlighter
// Detects rising and falling edges, providing a single-cycle pulse for each.
module edgehighlighter #(
    parameter USE_SYNC = 1 // 1: Use a 2-FF synchronizer, 0: Do not
) (
    input  wire clk,
    input  wire rst_n,        // Active-low asynchronous reset
    input  wire in_sig,
    output reg  rise_pulse,
    output reg  fall_pulse
);

    // Internal signals for the (optional) synchronizer
    reg [1:0] sync_ff;
    wire      sync_in;

    // This generate block includes a 2-flip-flop synchronizer if USE_SYNC is 1.
    // This is good practice for handling asynchronous external signals.
    generate
        if (USE_SYNC == 1) begin
            always @(posedge clk or negedge rst_n) begin
                if (!rst_n)
                    sync_ff <= 2'b0;
                else
                    sync_ff <= {sync_ff[0], in_sig};
            end
            assign sync_in = sync_ff[1];
        end else begin
            assign sync_in = in_sig;
        end
    endgenerate

    // This register stores the value of the synchronized input from the previous clock cycle.
    reg prev_sync_in;

    // This block registers the input and calculates the output pulses.
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            prev_sync_in <= 1'b0;
            rise_pulse   <= 1'b0;
            fall_pulse   <= 1'b0;
        end else begin
            // Store the current synchronized input for the next cycle's comparison.
            prev_sync_in <= sync_in;

            // A rising edge happens if the current input is 1 and the previous was 0.
            rise_pulse <= (sync_in == 1'b1) && (prev_sync_in == 1'b0);

            // A falling edge happens if the current input is 0 and the previous was 1.
            fall_pulse <= (sync_in == 1'b0) && (prev_sync_in == 1'b1);
        end
    end

endmodule
