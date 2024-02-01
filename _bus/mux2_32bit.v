module mux2_32bit(a,b,s,y); //32bits 2-to-1 MUX
  input [63:0] a, b;
  input s;
  output [63:0] y;
  reg [63:0] y;
  
  always@(a,b,s) begin
    if(s==0) begin
      y=b;
    end
    else begin
      y=a;
    end
  end
  
endmodule
