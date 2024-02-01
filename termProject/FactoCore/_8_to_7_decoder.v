module _8_to_7_decoder(d, q); // 8-to-7 decoder
  input [7:0] d;
  output reg [6:0] q;
  
  always@(d) begin
  case(d[7:3])
	 5'b00000: q = 7'b0000001;
	 5'b00001: q = 7'b0000010;
	 5'b00010: q = 7'b0000100;
	 5'b00011: q = 7'b0001000;
	 5'b00100: q = 7'b0010000;
	 5'b00101: q = 7'b0100000;
	 5'b00110: q = 7'b1000000;
	 default: q = 7'hx;
  endcase
  end
  
endmodule
