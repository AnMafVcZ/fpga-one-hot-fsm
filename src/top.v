module top (
    input        clk,   // 100 MHz board clock
    input        rst,   // BTNC active-high reset
    output [6:0] seg,   // seven-segment cathodes
    output       dp,
    output [3:0] an,    // seven-segment anodes (active low)
    output [6:0] led    // one-hot state on LEDs
);
    wire slow_clk;
    wire [6:0] state;

    clk_div #(.N(26)) u_div (
        .clk(clk), .rst(rst), .slow_clk(slow_clk)
    );

    fsm_onehot u_fsm (
        .slow_clk(slow_clk), .rst(rst), .state(state)
    );

    // one-hot to binary index for display
    reg [2:0] bin;
    always @(*) begin
        case (state)
            7'b0000001: bin = 3'd0;
            7'b0000010: bin = 3'd1;
            7'b0000100: bin = 3'd2;
            7'b0001000: bin = 3'd3;
            7'b0010000: bin = 3'd4;
            7'b0100000: bin = 3'd5;
            7'b1000000: bin = 3'd6;
            default:    bin = 3'd0;
        endcase
    end

    seg7_dec u_seg (.digit(bin), .seg(seg));

    assign dp  = 1'b1;      // decimal point off
    assign an  = 4'b1110;   // rightmost digit only
    assign led = state;
endmodule
