`timescale 1ns/1ps

module alu_rca (

    input              clk,
    input              rst_n,

    input      [15:0]  A,
    input      [15:0]  B,

    input      [2:0]   opcode,

    output reg [15:0]  Y,
    output reg         carry_out,
    output             zero_flag
);

wire [15:0] adder_sum;
wire adder_cout;

reg [15:0] Y_comb;

// RCA Adder

adder_rca16 RCA (

    .a(A),

    .b((opcode == 3'b001) ? ~B : B),

    .cin((opcode == 3'b001) ? 1'b1 : 1'b0),

    .sum(adder_sum),

    .cout(adder_cout)

);

// Combinational Logic

always @(*) begin

    case(opcode)

        3'b000: Y_comb = adder_sum;

        3'b001: Y_comb = adder_sum;

        3'b010: Y_comb = A & B;

        3'b011: Y_comb = A | B;

        3'b100: Y_comb = A ^ B;

        default: Y_comb = 16'd0;

    endcase

end

// Output Register

always @(posedge clk or negedge rst_n) begin

    if(!rst_n) begin

        Y <= 16'd0;

        carry_out <= 1'b0;

    end

    else begin

        Y <= Y_comb;

        carry_out <= adder_cout;

    end

end

assign zero_flag = (Y == 16'd0);

endmodule
