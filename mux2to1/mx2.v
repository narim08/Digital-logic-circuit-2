module mx2 (d0, d1, s, y); //MUX module
  input d0, d1, s; 
  output y;
  wire sb, w0, w1;
  
  _nand2 nd20(.a(d0), .b(sb), .y(w0)); //NAND gate module
  _nand2 nd21(.a(d1), .b(s), .y(w1)); 
  _nand2 nd22(.a(w0), .b(w1), .y(y));
  _inv iv0(.a(s), .y(sb)); //inverter gate module
  
endmodule
  
  