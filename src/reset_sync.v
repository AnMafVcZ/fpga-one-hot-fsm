// Two-flop reset synchronizer for crossing async reset into clk domain
module reset_sync (
    input  clk,
    input  rst_async,
    output rst_sync
);
    reg [1:0] sync;
    always @(posedge clk or posedge rst_async) begin
        if (rst_async) sync <= 2'b11;
        else           sync <= {sync[0], 1'b0};
    end
    assign rst_sync = sync[1];
endmodule
