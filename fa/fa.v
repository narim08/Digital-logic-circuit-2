module fa(a,b,ci,s,co);
  input a,b,ci;
  output s,co;
  wire c1, c2, sm;
  
  ha haf_1(.a(b), .b(ci), .s(sm), .co(c1));
  ha haf_2(.a(a), .b(sm), .s(s), .co(c2));
  
  _or2 or_1(.a(c2), .b(c1), .y(co));
  
endmodule
