module _nand2 (a, b, y); //NAND gate module
  input a, b;
  output y;
  
  assign y = ~(a&b); //NAND operation
  
endmodule


module _inv (a, y); //inverter module
  input a;
  output y;
  
  assign y = ~a; //NOT operation
endmodule
