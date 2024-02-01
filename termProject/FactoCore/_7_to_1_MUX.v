module _7_to_1_MUX(a, b, c, d, e, f, g, sel, d_out); //7-to-1 MUX
  input [64:0] a,b,c,d,e,f,g;
  input [7:0] sel;
  output reg [64:0] d_out;
  
  always@(sel, a, b, c, d, e, f, g) begin
  case(sel[7:3])
    5'b00000: d_out <= a; //opstart
	 5'b00001: d_out <= b; //opclear
	 5'b00010: d_out <= c; //opdone
	 5'b00011: d_out <= d; //intrEn
	 5'b00100: d_out <= e; //operand
	 5'b00101: d_out <= f; //result_h
	 5'b00110: d_out <= g; //result_l
	 default: d_out <= 64'hx;
  endcase
  end
  
endmodule
