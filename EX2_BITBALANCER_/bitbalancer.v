module bitbalancer (
    input wire clk,        // Clock signal
    input wire reset,      // Reset signal
    input wire [7:0] in,   // 8-bit input
    output reg [3:0] count // Count of 1s in input (4 bits max)
);
integer i ;



    // Combinational logic to calculate bit count
    always @(*) begin
        if(reset) begin
          count <= 0;
         end else begin
count = 0;
i=0;

while(i<8)begin
if (in[i] == 1'b1)begin
count <= count+1;
end
i = i+1;
end 
    end
end

endmodule
