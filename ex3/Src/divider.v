module divider(reset, clk_in, clk_out);
    input reset, clk_in;
    output reg clk_out;
    
    reg [4:0] count;
    
    always @(posedge clk_in) begin
        if(!reset) begin
            clk_out <= 0;
            count <= 0;
        end
        
        else begin
            if(count == 19)begin
                count <= 0;
                clk_out <= ~clk_out;
            end
            
            else count <= count + 1;
         end
    end
endmodule
