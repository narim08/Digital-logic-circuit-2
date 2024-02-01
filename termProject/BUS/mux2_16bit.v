module mux2_16bit(a,b,s,y); ////16bits 2-to-1 MUX
  input [15:0] a, b;
  input s;
  output [15:0] y;
  reg [15:0] y;
  
  always@(a,b,s) begin
    if(s==0) begin
      y=b;
    end
    else begin
      y=a;
    end
  end
  
endmodule
