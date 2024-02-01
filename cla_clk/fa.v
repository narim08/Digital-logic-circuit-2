module fa(a,b,ci,s,co); //Full adder module
  input a,b,ci; //ci: carry in
  output s,co; //sum, carry out
  wire c1, c2, sm;
  
  ha haf_1(.a(b), .b(ci), .s(sm), .co(c1)); //Half adder module instance
  ha haf_2(.a(a), .b(sm), .s(s), .co(c2));
  
  _or2 or_1(.a(c2), .b(c1), .y(co)); //OR module instance
  
endmodule
