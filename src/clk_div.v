module clk_div #(parameter N = 26) (
    input  clk,
    input  rst,
    output slow_clk
);
    reg [N-1:0] count;
    always @(posedge clk or posedge rst) begin
        if (rst) count <= 0;
        else     count <= count + 1;
    end
    assign slow_clk = count[N-1]; // 100MHz / 2^N ~= 1.49Hz for N=26
endmodule
