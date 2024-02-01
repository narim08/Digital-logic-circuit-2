module rca4(a,b,ci,s,co);
  input [3:0] a,b;
  input ci; //carry in
  output [3:0] s; 
  output co; //carry out
  wire [2:0] c;
  
  //Full adder module instance
  fa fa_1(.a(a[0]), .b(b[0]), .ci(ci),.s(s[0]), .co(c[0])); 
  fa fa_2(.a(a[1]), .b(b[1]), .ci(c[0]),.s(s[1]), .co(c[1])); 
  fa fa_3(.a(a[2]), .b(b[2]), .ci(c[1]),.s(s[2]), .co(c[2])); 
  fa fa_4(.a(a[3]), .b(b[3]), .ci(c[2]),.s(s[3]), .co(co));

endmodule
