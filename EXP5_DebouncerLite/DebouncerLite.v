// debouncerlite 
module debouncerlite #(
    parameter N = 5 // Number of stable cycles for a valid transition
) (
    input  wire clk,
    input  wire rst_n,
    input  wire noisy_in,
    output reg  debounced
);

    localparam COUNTER_WIDTH = (N <= 1) ? 1 : $clog2(N);

    // Internal registers for the synchronizer and counter.
    reg [1:0]               sync_ff;
    reg [COUNTER_WIDTH-1:0] counter;
    wire                    synchronized_in = sync_ff[1];

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            sync_ff   <= 2'b0;
            counter   <= 0;
            debounced <= 1'b0;
        end else begin
            // Pass the noisy input through a 2-flip-flop synchronizer.
            sync_ff <= {sync_ff[0], noisy_in};

            // If the synchronized input matches the stable output, the signal
            // is not changing, so reset the stability counter.
            if (synchronized_in == debounced) begin
                counter <= 0;
            end 
            // Otherwise, if the input is different, a transition is in progress.
            else begin
                // If the counter is full, the new signal is considered stable.
                if (counter >= N - 1) begin
                    debounced <= synchronized_in; // Update the output
                    counter   <= 0;               // and reset the counter.
                end else begin
                    // If not yet stable, keep counting.
                    counter <= counter + 1;
                end
            end
        end
    end

endmodule
