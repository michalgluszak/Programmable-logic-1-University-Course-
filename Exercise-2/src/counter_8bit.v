`timescale 1ns / 1ps

module counter_8bit(
    input CLK100MHZ,
    input rst, 
    input dir, //dir == 1 count-up / dir == 0 count-down
    output reg [7:0] cnt
    );
    
    always @(posedge CLK100MHZ) begin 
        if(rst) begin 
            cnt <= 8'd0;
        end else begin 
            if(dir) begin 
                cnt <= cnt + 8'd1;
            end else begin 
                cnt <= cnt - 8'd1;
            end
        end
    end
    
endmodule
