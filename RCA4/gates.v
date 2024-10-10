module _inv(a,y); //inverter gate
  input a;
  output y;
  assign y=~a; //NOT operation
endmodule


module _nand2(a,b,y); //NAND gate
  input a,b;
  output y;
  assign y=~(a&b); //NAND operation
endmodule


module _and2(a,b,y); //AND gate
  input a,b;
  output y;
  assign y=a&b; //AND operation
endmodule


module _or2(a,b,y); //OR gate
  input a,b;
  output y;
  assign y=a|b; //OR operation
endmodule


module _xor2(a,b,y); //XOR gate
  input a,b;
  output y;
  wire inv_a, inv_b;
  wire w0, w1;
  
  _inv inv_1(.a(b), .y(inv_b)); //inverter module instance
  _inv inv_2(.a(a), .y(inv_a));
  
  _and2 and_1(.a(a), .b(inv_b), .y(w0)); //AND module instance
  _and2 and_2(.a(inv_a), .b(b), .y(w1));
  
  _or2 or_1(.a(w0), .b(w1), .y(y)); //OR module instance
endmodule
