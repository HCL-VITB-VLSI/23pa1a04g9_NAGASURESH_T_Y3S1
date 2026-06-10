`timescale 1ns/1ps

module tb_alu_rca;

reg clk;
reg rst_n;

reg [15:0] A;
reg [15:0] B;

reg [2:0] opcode;

wire [15:0] Y;
wire carry_out;
wire zero_flag;

integer i;

// DUT

alu_rca DUT (

    .clk(clk),
    .rst_n(rst_n),

    .A(A),
    .B(B),

    .opcode(opcode),

    .Y(Y),

    .carry_out(carry_out),

    .zero_flag(zero_flag)

);

// Clock

initial begin

    clk = 0;

    forever #5 clk = ~clk;

end

// Reset

initial begin

    rst_n = 0;

    #10;

    rst_n = 1;

end

// Test

initial begin

    $dumpfile("alu_rca.vcd");

    $dumpvars(0, tb_alu_rca);

    // ADD

    A = 16'd10;
    B = 16'd5;
    opcode = 3'b000;

    #10;

    // SUB

    A = 16'd20;
    B = 16'd5;
    opcode = 3'b001;

    #10;

    // AND

    A = 16'hAAAA;
    B = 16'h5555;
    opcode = 3'b010;

    #10;

    // OR

    opcode = 3'b011;

    #10;

    // XOR

    opcode = 3'b100;

    #10;

    // Random Tests

    for(i=0; i<20; i=i+1)
    begin

        A = $random;

        B = $random;

        opcode = $random % 5;

        #10;

    end

    $finish;

end

initial begin

    $monitor("time=%0t opcode=%b A=%h B=%h Y=%h carry=%b zero=%b",
              $time, opcode, A, B, Y, carry_out, zero_flag);

end

endmodule
