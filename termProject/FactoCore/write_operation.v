module write_operation(Addr, we, to_reg);
  input we;
  input [7:0] Addr;
  output [6:0] to_reg;
  
  wire [6:0] w_a;
  
  //instance
  _8_to_7_decoder dec_87(.d(Addr), .q(w_a));
  
  _and2 a2_0(.a(we), .b(w_a[0]), .y(to_reg[0]));
  _and2 a2_1(.a(we), .b(w_a[1]), .y(to_reg[1]));
  _and2 a2_2(.a(we), .b(w_a[2]), .y(to_reg[2]));
  _and2 a2_3(.a(we), .b(w_a[3]), .y(to_reg[3]));
  
  _and2 a2_4(.a(we), .b(w_a[4]), .y(to_reg[4]));
  _and2 a2_5(.a(we), .b(w_a[5]), .y(to_reg[5]));
  _and2 a2_6(.a(we), .b(w_a[6]), .y(to_reg[6]));
  
endmodule