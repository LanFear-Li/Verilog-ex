`timescale 1ns / 1ns

module divider_tb;
    reg reset, clk_in;
    wire clk_out;
    
    always #50 clk_in = ~clk_in;
    
    initial begin
        clk_in = 0;
        reset = 1;
        #10 reset = 0;
        #60 reset = 1;
        #10000 $stop;
    end
    
    divider test(.reset(reset), .clk_in(clk_in), .clk_out(clk_out));
endmodule