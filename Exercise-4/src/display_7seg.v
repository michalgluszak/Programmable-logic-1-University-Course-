`timescale 1ns / 1ps

module display_7seg #(parameter NUMBER_SIZE_BCD = 8)(
    input CLK100MHZ,
    input clock_enable,
    input [NUMBER_SIZE_BCD-1:0] counter_bcd,
    output reg [7:0] AN,
    output reg [6:0] cathode
    );
    
    reg [3:0] hundreds_bcd, tens_bcd, ones_bcd;  
    always @(*) begin 
        ones_bcd = counter_bcd[3:0];
        tens_bcd = counter_bcd[7:4];
        hundreds_bcd = counter_bcd[11:8];
    end 
    
    wire [6:0] ones_7seg, tens_7seg, hundreds_7seg; 
    
    bcd_to_7_seg_dec bcd_to_7_seg_dec_ones_ins(
        .bcd(ones_bcd), 
        .seven_segment_decoder(ones_7seg));
    
    bcd_to_7_seg_dec bcd_to_7_seg_dec_tens_ins(
        .bcd(tens_bcd), 
        .seven_segment_decoder(tens_7seg));
        
    bcd_to_7_seg_dec bcd_to_7_seg_dec_hundreds_ins(
        .bcd(hundreds_bcd), 
        .seven_segment_decoder(hundreds_7seg));

    reg[1:0] refresh_counter = 2'd0;
    always @(posedge CLK100MHZ) begin 
        if(clock_enable) begin 
            if(refresh_counter == 2'd2) begin 
                refresh_counter <= 2'd0;
            end else begin 
                refresh_counter <= refresh_counter + 2'd1;
            end
        end
    end
    
    always @(*) begin 
        case(refresh_counter)
            2'd0:
                begin 
                    AN <= 8'b1111_1110;
                    cathode <= ones_7seg;
                end
            2'd1:
                begin 
                    if(hundreds_bcd==4'd0 && tens_bcd == 4'd0) begin 
                        AN <= 8'b1111_1111;
                    end else begin 
                        AN <= 8'b1111_1101;
                        cathode <= tens_7seg;
                    end
                end
            2'd2:
                begin 
                    if(hundreds_bcd==4'd0) begin 
                        AN <= 8'b1111_1111;
                    end else begin 
                        AN <= 8'b1111_1011;
                        cathode <= hundreds_7seg;
                    end
                end
            default: AN <= 8'b1111_1111;
        endcase
    end

endmodule
