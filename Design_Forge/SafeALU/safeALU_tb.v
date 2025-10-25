module safeALU_tb;

reg [7:0] a;
reg [7:0] b;
reg [2:0] op;
wire [7:0] result;
wire error;

safeALU uut (
    .a(a),
    .b(b),
    .op(op),
    .result(result),
    .error(error)
);

initial begin
    a = 8'd10;
    b = 8'd2;
    op = 3'b000; // Addition
    #10;
    op = 3'b100; // Division
    #10;
    b = 8'd0; // Division by zero
    #10;
    $finish;
end

initial begin
    $monitor("Time: %0t, Op: %b, A: %d, B: %d, Result: %d, Error: %b", 
             $time, op, a, b, result, error);
end

endmodule
