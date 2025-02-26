module _register32(clk, d, q);
  input clk;
  input [31:0] d;
  output [31:0] q;
  
  //instance
  _register8 reg8_0(.clk(clk), .d(d[7:0]), .q(q[7:0]));
  _register8 reg8_1(.clk(clk), .d(d[15:8]), .q(q[15:8]));
  _register8 reg8_2(.clk(clk), .d(d[23:16]), .q(q[23:16]));
  _register8 reg8_3(.clk(clk), .d(d[31:24]), .q(q[31:24]));
  
endmodule
