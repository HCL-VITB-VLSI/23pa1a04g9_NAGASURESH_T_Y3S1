/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : T-2022.03-SP5-4
// Date      : Wed Jun 10 18:05:24 2026
/////////////////////////////////////////////////////////////


module full_adder_27 ( a, b, cin, sum, cout );
  input a, b, cin;
  output sum, cout;
  wire   n1;

  AO22X1_RVT U3 ( .A1(b), .A2(cin), .A3(a), .A4(n1), .Y(cout) );
  XOR2X1_RVT U1 ( .A1(b), .A2(cin), .Y(n1) );
  XOR2X1_RVT U2 ( .A1(a), .A2(n1), .Y(sum) );
endmodule


module full_adder_24 ( a, b, cin, sum, cout );
  input a, b, cin;
  output sum, cout;
  wire   n2;

  AO22X1_RVT U3 ( .A1(b), .A2(cin), .A3(a), .A4(n2), .Y(cout) );
  XOR2X1_RVT U1 ( .A1(b), .A2(cin), .Y(n2) );
  XOR2X1_RVT U2 ( .A1(a), .A2(n2), .Y(sum) );
endmodule


module full_adder_25 ( a, b, cin, sum, cout );
  input a, b, cin;
  output sum, cout;
  wire   n2;

  AO22X1_RVT U3 ( .A1(b), .A2(cin), .A3(a), .A4(n2), .Y(cout) );
  XOR2X1_RVT U1 ( .A1(b), .A2(cin), .Y(n2) );
  XOR2X1_RVT U2 ( .A1(a), .A2(n2), .Y(sum) );
endmodule


module full_adder_26 ( a, b, cin, sum, cout );
  input a, b, cin;
  output sum, cout;
  wire   n2;

  AO22X1_RVT U3 ( .A1(b), .A2(cin), .A3(a), .A4(n2), .Y(cout) );
  XOR2X1_RVT U1 ( .A1(b), .A2(cin), .Y(n2) );
  XOR2X1_RVT U2 ( .A1(a), .A2(n2), .Y(sum) );
endmodule


module adder_rca4_6 ( a, b, cin, sum, cout );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout;
  wire   c1, c2, c3;

  full_adder_27 fa0 ( .a(a[0]), .b(b[0]), .cin(cin), .sum(sum[0]), .cout(c1)
         );
  full_adder_26 fa1 ( .a(a[1]), .b(b[1]), .cin(c1), .sum(sum[1]), .cout(c2) );
  full_adder_25 fa2 ( .a(a[2]), .b(b[2]), .cin(c2), .sum(sum[2]), .cout(c3) );
  full_adder_24 fa3 ( .a(a[3]), .b(b[3]), .cin(c3), .sum(sum[3]), .cout(cout)
         );
endmodule


module full_adder_0 ( a, b, cin, sum, cout );
  input a, b, cin;
  output sum, cout;
  wire   n2;

  AO22X1_RVT U3 ( .A1(b), .A2(cin), .A3(a), .A4(n2), .Y(cout) );
  XOR2X1_RVT U1 ( .A1(b), .A2(cin), .Y(n2) );
  XOR2X1_RVT U2 ( .A1(a), .A2(n2), .Y(sum) );
endmodule


module full_adder_1 ( a, b, cin, sum, cout );
  input a, b, cin;
  output sum, cout;
  wire   n2;

  AO22X1_RVT U3 ( .A1(b), .A2(cin), .A3(a), .A4(n2), .Y(cout) );
  XOR2X1_RVT U1 ( .A1(b), .A2(cin), .Y(n2) );
  XOR2X1_RVT U2 ( .A1(a), .A2(n2), .Y(sum) );
endmodule


module full_adder_2 ( a, b, cin, sum, cout );
  input a, b, cin;
  output sum, cout;
  wire   n2;

  AO22X1_RVT U3 ( .A1(b), .A2(cin), .A3(a), .A4(n2), .Y(cout) );
  XOR2X1_RVT U1 ( .A1(b), .A2(cin), .Y(n2) );
  XOR2X1_RVT U2 ( .A1(a), .A2(n2), .Y(sum) );
endmodule


module full_adder_3 ( a, b, cin, sum, cout );
  input a, b, cin;
  output sum, cout;
  wire   n2;

  AO22X1_RVT U3 ( .A1(b), .A2(cin), .A3(a), .A4(n2), .Y(cout) );
  XOR2X1_RVT U1 ( .A1(b), .A2(cin), .Y(n2) );
  XOR2X1_RVT U2 ( .A1(a), .A2(n2), .Y(sum) );
endmodule


module adder_rca4_0 ( a, b, cin, sum, cout );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout;
  wire   c1, c2, c3;

  full_adder_3 fa0 ( .a(a[0]), .b(b[0]), .cin(cin), .sum(sum[0]), .cout(c1) );
  full_adder_2 fa1 ( .a(a[1]), .b(b[1]), .cin(c1), .sum(sum[1]), .cout(c2) );
  full_adder_1 fa2 ( .a(a[2]), .b(b[2]), .cin(c2), .sum(sum[2]), .cout(c3) );
  full_adder_0 fa3 ( .a(a[3]), .b(b[3]), .cin(c3), .sum(sum[3]), .cout(cout)
         );
endmodule


module full_adder_4 ( a, b, cin, sum, cout );
  input a, b, cin;
  output sum, cout;
  wire   n2;

  AO22X1_RVT U3 ( .A1(b), .A2(cin), .A3(a), .A4(n2), .Y(cout) );
  XOR2X1_RVT U1 ( .A1(b), .A2(cin), .Y(n2) );
  XOR2X1_RVT U2 ( .A1(a), .A2(n2), .Y(sum) );
endmodule


module full_adder_5 ( a, b, cin, sum, cout );
  input a, b, cin;
  output sum, cout;
  wire   n2;

  AO22X1_RVT U3 ( .A1(b), .A2(cin), .A3(a), .A4(n2), .Y(cout) );
  XOR2X1_RVT U1 ( .A1(b), .A2(cin), .Y(n2) );
  XOR2X1_RVT U2 ( .A1(a), .A2(n2), .Y(sum) );
endmodule


module full_adder_6 ( a, b, cin, sum, cout );
  input a, b, cin;
  output sum, cout;
  wire   n2;

  AO22X1_RVT U3 ( .A1(b), .A2(cin), .A3(a), .A4(n2), .Y(cout) );
  XOR2X1_RVT U1 ( .A1(b), .A2(cin), .Y(n2) );
  XOR2X1_RVT U2 ( .A1(a), .A2(n2), .Y(sum) );
endmodule


module full_adder_7 ( a, b, cin, sum, cout );
  input a, b, cin;
  output sum, cout;
  wire   n2;

  AO22X1_RVT U3 ( .A1(b), .A2(cin), .A3(a), .A4(n2), .Y(cout) );
  XOR2X1_RVT U1 ( .A1(b), .A2(cin), .Y(n2) );
  XOR2X1_RVT U2 ( .A1(a), .A2(n2), .Y(sum) );
endmodule


module adder_rca4_1 ( a, b, cin, sum, cout );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout;
  wire   c1, c2, c3;

  full_adder_7 fa0 ( .a(a[0]), .b(b[0]), .cin(cin), .sum(sum[0]), .cout(c1) );
  full_adder_6 fa1 ( .a(a[1]), .b(b[1]), .cin(c1), .sum(sum[1]), .cout(c2) );
  full_adder_5 fa2 ( .a(a[2]), .b(b[2]), .cin(c2), .sum(sum[2]), .cout(c3) );
  full_adder_4 fa3 ( .a(a[3]), .b(b[3]), .cin(c3), .sum(sum[3]), .cout(cout)
         );
endmodule


module full_adder_8 ( a, b, cin, sum, cout );
  input a, b, cin;
  output sum, cout;
  wire   n2;

  AO22X1_RVT U3 ( .A1(b), .A2(cin), .A3(a), .A4(n2), .Y(cout) );
  XOR2X1_RVT U1 ( .A1(b), .A2(cin), .Y(n2) );
  XOR2X1_RVT U2 ( .A1(a), .A2(n2), .Y(sum) );
endmodule


module full_adder_9 ( a, b, cin, sum, cout );
  input a, b, cin;
  output sum, cout;
  wire   n2;

  AO22X1_RVT U3 ( .A1(b), .A2(cin), .A3(a), .A4(n2), .Y(cout) );
  XOR2X1_RVT U1 ( .A1(b), .A2(cin), .Y(n2) );
  XOR2X1_RVT U2 ( .A1(a), .A2(n2), .Y(sum) );
endmodule


module full_adder_10 ( a, b, cin, sum, cout );
  input a, b, cin;
  output sum, cout;
  wire   n2;

  AO22X1_RVT U3 ( .A1(b), .A2(cin), .A3(a), .A4(n2), .Y(cout) );
  XOR2X1_RVT U1 ( .A1(b), .A2(cin), .Y(n2) );
  XOR2X1_RVT U2 ( .A1(a), .A2(n2), .Y(sum) );
endmodule


module full_adder_11 ( a, b, cin, sum, cout );
  input a, b, cin;
  output sum, cout;
  wire   n2;

  AO22X1_RVT U3 ( .A1(b), .A2(cin), .A3(a), .A4(n2), .Y(cout) );
  XOR2X1_RVT U1 ( .A1(b), .A2(cin), .Y(n2) );
  XOR2X1_RVT U2 ( .A1(a), .A2(n2), .Y(sum) );
endmodule


module adder_rca4_2 ( a, b, cin, sum, cout );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout;
  wire   c1, c2, c3;

  full_adder_11 fa0 ( .a(a[0]), .b(b[0]), .cin(cin), .sum(sum[0]), .cout(c1)
         );
  full_adder_10 fa1 ( .a(a[1]), .b(b[1]), .cin(c1), .sum(sum[1]), .cout(c2) );
  full_adder_9 fa2 ( .a(a[2]), .b(b[2]), .cin(c2), .sum(sum[2]), .cout(c3) );
  full_adder_8 fa3 ( .a(a[3]), .b(b[3]), .cin(c3), .sum(sum[3]), .cout(cout)
         );
endmodule


module full_adder_12 ( a, b, cin, sum, cout );
  input a, b, cin;
  output sum, cout;
  wire   n2;

  AO22X1_RVT U3 ( .A1(b), .A2(cin), .A3(a), .A4(n2), .Y(cout) );
  XOR2X1_RVT U1 ( .A1(b), .A2(cin), .Y(n2) );
  XOR2X1_RVT U2 ( .A1(a), .A2(n2), .Y(sum) );
endmodule


module full_adder_13 ( a, b, cin, sum, cout );
  input a, b, cin;
  output sum, cout;
  wire   n2;

  AO22X1_RVT U3 ( .A1(b), .A2(cin), .A3(a), .A4(n2), .Y(cout) );
  XOR2X1_RVT U1 ( .A1(b), .A2(cin), .Y(n2) );
  XOR2X1_RVT U2 ( .A1(a), .A2(n2), .Y(sum) );
endmodule


module full_adder_14 ( a, b, cin, sum, cout );
  input a, b, cin;
  output sum, cout;
  wire   n2;

  AO22X1_RVT U3 ( .A1(b), .A2(cin), .A3(a), .A4(n2), .Y(cout) );
  XOR2X1_RVT U1 ( .A1(b), .A2(cin), .Y(n2) );
  XOR2X1_RVT U2 ( .A1(a), .A2(n2), .Y(sum) );
endmodule


module full_adder_15 ( a, b, cin, sum, cout );
  input a, b, cin;
  output sum, cout;
  wire   n2;

  AO22X1_RVT U3 ( .A1(b), .A2(cin), .A3(a), .A4(n2), .Y(cout) );
  XOR2X1_RVT U1 ( .A1(b), .A2(cin), .Y(n2) );
  XOR2X1_RVT U2 ( .A1(a), .A2(n2), .Y(sum) );
endmodule


module adder_rca4_3 ( a, b, cin, sum, cout );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout;
  wire   c1, c2, c3;

  full_adder_15 fa0 ( .a(a[0]), .b(b[0]), .cin(cin), .sum(sum[0]), .cout(c1)
         );
  full_adder_14 fa1 ( .a(a[1]), .b(b[1]), .cin(c1), .sum(sum[1]), .cout(c2) );
  full_adder_13 fa2 ( .a(a[2]), .b(b[2]), .cin(c2), .sum(sum[2]), .cout(c3) );
  full_adder_12 fa3 ( .a(a[3]), .b(b[3]), .cin(c3), .sum(sum[3]), .cout(cout)
         );
endmodule


module full_adder_16 ( a, b, cin, sum, cout );
  input a, b, cin;
  output sum, cout;
  wire   n2;

  AO22X1_RVT U3 ( .A1(b), .A2(cin), .A3(a), .A4(n2), .Y(cout) );
  XOR2X1_RVT U1 ( .A1(b), .A2(cin), .Y(n2) );
  XOR2X1_RVT U2 ( .A1(a), .A2(n2), .Y(sum) );
endmodule


module full_adder_17 ( a, b, cin, sum, cout );
  input a, b, cin;
  output sum, cout;
  wire   n2;

  AO22X1_RVT U3 ( .A1(b), .A2(cin), .A3(a), .A4(n2), .Y(cout) );
  XOR2X1_RVT U1 ( .A1(b), .A2(cin), .Y(n2) );
  XOR2X1_RVT U2 ( .A1(a), .A2(n2), .Y(sum) );
endmodule


module full_adder_18 ( a, b, cin, sum, cout );
  input a, b, cin;
  output sum, cout;
  wire   n2;

  AO22X1_RVT U3 ( .A1(b), .A2(cin), .A3(a), .A4(n2), .Y(cout) );
  XOR2X1_RVT U1 ( .A1(b), .A2(cin), .Y(n2) );
  XOR2X1_RVT U2 ( .A1(a), .A2(n2), .Y(sum) );
endmodule


module full_adder_19 ( a, b, cin, sum, cout );
  input a, b, cin;
  output sum, cout;
  wire   n2;

  AO22X1_RVT U3 ( .A1(b), .A2(cin), .A3(a), .A4(n2), .Y(cout) );
  XOR2X1_RVT U1 ( .A1(b), .A2(cin), .Y(n2) );
  XOR2X1_RVT U2 ( .A1(a), .A2(n2), .Y(sum) );
endmodule


module adder_rca4_4 ( a, b, cin, sum, cout );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout;
  wire   c1, c2, c3;

  full_adder_19 fa0 ( .a(a[0]), .b(b[0]), .cin(cin), .sum(sum[0]), .cout(c1)
         );
  full_adder_18 fa1 ( .a(a[1]), .b(b[1]), .cin(c1), .sum(sum[1]), .cout(c2) );
  full_adder_17 fa2 ( .a(a[2]), .b(b[2]), .cin(c2), .sum(sum[2]), .cout(c3) );
  full_adder_16 fa3 ( .a(a[3]), .b(b[3]), .cin(c3), .sum(sum[3]), .cout(cout)
         );
endmodule


module full_adder_20 ( a, b, cin, sum, cout );
  input a, b, cin;
  output sum, cout;
  wire   n2;

  AO22X1_RVT U3 ( .A1(b), .A2(cin), .A3(a), .A4(n2), .Y(cout) );
  XOR2X1_RVT U1 ( .A1(b), .A2(cin), .Y(n2) );
  XOR2X1_RVT U2 ( .A1(a), .A2(n2), .Y(sum) );
endmodule


module full_adder_21 ( a, b, cin, sum, cout );
  input a, b, cin;
  output sum, cout;
  wire   n2;

  AO22X1_RVT U3 ( .A1(b), .A2(cin), .A3(a), .A4(n2), .Y(cout) );
  XOR2X1_RVT U1 ( .A1(b), .A2(cin), .Y(n2) );
  XOR2X1_RVT U2 ( .A1(a), .A2(n2), .Y(sum) );
endmodule


module full_adder_22 ( a, b, cin, sum, cout );
  input a, b, cin;
  output sum, cout;
  wire   n2;

  AO22X1_RVT U3 ( .A1(b), .A2(cin), .A3(a), .A4(n2), .Y(cout) );
  XOR2X1_RVT U1 ( .A1(b), .A2(cin), .Y(n2) );
  XOR2X1_RVT U2 ( .A1(a), .A2(n2), .Y(sum) );
endmodule


module full_adder_23 ( a, b, cin, sum, cout );
  input a, b, cin;
  output sum, cout;
  wire   n2;

  AO22X1_RVT U3 ( .A1(b), .A2(cin), .A3(a), .A4(n2), .Y(cout) );
  XOR2X1_RVT U1 ( .A1(b), .A2(cin), .Y(n2) );
  XOR2X1_RVT U2 ( .A1(a), .A2(n2), .Y(sum) );
endmodule


module adder_rca4_5 ( a, b, cin, sum, cout );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout;
  wire   c1, c2, c3;

  full_adder_23 fa0 ( .a(a[0]), .b(b[0]), .cin(cin), .sum(sum[0]), .cout(c1)
         );
  full_adder_22 fa1 ( .a(a[1]), .b(b[1]), .cin(c1), .sum(sum[1]), .cout(c2) );
  full_adder_21 fa2 ( .a(a[2]), .b(b[2]), .cin(c2), .sum(sum[2]), .cout(c3) );
  full_adder_20 fa3 ( .a(a[3]), .b(b[3]), .cin(c3), .sum(sum[3]), .cout(cout)
         );
endmodule


module adder_csa16 ( a, b, cin, sum, cout );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout;
  wire   c1, c2_0, c2_1, c3_0, c3_1, c4_0, c4_1, n1, n2, n3, n4, n5;
  wire   [3:0] sum1_0;
  wire   [3:0] sum1_1;
  wire   [3:0] sum2_0;
  wire   [3:0] sum2_1;
  wire   [3:0] sum3_0;
  wire   [3:0] sum3_1;

  adder_rca4_6 rca0 ( .a(a[3:0]), .b(b[3:0]), .cin(cin), .sum(sum[3:0]), 
        .cout(c1) );
  adder_rca4_5 rca1_0 ( .a(a[7:4]), .b(b[7:4]), .cin(1'b0), .sum(sum1_0), 
        .cout(c2_0) );
  adder_rca4_4 rca1_1 ( .a(a[7:4]), .b(b[7:4]), .cin(1'b1), .sum(sum1_1), 
        .cout(c2_1) );
  adder_rca4_3 rca2_0 ( .a(a[11:8]), .b(b[11:8]), .cin(1'b0), .sum(sum2_0), 
        .cout(c3_0) );
  adder_rca4_2 rca2_1 ( .a(a[11:8]), .b(b[11:8]), .cin(1'b1), .sum(sum2_1), 
        .cout(c3_1) );
  adder_rca4_1 rca3_0 ( .a(a[15:12]), .b(b[15:12]), .cin(1'b0), .sum(sum3_0), 
        .cout(c4_0) );
  adder_rca4_0 rca3_1 ( .a(a[15:12]), .b(b[15:12]), .cin(1'b1), .sum(sum3_1), 
        .cout(c4_1) );
  AO22X1_RVT U6 ( .A1(sum2_1[1]), .A2(n4), .A3(sum2_0[1]), .A4(n2), .Y(sum[9])
         );
  AO22X1_RVT U7 ( .A1(sum2_1[0]), .A2(n4), .A3(sum2_0[0]), .A4(n2), .Y(sum[8])
         );
  AO22X1_RVT U8 ( .A1(sum1_1[3]), .A2(c1), .A3(sum1_0[3]), .A4(n3), .Y(sum[7])
         );
  AO22X1_RVT U9 ( .A1(sum1_1[2]), .A2(c1), .A3(sum1_0[2]), .A4(n3), .Y(sum[6])
         );
  AO22X1_RVT U10 ( .A1(sum1_1[1]), .A2(c1), .A3(sum1_0[1]), .A4(n3), .Y(sum[5]) );
  AO22X1_RVT U11 ( .A1(sum1_1[0]), .A2(c1), .A3(sum1_0[0]), .A4(n3), .Y(sum[4]) );
  AO22X1_RVT U12 ( .A1(sum3_1[3]), .A2(n5), .A3(sum3_0[3]), .A4(n1), .Y(
        sum[15]) );
  AO22X1_RVT U13 ( .A1(sum3_1[2]), .A2(n5), .A3(sum3_0[2]), .A4(n1), .Y(
        sum[14]) );
  AO22X1_RVT U14 ( .A1(sum3_1[1]), .A2(n5), .A3(sum3_0[1]), .A4(n1), .Y(
        sum[13]) );
  AO22X1_RVT U15 ( .A1(sum3_1[0]), .A2(n5), .A3(sum3_0[0]), .A4(n1), .Y(
        sum[12]) );
  AO22X1_RVT U16 ( .A1(sum2_1[3]), .A2(n4), .A3(sum2_0[3]), .A4(n2), .Y(
        sum[11]) );
  AO22X1_RVT U17 ( .A1(sum2_1[2]), .A2(n4), .A3(sum2_0[2]), .A4(n2), .Y(
        sum[10]) );
  AO22X1_RVT U18 ( .A1(c4_1), .A2(n5), .A3(c4_0), .A4(n1), .Y(cout) );
  AO22X1_RVT U19 ( .A1(c3_1), .A2(n4), .A3(c3_0), .A4(n2), .Y(n5) );
  AO22X1_RVT U20 ( .A1(c2_1), .A2(c1), .A3(c2_0), .A4(n3), .Y(n4) );
  INVX1_RVT U3 ( .A(n5), .Y(n1) );
  INVX1_RVT U4 ( .A(c1), .Y(n3) );
  INVX1_RVT U5 ( .A(n4), .Y(n2) );
endmodule


module alu_csa ( clk, rst_n, A, B, opcode, Y, carry_out, zero_flag, 
        overflow_flag );
  input [15:0] A;
  input [15:0] B;
  input [2:0] opcode;
  output [15:0] Y;
  input clk, rst_n;
  output carry_out, zero_flag, overflow_flag;
  wire   adder_cout, cout_comb, ovfl_comb, n1, n2, n3, n4, n5, n6, n7, n8, n9,
         n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23,
         n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37,
         n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51,
         n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65,
         n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79,
         n80, n81, n82, n83, n84, n85;
  wire   [15:0] adder_b;
  wire   [15:0] adder_sum;
  wire   [15:0] Y_comb;

  adder_csa16 adder_inst ( .a(A), .b(adder_b), .cin(n32), .sum(adder_sum), 
        .cout(adder_cout) );
  DFFARX1_RVT carry_out_reg ( .D(cout_comb), .CLK(clk), .RSTB(rst_n), .Q(
        carry_out) );
  DFFARX1_RVT zero_flag_reg ( .D(n81), .CLK(clk), .RSTB(rst_n), .Q(zero_flag)
         );
  DFFARX1_RVT overflow_flag_reg ( .D(ovfl_comb), .CLK(clk), .RSTB(rst_n), .Q(
        overflow_flag) );
  DFFARX1_RVT \Y_reg[15]  ( .D(Y_comb[15]), .CLK(clk), .RSTB(rst_n), .Q(Y[15])
         );
  DFFARX1_RVT \Y_reg[14]  ( .D(Y_comb[14]), .CLK(clk), .RSTB(rst_n), .Q(Y[14])
         );
  DFFARX1_RVT \Y_reg[13]  ( .D(Y_comb[13]), .CLK(clk), .RSTB(rst_n), .Q(Y[13])
         );
  DFFARX1_RVT \Y_reg[12]  ( .D(Y_comb[12]), .CLK(clk), .RSTB(rst_n), .Q(Y[12])
         );
  DFFARX1_RVT \Y_reg[11]  ( .D(Y_comb[11]), .CLK(clk), .RSTB(rst_n), .Q(Y[11])
         );
  DFFARX1_RVT \Y_reg[10]  ( .D(Y_comb[10]), .CLK(clk), .RSTB(rst_n), .Q(Y[10])
         );
  DFFARX1_RVT \Y_reg[9]  ( .D(Y_comb[9]), .CLK(clk), .RSTB(rst_n), .Q(Y[9]) );
  DFFARX1_RVT \Y_reg[8]  ( .D(Y_comb[8]), .CLK(clk), .RSTB(rst_n), .Q(Y[8]) );
  DFFARX1_RVT \Y_reg[7]  ( .D(Y_comb[7]), .CLK(clk), .RSTB(rst_n), .Q(Y[7]) );
  DFFARX1_RVT \Y_reg[6]  ( .D(Y_comb[6]), .CLK(clk), .RSTB(rst_n), .Q(Y[6]) );
  DFFARX1_RVT \Y_reg[5]  ( .D(Y_comb[5]), .CLK(clk), .RSTB(rst_n), .Q(Y[5]) );
  DFFARX1_RVT \Y_reg[4]  ( .D(Y_comb[4]), .CLK(clk), .RSTB(rst_n), .Q(Y[4]) );
  DFFARX1_RVT \Y_reg[3]  ( .D(Y_comb[3]), .CLK(clk), .RSTB(rst_n), .Q(Y[3]) );
  DFFARX1_RVT \Y_reg[2]  ( .D(Y_comb[2]), .CLK(clk), .RSTB(rst_n), .Q(Y[2]) );
  DFFARX1_RVT \Y_reg[1]  ( .D(Y_comb[1]), .CLK(clk), .RSTB(rst_n), .Q(Y[1]) );
  DFFARX1_RVT \Y_reg[0]  ( .D(Y_comb[0]), .CLK(clk), .RSTB(rst_n), .Q(Y[0]) );
  NOR4X1_RVT U4 ( .A1(n41), .A2(n42), .A3(n43), .A4(n44), .Y(n81) );
  AND2X1_RVT U61 ( .A1(n36), .A2(n37), .Y(ovfl_comb) );
  OAI22X1_RVT U62 ( .A1(n38), .A2(n39), .A3(n40), .A4(n1), .Y(n37) );
  AND2X1_RVT U63 ( .A1(adder_cout), .A2(n45), .Y(cout_comb) );
  AO222X1_RVT U64 ( .A1(B[9]), .A2(n46), .A3(A[9]), .A4(n47), .A5(adder_sum[9]), .A6(n45), .Y(Y_comb[9]) );
  AO21X1_RVT U65 ( .A1(n84), .A2(n22), .A3(n82), .Y(n47) );
  AO221X1_RVT U66 ( .A1(n85), .A2(n7), .A3(n50), .A4(A[9]), .A5(n49), .Y(n46)
         );
  AO222X1_RVT U67 ( .A1(B[8]), .A2(n51), .A3(A[8]), .A4(n52), .A5(adder_sum[8]), .A6(n45), .Y(Y_comb[8]) );
  AO21X1_RVT U68 ( .A1(n84), .A2(n23), .A3(n82), .Y(n52) );
  AO221X1_RVT U69 ( .A1(n85), .A2(n8), .A3(A[8]), .A4(n50), .A5(n83), .Y(n51)
         );
  AO222X1_RVT U70 ( .A1(B[7]), .A2(n53), .A3(A[7]), .A4(n54), .A5(adder_sum[7]), .A6(n45), .Y(Y_comb[7]) );
  AO21X1_RVT U71 ( .A1(n84), .A2(n24), .A3(n82), .Y(n54) );
  AO221X1_RVT U72 ( .A1(n85), .A2(n9), .A3(A[7]), .A4(n50), .A5(n49), .Y(n53)
         );
  AO222X1_RVT U73 ( .A1(B[6]), .A2(n55), .A3(A[6]), .A4(n56), .A5(adder_sum[6]), .A6(n45), .Y(Y_comb[6]) );
  AO21X1_RVT U74 ( .A1(n84), .A2(n25), .A3(n82), .Y(n56) );
  AO221X1_RVT U75 ( .A1(n48), .A2(n10), .A3(A[6]), .A4(n50), .A5(n49), .Y(n55)
         );
  AO222X1_RVT U76 ( .A1(B[5]), .A2(n57), .A3(A[5]), .A4(n58), .A5(adder_sum[5]), .A6(n45), .Y(Y_comb[5]) );
  AO21X1_RVT U77 ( .A1(n84), .A2(n26), .A3(n82), .Y(n58) );
  AO221X1_RVT U78 ( .A1(n84), .A2(n11), .A3(A[5]), .A4(n50), .A5(n82), .Y(n57)
         );
  AO222X1_RVT U79 ( .A1(B[4]), .A2(n59), .A3(A[4]), .A4(n60), .A5(adder_sum[4]), .A6(n45), .Y(Y_comb[4]) );
  AO21X1_RVT U80 ( .A1(n84), .A2(n27), .A3(n82), .Y(n60) );
  AO221X1_RVT U81 ( .A1(n48), .A2(n12), .A3(A[4]), .A4(n50), .A5(n82), .Y(n59)
         );
  AO222X1_RVT U82 ( .A1(B[3]), .A2(n61), .A3(A[3]), .A4(n62), .A5(adder_sum[3]), .A6(n45), .Y(Y_comb[3]) );
  AO21X1_RVT U83 ( .A1(n84), .A2(n28), .A3(n82), .Y(n62) );
  AO221X1_RVT U84 ( .A1(n48), .A2(n13), .A3(A[3]), .A4(n50), .A5(n82), .Y(n61)
         );
  AO222X1_RVT U85 ( .A1(B[2]), .A2(n63), .A3(A[2]), .A4(n64), .A5(adder_sum[2]), .A6(n45), .Y(Y_comb[2]) );
  AO21X1_RVT U86 ( .A1(n84), .A2(n29), .A3(n82), .Y(n64) );
  AO221X1_RVT U87 ( .A1(n48), .A2(n14), .A3(A[2]), .A4(n50), .A5(n49), .Y(n63)
         );
  AO222X1_RVT U88 ( .A1(B[1]), .A2(n65), .A3(A[1]), .A4(n66), .A5(adder_sum[1]), .A6(n45), .Y(Y_comb[1]) );
  AO21X1_RVT U89 ( .A1(n84), .A2(n30), .A3(n83), .Y(n66) );
  AO221X1_RVT U90 ( .A1(n48), .A2(n15), .A3(A[1]), .A4(n50), .A5(n49), .Y(n65)
         );
  AO221X1_RVT U91 ( .A1(B[15]), .A2(n67), .A3(adder_sum[15]), .A4(n45), .A5(
        n68), .Y(Y_comb[15]) );
  AO22X1_RVT U92 ( .A1(n83), .A2(A[15]), .A3(n84), .A4(n39), .Y(n68) );
  AO21X1_RVT U93 ( .A1(n50), .A2(A[15]), .A3(n83), .Y(n67) );
  AO222X1_RVT U94 ( .A1(B[14]), .A2(n69), .A3(A[14]), .A4(n70), .A5(
        adder_sum[14]), .A6(n45), .Y(Y_comb[14]) );
  AO21X1_RVT U95 ( .A1(n84), .A2(n17), .A3(n83), .Y(n70) );
  AO221X1_RVT U96 ( .A1(n48), .A2(n2), .A3(A[14]), .A4(n50), .A5(n49), .Y(n69)
         );
  AO222X1_RVT U97 ( .A1(B[13]), .A2(n71), .A3(A[13]), .A4(n72), .A5(
        adder_sum[13]), .A6(n45), .Y(Y_comb[13]) );
  AO21X1_RVT U98 ( .A1(n84), .A2(n18), .A3(n83), .Y(n72) );
  AO221X1_RVT U99 ( .A1(n48), .A2(n3), .A3(A[13]), .A4(n50), .A5(n83), .Y(n71)
         );
  AO222X1_RVT U100 ( .A1(B[12]), .A2(n73), .A3(A[12]), .A4(n74), .A5(
        adder_sum[12]), .A6(n45), .Y(Y_comb[12]) );
  AO21X1_RVT U101 ( .A1(n84), .A2(n19), .A3(n83), .Y(n74) );
  AO221X1_RVT U102 ( .A1(n48), .A2(n4), .A3(A[12]), .A4(n50), .A5(n49), .Y(n73) );
  AO222X1_RVT U103 ( .A1(B[11]), .A2(n75), .A3(A[11]), .A4(n76), .A5(
        adder_sum[11]), .A6(n45), .Y(Y_comb[11]) );
  AO21X1_RVT U104 ( .A1(n48), .A2(n20), .A3(n83), .Y(n76) );
  AO221X1_RVT U105 ( .A1(n48), .A2(n5), .A3(A[11]), .A4(n50), .A5(n49), .Y(n75) );
  AO222X1_RVT U106 ( .A1(B[10]), .A2(n77), .A3(A[10]), .A4(n78), .A5(
        adder_sum[10]), .A6(n45), .Y(Y_comb[10]) );
  AO21X1_RVT U107 ( .A1(n48), .A2(n21), .A3(n83), .Y(n78) );
  AO221X1_RVT U108 ( .A1(n85), .A2(n6), .A3(A[10]), .A4(n50), .A5(n49), .Y(n77) );
  AO222X1_RVT U109 ( .A1(B[0]), .A2(n79), .A3(A[0]), .A4(n80), .A5(
        adder_sum[0]), .A6(n45), .Y(Y_comb[0]) );
  NAND3X0_RVT U111 ( .A1(n34), .A2(n33), .A3(opcode[0]), .Y(n40) );
  NAND3X0_RVT U112 ( .A1(n34), .A2(n33), .A3(n35), .Y(n38) );
  AO21X1_RVT U113 ( .A1(n48), .A2(n31), .A3(n82), .Y(n80) );
  AO221X1_RVT U114 ( .A1(n85), .A2(n16), .A3(A[0]), .A4(n50), .A5(n49), .Y(n79) );
  AND3X1_RVT U115 ( .A1(opcode[0]), .A2(n33), .A3(opcode[1]), .Y(n49) );
  AND3X1_RVT U117 ( .A1(n35), .A2(n34), .A3(opcode[2]), .Y(n48) );
  XNOR2X1_RVT U118 ( .A1(n31), .A2(n32), .Y(adder_b[0]) );
  INVX2_RVT U119 ( .A(n40), .Y(n32) );
  OR4X1_RVT U120 ( .A1(Y_comb[2]), .A2(Y_comb[3]), .A3(Y_comb[4]), .A4(
        Y_comb[5]), .Y(n42) );
  OR4X1_RVT U121 ( .A1(Y_comb[6]), .A2(Y_comb[7]), .A3(Y_comb[8]), .A4(
        Y_comb[9]), .Y(n41) );
  OR4X1_RVT U122 ( .A1(Y_comb[0]), .A2(Y_comb[10]), .A3(Y_comb[11]), .A4(
        Y_comb[12]), .Y(n44) );
  OR4X1_RVT U123 ( .A1(Y_comb[13]), .A2(Y_comb[14]), .A3(Y_comb[15]), .A4(
        Y_comb[1]), .Y(n43) );
  XNOR2X1_RVT U124 ( .A1(n27), .A2(n32), .Y(adder_b[4]) );
  XNOR2X1_RVT U125 ( .A1(n23), .A2(n32), .Y(adder_b[8]) );
  XNOR2X1_RVT U126 ( .A1(n30), .A2(n32), .Y(adder_b[1]) );
  XNOR2X1_RVT U127 ( .A1(n26), .A2(n32), .Y(adder_b[5]) );
  XNOR2X1_RVT U128 ( .A1(n19), .A2(n32), .Y(adder_b[12]) );
  XNOR2X1_RVT U129 ( .A1(n22), .A2(n32), .Y(adder_b[9]) );
  XNOR2X1_RVT U130 ( .A1(n29), .A2(n32), .Y(adder_b[2]) );
  XNOR2X1_RVT U131 ( .A1(n25), .A2(n32), .Y(adder_b[6]) );
  XNOR2X1_RVT U132 ( .A1(n18), .A2(n32), .Y(adder_b[13]) );
  XNOR2X1_RVT U133 ( .A1(n21), .A2(n32), .Y(adder_b[10]) );
  XNOR2X1_RVT U134 ( .A1(n28), .A2(n32), .Y(adder_b[3]) );
  XNOR2X1_RVT U135 ( .A1(n24), .A2(n32), .Y(adder_b[7]) );
  XNOR2X1_RVT U136 ( .A1(n17), .A2(n32), .Y(adder_b[14]) );
  XNOR2X1_RVT U137 ( .A1(n20), .A2(n32), .Y(adder_b[11]) );
  NBUFFX2_RVT U138 ( .A(n48), .Y(n85) );
  NBUFFX2_RVT U139 ( .A(n49), .Y(n82) );
  NBUFFX2_RVT U140 ( .A(n48), .Y(n84) );
  NAND2X2_RVT U141 ( .A1(n38), .A2(n40), .Y(n45) );
  NBUFFX2_RVT U142 ( .A(n49), .Y(n83) );
  INVX1_RVT U143 ( .A(opcode[2]), .Y(n33) );
  INVX1_RVT U144 ( .A(opcode[1]), .Y(n34) );
  XOR2X1_RVT U145 ( .A1(adder_sum[15]), .A2(A[15]), .Y(n36) );
  INVX1_RVT U146 ( .A(n39), .Y(n1) );
  INVX1_RVT U147 ( .A(B[0]), .Y(n31) );
  INVX1_RVT U148 ( .A(B[4]), .Y(n27) );
  INVX1_RVT U149 ( .A(B[8]), .Y(n23) );
  INVX1_RVT U150 ( .A(B[1]), .Y(n30) );
  INVX1_RVT U151 ( .A(B[5]), .Y(n26) );
  INVX1_RVT U152 ( .A(B[12]), .Y(n19) );
  INVX1_RVT U153 ( .A(B[9]), .Y(n22) );
  INVX1_RVT U154 ( .A(B[2]), .Y(n29) );
  INVX1_RVT U155 ( .A(B[6]), .Y(n25) );
  INVX1_RVT U156 ( .A(B[13]), .Y(n18) );
  INVX1_RVT U157 ( .A(B[10]), .Y(n21) );
  INVX1_RVT U158 ( .A(B[3]), .Y(n28) );
  INVX1_RVT U159 ( .A(B[7]), .Y(n24) );
  INVX1_RVT U160 ( .A(B[14]), .Y(n17) );
  XNOR2X1_RVT U161 ( .A1(B[15]), .A2(n40), .Y(adder_b[15]) );
  INVX1_RVT U162 ( .A(B[11]), .Y(n20) );
  INVX1_RVT U163 ( .A(opcode[0]), .Y(n35) );
  AND2X1_RVT U164 ( .A1(opcode[1]), .A2(n33), .Y(n50) );
  INVX1_RVT U165 ( .A(A[6]), .Y(n10) );
  INVX1_RVT U166 ( .A(A[7]), .Y(n9) );
  INVX1_RVT U167 ( .A(A[2]), .Y(n14) );
  INVX1_RVT U168 ( .A(A[3]), .Y(n13) );
  INVX1_RVT U169 ( .A(A[8]), .Y(n8) );
  INVX1_RVT U170 ( .A(A[13]), .Y(n3) );
  INVX1_RVT U171 ( .A(A[4]), .Y(n12) );
  INVX1_RVT U172 ( .A(A[14]), .Y(n2) );
  INVX1_RVT U173 ( .A(A[9]), .Y(n7) );
  INVX1_RVT U174 ( .A(A[0]), .Y(n16) );
  XOR2X1_RVT U175 ( .A1(B[15]), .A2(A[15]), .Y(n39) );
  INVX1_RVT U176 ( .A(A[5]), .Y(n11) );
  INVX1_RVT U177 ( .A(A[10]), .Y(n6) );
  INVX1_RVT U178 ( .A(A[11]), .Y(n5) );
  INVX1_RVT U179 ( .A(A[1]), .Y(n15) );
  INVX1_RVT U180 ( .A(A[12]), .Y(n4) );
endmodule

