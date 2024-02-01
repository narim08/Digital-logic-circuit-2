module read_operation(Addr, Data, from_reg0, from_reg1, from_reg2, from_reg3, from_reg4, from_reg5, from_reg6);
  input [63:0] from_reg0, from_reg1, from_reg2, from_reg3, from_reg4, from_reg5, from_reg6;
  input [7:0] Addr;
  output [63:0] Data;
  
  //instance
  _7_to_1_MUX M_0(.a(from_reg0), .b(from_reg1), .c(from_reg2), .d(from_reg3), .e(from_reg4), .f(from_reg5), .g(from_reg6), .sel(Addr), .d_out(Data));
  
endmodule
