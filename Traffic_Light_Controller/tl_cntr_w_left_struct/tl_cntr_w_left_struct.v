module tl_cntr_w_left_struct(clk, reset_n, Ta, Tal, Tb, Tbl, La, Lb);
  input clk, reset_n, Ta, Tal, Tb, Tbl;
  output [1:0] La, Lb;
  wire [2:0] Q;
  wire [2:0] D;
  
  //instance
  ns_logic ns_inst(.Ta(Ta), .Tal(Tal), .Tb(Tb), .Tbl(Tbl), .Q(Q), .D(D));
  _register3_r reg3_inst(.clk(clk), .reset_n(reset_n), .d(D), .q(Q));
  o_logic o_inst(.Q(Q), .La(La), .Lb(Lb));
  
endmodule
