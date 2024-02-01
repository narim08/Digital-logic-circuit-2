module _dff(clk,d,q,q_bar);
  input clk,d;
  output q,q_bar;
  wire clk_bar, w_q;
  
  //instance
  _inv inv0(.a(clk), .y(clk_bar));
  _dlatch dl0(.clk(clk_bar), .d(d), .q(w_q));
  _dlatch dl1(.clk(clk), .d(w_q), .q(q), .q_bar(q_bar));
  
endmodule
