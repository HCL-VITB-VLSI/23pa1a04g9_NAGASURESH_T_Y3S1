`timescale 1ns/1ps

module mode_mux_tb;

reg [1:0] sel;
reg [3:0] a, b, c, d;
wire [3:0] out;

mode_mux uut (
    .sel(sel),
    .a(a),
    .b(b),
    .c(c),
    .d(d),
    .out(out)
);

initial begin
    sel = 2'b00;
    a = 4'b1010;
    b = 4'b1100;
    c = 4'b1111;
    d = 4'b1001;
    #10;
    sel = 2'b01;
    #10;
    sel = 2'b10;
    #10;
    sel = 2'b11;
    #10;
    $finish;
end

initial begin
    $monitor("Time: %0t, Sel: %b, Out: %b", $time, sel, out);
end

endmodule
