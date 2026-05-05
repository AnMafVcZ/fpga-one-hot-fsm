// Active-low seven-segment decoder for digits 0-6
module seg7_dec (
    input      [2:0] digit,
    output reg [6:0] seg   // segments: gfedcba
);
    always @(*) begin
        case (digit)
            3'd0: seg = 7'b1000000;
            3'd1: seg = 7'b1111001;
            3'd2: seg = 7'b0100100;
            3'd3: seg = 7'b0110000;
            3'd4: seg = 7'b0011001;
            3'd5: seg = 7'b0010010;
            3'd6: seg = 7'b0000010;
            default: seg = 7'b1111111;
        endcase
    end
endmodule
