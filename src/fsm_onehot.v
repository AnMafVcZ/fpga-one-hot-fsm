module fsm_onehot (
    input            slow_clk,
    input            rst,
    output reg [6:0] state
);
    localparam [6:0]
        S0 = 7'b0000001,
        S1 = 7'b0000010,
        S2 = 7'b0000100,
        S3 = 7'b0001000,
        S4 = 7'b0010000,
        S5 = 7'b0100000,
        S6 = 7'b1000000;

    always @(posedge slow_clk or posedge rst) begin
        if (rst) state <= S0;
        else case (state)
            S0:      state <= S1;
            S1:      state <= S2;
            S2:      state <= S3;
            S3:      state <= S4;
            S4:      state <= S5;
            S5:      state <= S6;
            S6:      state <= S0;
            default: state <= S0;
        endcase
    end
endmodule
