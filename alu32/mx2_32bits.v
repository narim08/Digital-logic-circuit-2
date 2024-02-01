module mx2_32bits(d0, d1, s, y); //32-bits 8-to-1 MUX
  input [31:0] d0, d1;
  input s;
  
  output [31:0] y;
  
  assign y = (s==0) ? d0 : d1; //conditional operator
  
endmodule
