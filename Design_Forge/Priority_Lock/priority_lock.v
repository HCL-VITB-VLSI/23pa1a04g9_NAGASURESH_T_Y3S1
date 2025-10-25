module priority_lock(input [3:0] req,output [3:0] grant);

    reg [3:0] grant_reg;

    always @(*) begin
        casex (req)
            4'b1xxx: grant_reg = 4'b1000;
            4'b01xx: grant_reg = 4'b0100;
            4'b001x: grant_reg = 4'b0010;
            4'b0001: grant_reg = 4'b0001;
            default: grant_reg = 4'b0000;
        endcase
    end

    assign grant = grant_reg;

endmodule
