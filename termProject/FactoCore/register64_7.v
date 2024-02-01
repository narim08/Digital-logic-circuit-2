module register64_7(clk, reset_n, en, d_in, d_out0, d_out1, d_out2, d_out3, d_out4, d_out5, d_out6); //64bit register
  input clk, reset_n;
  input [6:0] en;
  input [64:0] d_in;
  output [64:0] d_out0, d_out1, d_out2, d_out3, d_out4, d_out5, d_out6;
  
  //instance
  register64_r_en rg_0(.clk(clk), .reset_n(reset_n), .en(en[0]), .d(d_in), .q(d_out0));
  register64_r_en rg_1(.clk(clk), .reset_n(reset_n), .en(en[1]), .d(d_in), .q(d_out1));
  register64_r_en rg_2(.clk(clk), .reset_n(reset_n), .en(en[2]), .d(d_in), .q(d_out2));
  register64_r_en rg_3(.clk(clk), .reset_n(reset_n), .en(en[3]), .d(d_in), .q(d_out3));
 
  register64_r_en rg_4(.clk(clk), .reset_n(reset_n), .en(en[4]), .d(d_in), .q(d_out4));
  register64_r_en rg_5(.clk(clk), .reset_n(reset_n), .en(en[5]), .d(d_in), .q(d_out5));
  register64_r_en rg_6(.clk(clk), .reset_n(reset_n), .en(en[6]), .d(d_in), .q(d_out6));

endmodule
