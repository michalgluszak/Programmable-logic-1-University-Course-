`timescale 1ns / 1ps

module top_module_tb;
reg [7:0] SW = 8'b1011_0010;
wire [10:0] LED;

top_module uut(.SW(SW), .LED(LED));

initial begin
#10 SW = 8'b1100_1000;
#10 SW = 8'b1111_1011;
#10 SW = 8'b1011_1110;
$finish();
end

endmodule
