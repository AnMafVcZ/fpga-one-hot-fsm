`timescale 1ns/1ps
module tb_top;
    reg  clk, rst;
    wire [6:0] seg, led;
    wire dp;
    wire [3:0] an;

    // Override N=3 so slow_clk toggles every 8 cycles (80ns) in sim
    top #() dut (
        .clk(clk), .rst(rst), .seg(seg), .dp(dp), .an(an), .led(led)
    );
    defparam dut.u_div.N = 3;

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        rst = 1; #30; rst = 0;
        #2000 $finish;
    end

    initial $monitor("t=%4t  state=%b  led=%b", $time, dut.u_fsm.state, led);
endmodule
