module fa_v2(a,b,ci,s);
  input a,b,ci;
  output s;
  wire w0;
  
  //XOR module instance
  _xor2 xor_1(.a(a), .b(b), .y(w0));
  _xor2 xor_2(.a(w0), .b(ci), .y(s));
  
endmodule
