module cla4_ov(a, b, ci, s, c3, co); 
  input [3:0] a, b;
  input ci; 
  
  output [3:0] s; //sum
  output c3, co; //2 carry out
  
  wire c1, c2;
  
  //Full adder module instance
  fa_v2 fa_1 (.a(a[0]), .b(b[0]), .ci(ci), .s(s[0])); 
  fa_v2 fa_2 (.a(a[1]), .b(b[1]), .ci(c1), .s(s[1])); 
  fa_v2 fa_3 (.a(a[2]), .b(b[2]), .ci(c2), .s(s[2])); 
  fa_v2 fa_4 (.a(a[3]), .b(b[3]), .ci(c3), .s(s[3]));
  
  //carry look-ahead block module instance
  clb4 clb4_1(.a(a), .b(b), .ci(ci), .c1(c1), .c2(c2), .c3(c3), .co(co));
  
endmodule
