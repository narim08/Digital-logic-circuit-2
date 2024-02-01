module _register8(clk, d, q);
  input clk;
  input [7:0] d;
  output [7:0] q;
  
  //instance
  _dff dff_0(.clk(clk), .d(d[0]), .q(q[0]));
  _dff dff_1(.clk(clk), .d(d[1]), .q(q[1]));
  _dff dff_2(.clk(clk), .d(d[2]), .q(q[2]));
  _dff dff_3(.clk(clk), .d(d[3]), .q(q[3]));
  _dff dff_4(.clk(clk), .d(d[4]), .q(q[4]));
  _dff dff_5(.clk(clk), .d(d[5]), .q(q[5]));
  _dff dff_6(.clk(clk), .d(d[6]), .q(q[6]));
  _dff dff_7(.clk(clk), .d(d[7]), .q(q[7]));
  
endmodule
