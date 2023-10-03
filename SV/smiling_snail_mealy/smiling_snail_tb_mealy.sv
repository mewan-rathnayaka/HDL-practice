module clk_divider_fsm_tb;
    timeunit 1ns/1ps;

    localparam CLK_PERIOD = 10;

    logic data = 0, rstn = 0, clk = 0;
    logic detected;

    initial forever #(CLK_PERIOD/2) clk <= !clk;
    smiling_snail dut(.*);

    initial  begin
        @(posedge clk);
        #1 rstn <= 1;

        for (int i=0; i<4; ++i) begin
            if      (i == 2)  data <= 0;
            else              data <= 1;
            @(posedge clk); 
        end
    end




endmodule