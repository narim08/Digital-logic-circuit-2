module mx2(d0, d1, s, y); //1bits 2-to-1 MUX module
  input d0,d1; 
  input s; //mux switch
  
  output y;
  
  wire sb,w0,w1;
  
  //inverter and nand gate module instance
  _inv inv_1(.a(s), .y(sb));
  _nand2 nand2_1(.a(d0), .b(sb), .y(w0));
  _nand2 nand2_2(.a(d1), .b(s), .y(w1));
  _nand2 nand2_3(.a(w0), .b(w1), .y(y));
  
endmodule
