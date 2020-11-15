`timescale 1ns / 1ps

module comparator_8b_tb();
    reg [8:0] a, b;
    wire c;
    
    initial begin
        for(a = 0; a < 256; a = a + 1) begin
            for(b = 0; b < 256; b = b + 1) begin
                #1;
            end
        end
    end
    
    comparator_8b test(.a(a), .b(b), .c(c));
endmodule