module clk_divider_fsm_tb;
    timeunit 1ns/1ps;

    localparam CLK_PERIOD = 10;

    logic clk = 0, rstn = 0;
    logic clk_out;

    initial forever #(CLK_PERIOD/2) clk <= !clk;
    clk_divider_fsm dut(.*);
    
    initial  begin
    @(posedge clk);
    #1 rstn <= 1;
    
    end

endmodule