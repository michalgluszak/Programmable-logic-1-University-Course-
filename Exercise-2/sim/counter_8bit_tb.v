`timescale 1ns / 1ps

module counter_8bit_tb;
reg CLK100MHZ = 1'b0;
reg rst = 1'b1;
reg dir = 1'b1;
wire [7:0] cnt;

counter_8bit counter_8bit_ins(.CLK100MHZ(CLK100MHZ), .rst(rst), .dir(dir), .cnt(cnt));

always #5 CLK100MHZ = ~CLK100MHZ;

initial begin 
#10 rst = 1'b0;
#100 dir = 1'b0;
#100;
$finish();
end

endmodule
