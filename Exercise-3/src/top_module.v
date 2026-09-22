`timescale 1ns / 1ps

module top_module(
    input CLK100MHZ,
    input [0:0] SW, //reset button
    output [SIZE-1:0] LED
    );

    parameter SIZE = 4;
    
    //1hz (SIZE = 27, MAX_VALUE = 99_999_999)
    //Simulation set 25MHZ (SIZE = 2, MAX_VALUE = 3)
    wire clock_enable;
    clock_enable #(.SIZE(2), .MAX_VALUE(3)) clock_enable_ins(
        .CLK100MHZ(CLK100MHZ), 
        .clock_enable(clock_enable));
    
    wire [SIZE-1:0] counter;
    counter #(.SIZE(SIZE), .MAX_VALUE(15)) counter_ins (
        .CLK100MHZ(CLK100MHZ), 
        .clock_enable(clock_enable), 
        .reset(SW), 
        .counter(counter));
    
    blink_led #(.SIZE(SIZE)) blink_led_ins (
        .counter(counter), 
        .LED(LED));
    
    

endmodule
