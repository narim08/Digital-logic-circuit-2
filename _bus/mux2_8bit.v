module mux2_8bit(a,b,s,y); ////8bits 2-to-1 MUX
  input [7:0] a, b;
  input s;
  output [7:0] y;
  reg [7:0] y;
  
  always@(a,b,s) begin
    if(s==0) begin
      y=b;
    end
    else begin
      y=a;
    end
  end
  
endmodule
