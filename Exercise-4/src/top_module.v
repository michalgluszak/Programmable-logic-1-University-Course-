`timescale 1ns / 1ps

module top_module(
    input CLK100MHZ,
    input [0:0] SW, //reset button
    output [7:0] AN,
    output CA, CB, CC, CD, CE, CF, CG,
    output [NUMBER_SIZE-1:0] counter,
    output [NUMBER_SIZE_BCD-1:0] counter_bcd
    );
    
    localparam NUMBER_SIZE = 7, NUMBER_SIZE_BCD = 12;
    
    //1MHZ
    wire clock_enable_1HZ;
    clock_enable #(.SIZE(7), .MAX_VALUE(99)) clock_enable_10hz_ins (
        .CLK100MHZ(CLK100MHZ), 
        .clock_enable(clock_enable_1HZ));
        
    //5MHZ   
    wire clock_enable_5HZ;
    clock_enable #(.SIZE(5), .MAX_VALUE(19)) clock_enable_5hz_ins (
        .CLK100MHZ(CLK100MHZ), 
        .clock_enable(clock_enable_5HZ));
    
    //25MHZ
    wire clock_enable_1KHZ;
    clock_enable #(.SIZE(1), .MAX_VALUE(1)) clock_enable_1khz_ins (
        .CLK100MHZ(CLK100MHZ), 
        .clock_enable(clock_enable_1KHZ));
    
    counter #(.SIZE(NUMBER_SIZE), .MAX_VALUE(127)) counter_ins(
        .CLK100MHZ(CLK100MHZ), 
        .reset(SW), 
        .clock_enable(clock_enable_1HZ), 
        .counter(counter));
    
    double_dabble #(.NUMBER_SIZE(NUMBER_SIZE), .NUMBER_BCD_SIZE(NUMBER_SIZE_BCD)) double_dabble_ins(
        .CLK100MHZ(CLK100MHZ), 
        .ready(clock_enable_5HZ), 
        .reset(SW), 
        .number(counter), 
        .number_bcd(counter_bcd));
    
    wire [6:0] cathode;
    display_7seg #(.NUMBER_SIZE_BCD(NUMBER_SIZE_BCD)) display_7seg_ins(
        .CLK100MHZ(CLK100MHZ), 
        .clock_enable(clock_enable_1KHZ),
        .counter_bcd(counter_bcd),
        .AN(AN), 
        .cathode(cathode));
        
   assign {CA, CB, CC, CD, CE, CF, CG} = cathode;
           
endmodule
