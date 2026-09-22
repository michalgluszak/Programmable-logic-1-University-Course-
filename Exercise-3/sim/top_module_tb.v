`timescale 1ns / 1ps

module top_module_tb;
reg CLK100MHZ = 1'b0;
reg reset = 1'b1;
wire [3:0] LED;

top_module top_module_ins(.CLK100MHZ(CLK100MHZ), .SW(reset), .LED(LED));

always #5 CLK100MHZ = ~CLK100MHZ;

initial begin 
#10 reset = 1'b0;
$finish();
end

endmodule
