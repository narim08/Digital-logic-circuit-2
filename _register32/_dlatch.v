module _dlatch(clk,d,q,q_bar);
  input clk; //clock
  input d;
  output q,q_bar;
  reg q;
  
  always@(clk or d)begin
    if(clk==1) //Update q value according to d
      q<=d;
  end
  
  assign q_bar=~q;
endmodule
