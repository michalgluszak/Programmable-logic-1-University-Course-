`timescale 1ns / 1ps

module bcd_to_7_seg_dec(
    input [3:0] bcd,
    output reg [6:0] seven_segment_decoder
    );
    
    always @(*) begin
        case (bcd)
            4'd0 : seven_segment_decoder = 7'b0000_001; 
            4'd1 : seven_segment_decoder = 7'b1001_111; 
            4'd2 : seven_segment_decoder = 7'b0010_010; 
            4'd3 : seven_segment_decoder = 7'b0000_110;
            4'd4 : seven_segment_decoder = 7'b1001_100; 
            4'd5 : seven_segment_decoder = 7'b0100_100; 
            4'd6 : seven_segment_decoder = 7'b0100_000; 
            4'd7 : seven_segment_decoder = 7'b0001_111; 
            4'd8 : seven_segment_decoder = 7'b0000_000; 
            4'd9 : seven_segment_decoder = 7'b0000_100; 
            default : seven_segment_decoder = 7'b1111_111; 
        endcase
    end

endmodule
