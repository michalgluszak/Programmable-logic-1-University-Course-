`timescale 1ns / 1ps

module top_module(
    input [7:0] SW,
    output [10:0] LED
    );
    
    wire even_parity, odd_parity, error; 
  
    generate_parity_bit generate_parity_bit_ins(
        .SW(SW), 
        .even_parity(even_parity), 
        .odd_parity(odd_parity));
        
    generate_parity_bit_checking generate_parity_bit_checking(
        .SW(SW), 
        .even_parity(even_parity), 
        .error(error));
        
    assign LED[7:0] = SW;
    assign LED[8] = even_parity;
    assign LED[9] = odd_parity;
    assign LED[10] = error;
    
endmodule
