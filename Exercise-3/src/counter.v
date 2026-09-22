`timescale 1ns / 1ps

module counter #(parameter SIZE = 3, MAX_VALUE = 15)(
    input CLK100MHZ, 
    input clock_enable,
    input reset,
    output reg [SIZE-1:0] counter
    );
    
    always @(posedge CLK100MHZ) begin 
        if(reset) begin 
                counter <= 0;
        end else begin 
            if(clock_enable) begin 
                if(counter == MAX_VALUE) begin 
                    counter <= 0;
                end else begin 
                    counter <= counter + 1;
                end
            end    
        end
    end
    
endmodule
