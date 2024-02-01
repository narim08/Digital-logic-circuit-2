module RF(clk, reset_n, wAddr, wData, we, rAddr, rData);
  input clk, reset_n;
  input we;
  input [7:0] wAddr, rAddr;
  input [63:0] wData;
  output [63:0] rData;
 
  wire [6:0] to_reg;
  wire [63:0] from_reg[6:0];
  
  //instance
  write_operation wo_0(.Addr(wAddr), .we(we), .to_reg(to_reg));
  register64_7 rg64_7(.clk(clk), .reset_n(reset_n), .en(to_reg), .d_in(wData), .d_out0(from_reg[0]), .d_out1(from_reg[1]), .d_out2(from_reg[2]), .d_out3(from_reg[3]), .d_out4(from_reg[4]), .d_out5(from_reg[5]), .d_out6(from_reg[6]));
  read_operation rd_0(.Addr(rAddr), .Data(rData), .from_reg0(from_reg[0]), .from_reg1(from_reg[1]), .from_reg2(from_reg[2]), .from_reg3(from_reg[3]), .from_reg4(from_reg[4]), .from_reg5(from_reg[5]), .from_reg6(from_reg[6]));
  
endmodule
