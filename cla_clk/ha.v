module ha(a,b,s,co); //Half adder module
  input a,b;
  output s, co; //sum, carry out
  
  _xor2 xor_1(.a(a), .b(b), .y(s)); //XOR module instance
  _and2 and_1(.a(a), .b(b), .y(co)); //AND module instance
  
endmodule
