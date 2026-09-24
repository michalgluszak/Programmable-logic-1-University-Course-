`timescale 1ns / 1ps

module clock_enable #(parameter SIZE = 2, MAX_VALUE = 3)(
    input CLK100MHZ,
    output reg clock_enable = 1'b0
    );
    
    reg[SIZE-1:0] counter = 0;
    
    always @(posedge CLK100MHZ) begin 
        if(counter == MAX_VALUE) begin 
            counter <= 0;
            clock_enable <= 1'b1;
        end else begin 
            counter <= counter + 1;
            clock_enable <= 1'b0;
        end
    end
    
endmodule
