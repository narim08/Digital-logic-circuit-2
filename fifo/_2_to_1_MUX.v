module _2_to_1_MUX(a, b, s, y); //2-to-1 MUX
  input [31:0] a, b;
  input s;
  output [31:0] y;
  reg [31:0] y;
  
  always@(a,b,s) begin
    if(s==0) begin
      y=b;
    end
    else begin
      y=a;
    end
  end
  
endmodule
