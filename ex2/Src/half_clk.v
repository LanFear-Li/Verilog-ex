module half_clk(reset, clk_in, clk_out);
    input reset, clk_in;
    output reg clk_out;
    
    always @(posedge clk_in) begin
        if(!reset) clk_out = 0;
        else clk_out = ~clk_out;
    end
endmodule
    
module quarter_clk(reset, clk_in, clk_out, count);
    input reset, clk_in;
    output reg clk_out, count;
    
    always @(posedge clk_in) begin
        count = ~count;
        if(!reset) begin
            clk_out = 0;
            count = 0;
        end
        else if(count)clk_out = ~clk_out;
    end
endmodule

module one_third_clk(reset, clk_in, clk_out, count);
    input reset, clk_in;
    output reg clk_out;
    output reg [1:0] count;
    wire g;
    assign g = ~clk_in;
    
    always @(posedge clk_in or posedge g) begin
        count = count + 1;
        if(!reset) begin
            clk_out = 0;
            count = 0;
        end
        else begin
            if(count == 3)count = count + 1;
            if(!count)clk_out = ~clk_out;
        end
    end
endmodule

module enabled_one_third_clk(reset, clk_in, clk_out, s, g, l);
    input reset, clk_in;
    output reg clk_out;
    output reg [3:0] g, l;
    output wire s;
    assign s = g + l;
    
    always @(posedge clk_in or negedge reset) begin
        g = g + 1;
        if(!reset) begin
            g = 0;
        end
    end
    
    always @(negedge clk_in or negedge reset) begin
        l = l + 1;
        if(!reset) begin
            l = 0;
        end
    end
endmodule

