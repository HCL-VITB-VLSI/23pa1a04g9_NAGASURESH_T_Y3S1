// seqcheck
// Detects K rising edges within a W-cycle sliding window.
module seqcheck #(
    parameter W = 5, // Window length in cycles
    parameter K = 3  // Required rising edges in window
) (
    input  wire clk,
    input  wire rst_n,    // Active-low asynchronous reset
    input  wire in_sig,
    output wire hit      // 1-cycle pulse when the condition is met
);

    // Internal signals for the logic
    reg  in_sig_prev;
    wire rise_event;
    reg  [W-1:0] event_window; // Shift register to hold the window of events

    // Simple rising edge detector
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            in_sig_prev <= 1'b0;
        else
            in_sig_prev <= in_sig;
    end
    assign rise_event = in_sig & ~in_sig_prev;

    // Shift register to keep track of the last W cycles of rise events
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            event_window <= 0;
        else
            event_window <= {event_window[W-2:0], rise_event};
    end

    // Combinational logic to count the number of events in the window
    reg [$clog2(W+1)-1:0] event_count;
    integer i;
    always @(*) begin
        event_count = 0;
        for (i = 0; i < W; i = i + 1) begin
            if (event_window[i]) begin
                event_count = event_count + 1;
            end
        end
    end

    // Logic to generate a single-cycle pulse on the output
    reg  condition_met_prev;
    wire condition_met = (event_count >= K);
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            condition_met_prev <= 1'b0;
        else
            condition_met_prev <= condition_met;
    end
    
    assign hit = condition_met & ~condition_met_prev;

endmodule
