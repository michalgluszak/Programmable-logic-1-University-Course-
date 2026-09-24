`timescale 1ns / 1ps

module generate_parity_bit_checking(
    input [7:0] SW,
    input even_parity,
    output error
    );
    
    wire xor0, xor1, xor2, xor3, xor4, xor5, xor6, xor7;
    
    assign xor0 = SW[0] ^ SW[1];
    assign xor1 = SW[2] ^ xor0;
    assign xor2 = SW[3] ^ xor1;
    assign xor3 = SW[4] ^ xor2;
    assign xor4 = SW[5] ^ xor3;
    assign xor5 = SW[6] ^ xor4;
    assign xor6 = SW[7] ^ xor5;
    
    assign xor7 = even_parity ^ xor6;
    assign error = xor7;
    
    
endmodule
