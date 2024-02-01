module mx4(y, d0, d1, d2, d3, s); //1-bit 4-to-1 multiplexer
  input d0, d1, d2, d3;
  input [1:0] s;
  output y;
  wire y0, y1;
  
  //instance
  mx2 m2_0(.d0(d0), .d1(d1), .s(s[0]), .y(y0));
  mx2 m2_1(.d0(d2), .d1(d3), .s(s[0]), .y(y1));
  
  mx2 m2_2(.d0(y0), .d1(y1), .s(s[1]), .y(y));
  
endmodule
