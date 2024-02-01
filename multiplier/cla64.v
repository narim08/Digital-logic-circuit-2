module cla64(a, b, ci, s, co); //64-bit CLA module 
  input [63:0] a, b;
  input ci; 
  output [63:0] s; 
  output co;
  wire c1;
  
  //4-bit CLA module instance
  cla32 cla32_1(.a(a[31:0]), .b(b[31:0]), .ci(ci), .s(s[31:0]), .co(c1));
  cla32 cla32_2(.a(a[63:32]), .b(b[63:32]), .ci(c1), .s(s[63:32]), .co(co));
  
endmodule
