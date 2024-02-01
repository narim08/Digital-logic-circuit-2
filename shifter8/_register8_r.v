module _register8_r(clk, reset_n, d, q); //resettable 8-bit register
  input clk, reset_n;
  input [7:0] d;
  output [7:0] q;
  
  //instance
  _dff_r dr_0(.clk(clk), .reset_n(reset_n), .d(d[0]), .q(q[0]));
  _dff_r dr_1(.clk(clk), .reset_n(reset_n), .d(d[1]), .q(q[1]));
  _dff_r dr_2(.clk(clk), .reset_n(reset_n), .d(d[2]), .q(q[2]));
  _dff_r dr_3(.clk(clk), .reset_n(reset_n), .d(d[3]), .q(q[3]));
  
  _dff_r dr_4(.clk(clk), .reset_n(reset_n), .d(d[4]), .q(q[4]));
  _dff_r dr_5(.clk(clk), .reset_n(reset_n), .d(d[5]), .q(q[5]));
  _dff_r dr_6(.clk(clk), .reset_n(reset_n), .d(d[6]), .q(q[6]));
  _dff_r dr_7(.clk(clk), .reset_n(reset_n), .d(d[7]), .q(q[7]));
  
endmodule
