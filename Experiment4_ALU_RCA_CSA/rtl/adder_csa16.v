`timescale 1ns/1ps

module adder_csa16 (
    input  [15:0] a,
    input  [15:0] b,
    input         cin,
    output [15:0] sum,
    output        cout
);

wire c1, c2, c3;

wire [3:0] s10, s11;
wire [3:0] s20, s21;
wire [3:0] s30, s31;

wire c10, c11, c20, c21, c30, c31;

// First block

rca4 A0 (
    a[3:0],
    b[3:0],
    cin,
    sum[3:0],
    c1
);

// Second block

rca4 A10 (
    a[7:4],
    b[7:4],
    1'b0,
    s10,
    c10
);

rca4 A11 (
    a[7:4],
    b[7:4],
    1'b1,
    s11,
    c11
);

assign {c2, sum[7:4]} =
       (c1) ? {c11,s11} : {c10,s10};

// Third block

rca4 A20 (
    a[11:8],
    b[11:8],
    1'b0,
    s20,
    c20
);

rca4 A21 (
    a[11:8],
    b[11:8],
    1'b1,
    s21,
    c21
);

assign {c3, sum[11:8]} =
       (c2) ? {c21,s21} : {c20,s20};

// Fourth block

rca4 A30 (
    a[15:12],
    b[15:12],
    1'b0,
    s30,
    c30
);

rca4 A31 (
    a[15:12],
    b[15:12],
    1'b1,
    s31,
    c31
);

assign {cout, sum[15:12]} =
       (c3) ? {c31,s31} : {c30,s30};

endmodule
