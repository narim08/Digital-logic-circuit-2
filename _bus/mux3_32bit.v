module mux3_32bit(a,b,c,s,y); //32bits 3-to-1 MUX
  input [63:0] a, b, c;
  input [1:0] s;
  output [63:0] y;
  reg [63:0] y;
  
  always@(a,b,c,s) begin
    if(s==2'b00) begin
      y=a;
    end
    else if(s==2'b01) begin
      y=c;
    end
	 else if(s==2'b10) begin
	   y=b;
	 end
  end
  
endmodule
