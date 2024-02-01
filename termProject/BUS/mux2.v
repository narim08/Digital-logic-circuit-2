module mux2(a, b, s, y); //1bits 2-to-1 MUX
  input a, b; 
  input s;
  output y;
  reg y;
  
  always@(a,b,s) begin
    if(s==0) begin
      y=b;
    end
    else begin
      y=a;
    end
  end
  
endmodule
