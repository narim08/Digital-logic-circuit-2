module _dff_r(clk,reset_n,d,q);
  input clk, reset_n, d;
  output q;
  wire w_d;
  
  //instance
  _and2 and2_0(.a(d), .b(reset_n), .y(w_d));
  _dff df0(.clk(clk), .d(w_d), .q(q));
  
endmodule
