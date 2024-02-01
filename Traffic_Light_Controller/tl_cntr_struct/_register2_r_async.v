module _register2_r_async(clk, reset_n, d, q); //2-bits register
  input clk, reset_n;
  input [1:0] d;
  output [1:0] q;
  
  //instance
  _dff_r_async adff_0(.clk(clk), .reset_n(reset_n), .d(d[0]), .q(q[0]));
  _dff_r_async adff_1(.clk(clk), .reset_n(reset_n), .d(d[1]), .q(q[1]));
  
endmodule
