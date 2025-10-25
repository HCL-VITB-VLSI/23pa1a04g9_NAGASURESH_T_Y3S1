module priority_lock_tb;
    reg [3:0] req;
    wire [3:0] grant;

    priority_lock uut (
        .req(req),
        .grant(grant)
    );

    initial begin
        req = 4'b0000;
        #10;
        req = 4'b1000;
        #10;
        req = 4'b0100;
        #10;
        req = 4'b0010;
        #10;
        req = 4'b0001;
        #10;
        req = 4'b1100;
        #10;
        $finish;
    end

    initial begin
        $monitor("Time: %0t, Req: %b, Grant: %b", $time, req, grant);
    end

endmodule
