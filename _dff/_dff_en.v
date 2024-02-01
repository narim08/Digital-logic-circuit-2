module _dff_en(clk,en,d,q);
  input clk,d,en;
  output q;
  wire w_d;
  
  //instance
  mx2 en_mx2(.d0(q), .d1(d), .s(en), .y(w_d)); 
  _dff df0(.clk(clk), .d(w_d), .q(q));
  
endmodule
