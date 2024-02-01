module ha(a,b,s,co);
  input a,b;
  output s, co;
  
  _xor2 xor_1(.a(a), .b(b), .y(s));
  _and2 and_1(.a(a), .b(b), .y(co));
  
endmodule
