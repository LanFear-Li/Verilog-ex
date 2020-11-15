`timescale 1ns / 1ns

module half_clk_tb;
    reg reset, clk_in;
    wire clk_out, count;
    
    always #50 clk_in = ~clk_in;
    
    initial fork
        clk_in = 0;
        reset = 1;
        
        #10 reset = 0;
        #60 reset = 1;
        #10000 $stop;
    join
    
    half_clk test(.reset(reset), .clk_in(clk_in), .clk_out(clk_out));
endmodule

module quarter_clk_tb;
    reg reset, clk_in;
    wire clk_out, count;
    
    always #50 clk_in = ~clk_in;
    
    initial fork
        clk_in = 0;
        reset = 1;
        
        #10 reset = 0;
        #60 reset = 1;
        #10000 $stop;
    join
    
    quarter_clk test(.reset(reset), .clk_in(clk_in), .clk_out(clk_out), .count(count));
endmodule

module one_third_clk_tb;
    reg reset, clk_in;
    wire clk_out;
    wire [1:0] count;
    
    always #50 clk_in = ~clk_in;
    
    initial fork
        clk_in = 0;
        reset = 1;
        
        #10 reset = 0;
        #60 reset = 1;
        #10000 $stop;
    join
    
    one_third_clk test(.reset(reset), .clk_in(clk_in), .clk_out(clk_out), .count(count));
endmodule

module enabled_one_third_clk_tb;
    reg reset, clk_in;
    wire clk_out;
    wire s;
    
    always #50 clk_in = ~clk_in;
    
    initial fork
        clk_in = 0;
        reset = 1;
        
        #10 reset = 0;
        #60 reset = 1;
        #10000 $stop;
    join
    
    enabled_one_third_clk test(.reset(reset), .clk_in(clk_in), .clk_out(clk_out), .s(s));
endmodule