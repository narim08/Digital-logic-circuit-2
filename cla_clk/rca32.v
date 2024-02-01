module rca32(a,b,ci,s,co);
  input [31:0] a,b; 
  input ci; //carry in
  output [31:0] s; //sum
  output co; //carry out
  wire c1,c2,c3,c4,c5,c6,c7; //carry wire
  
  rca4 rca4_1(.a(a[3:0]), .b(b[3:0]), .ci(ci), .s(s[3:0]), .co(c1));
  rca4 rca4_2(.a(a[7:4]), .b(b[7:4]), .ci(c1), .s(s[7:4]), .co(c2));
  rca4 rca4_3(.a(a[11:8]), .b(b[11:8]), .ci(c2), .s(s[11:8]), .co(c3));
  rca4 rca4_4(.a(a[15:12]), .b(b[15:12]), .ci(c3), .s(s[15:12]), .co(c4));
  rca4 rca4_5(.a(a[19:16]), .b(b[19:16]), .ci(c4), .s(s[19:16]), .co(c5));
  rca4 rca4_6(.a(a[23:20]), .b(b[23:20]), .ci(c5), .s(s[23:20]), .co(c6));
  rca4 rca4_7(.a(a[27:24]), .b(b[27:24]), .ci(c6), .s(s[27:24]), .co(c7));
  rca4 rca4_8(.a(a[31:28]), .b(b[31:28]), .ci(c7), .s(s[31:28]), .co(co));
  
endmodule
