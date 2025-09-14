// rotator
// A register that can be loaded or rotated left/right.
module rotatorunit #(
    parameter WIDTH = 8
) (
    input  wire clk,
    input  wire rst_n,          // Active-low asynchronous reset
    input  wire enable,          // Main enable for all operations
    input  wire load,           // Synchronous load enable
    input  wire dir,            // 0: rotate left, 1: rotate right
    input  wire [WIDTH-1:0] data_in,
    output reg  [WIDTH-1:0] data_out
);

    // This single sequential block handles all the logic for the rotator.
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            data_out <= {WIDTH{1'b0}}; // On reset, clear the output.
        end else begin
            // All actions are gated by the main enable signal.
            // If enable is low, the register holds its value.
            if (enable) begin
                // The load signal has priority over the rotate operation.
                if (load) begin
                    data_out <= data_in;
                end 
                // If not loading, then perform rotation based on the dir signal.
                else begin
                    if (dir == 1'b0) begin // As per testbench, 0 is rotate-left
                        data_out <= {data_out[WIDTH-2:0], data_out[WIDTH-1]};
                    end else begin // 1 is rotate-right
                        data_out <= {data_out[0], data_out[WIDTH-1:1]};
                    end
                end
            end
        end
    end

endmodule
