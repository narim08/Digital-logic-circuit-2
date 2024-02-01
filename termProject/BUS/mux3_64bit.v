module mux3_64bit(a,b,c,s,y); //64bits 3-to-1 MUX
  input [63:0] a, b, c;
  input [1:0] s;
  output [63:0] y;
  reg [63:0] y;
  
  always@(*) begin
  case (s)
    2'b00: y = a; //no slave
	 2'b01: y = c; //slave 1
	 2'b10: y = b; //slave 2
	 default: y = 64'h0;
  endcase
  end
  
endmodule
