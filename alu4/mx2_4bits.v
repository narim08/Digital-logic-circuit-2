module mx2_4bits(d0,d1,s,y); //4bits 2-to-1 MUX module
  input [3:0] d0,d1;
  input s; 
  
  output [3:0] y;
  
  //mu2 module instance
  mx2 mx2_1(.d0(d0[0]), .d1(d1[0]), .s(s), .y(y[0]));
  mx2 mx2_2(.d0(d0[1]), .d1(d1[1]), .s(s), .y(y[1]));
  mx2 mx2_3(.d0(d0[2]), .d1(d1[2]), .s(s), .y(y[2]));
  mx2 mx2_4(.d0(d0[3]), .d1(d1[3]), .s(s), .y(y[3]));
  
endmodule
