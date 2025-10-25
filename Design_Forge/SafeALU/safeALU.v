module safeALU(
    input [7:0] a,
    input [7:0] b,
    input [2:0] op,
    output reg [7:0] result,
    output reg error
);

always @(*) begin
    error = 0;
    case (op)
        3'b000: result = a + b; // Addition
        3'b001: result = a - b; // Subtraction
        3'b010: result = a & b; // Bitwise AND
        3'b011: result = a | b; // Bitwise OR
        3'b100: begin // Division
            if (b == 0) begin
                error = 1;
                result = 8'd0;
            end else begin
                result = a / b;
            end
        end
        3'b101: begin // Modulus
            if (b == 0) begin
                error = 1;
                result = 8'd0;
            end else begin
                result = a % b;
            end
        end
        default: begin
            result = 8'd0;
            error = 1;
        end
    endcase
end

endmodule
