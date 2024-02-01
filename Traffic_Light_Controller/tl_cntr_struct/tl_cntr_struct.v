module tl_cntr_struct(clk,reset_n,Ta,Tb,La,Lb);
  input clk, reset_n, Ta,Tb;
  output [1:0] La, Lb;
  wire [1:0] Q;
  wire [1:0] D;
  
  //instance
 ns_logic ns_inst(.Ta(Ta), .Tb(Tb), .Q(Q), .D(D));
 _register2_r_async reg2_inst(.clk(clk), .reset_n(reset_n), .d(D), .q(Q));
 o_logic o_inst(.Q(Q), .La(La), .Lb(Lb));
  
endmodule
