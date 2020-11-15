`timescale 1ns / 1ps

module comparator_8b(a, b, c);
    input [7:0] a, b;
    output reg c;
    always @(a or b) begin
        c = a > b ? 1 : 0;
    end
endmodule
