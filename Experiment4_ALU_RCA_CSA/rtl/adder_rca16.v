`timescale 1ns/1ps

module adder_rca16 (
    input  [15:0] a,
    input  [15:0] b,
    input         cin,
    output [15:0] sum,
    output        cout
);

wire [15:0] c;

full_adder FA0 (
    a[0],
    b[0],
    cin,
    sum[0],
    c[0]
);

genvar i;

generate

    for(i=1; i<16; i=i+1)
    begin : RCA

        full_adder FA (
            a[i],
            b[i],
            c[i-1],
            sum[i],
            c[i]
        );

    end

endgenerate

assign cout = c[15];

endmodule
