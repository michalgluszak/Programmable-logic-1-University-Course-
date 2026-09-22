`timescale 1ns / 1ps

module blink_led #(parameter SIZE = 4)(
    input [SIZE-1:0] counter,
    output [SIZE-1:0] LED
    );
    
    assign LED = counter;
    
endmodule
