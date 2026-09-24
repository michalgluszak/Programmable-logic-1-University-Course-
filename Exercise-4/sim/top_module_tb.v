`timescale 1ns / 1ps

module top_module_tb;
reg CLK100MHZ = 1'b0;
reg [0:0] SW = 1'b1; //reset button
wire [7:0] AN;
wire CA, CB, CC, CD, CE, CF, CG;
wire [6:0] counter;
wire [11:0] counter_bcd;

top_module uut(
    .CLK100MHZ(CLK100MHZ), 
    .SW(SW), 
    .AN(AN), 
    .CA(CA), 
    .CB(CB), 
    .CC(CC), 
    .CD(CD), 
    .CE(CE), 
    .CF(CF), 
    .CG(CG), 
    .counter(counter), 
    .counter_bcd(counter_bcd));
   
always #5 CLK100MHZ = ~CLK100MHZ;

initial begin 
#10 SW = 1'b0;
$finish();
end

endmodule

