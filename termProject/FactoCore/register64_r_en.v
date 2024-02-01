module register64_r_en(clk, reset_n, en, d, q); //32bit register
  input clk, reset_n, en;
  input [63:0] d;
  output reg [63:0] q;
  
  always@(posedge clk or negedge reset_n) 
  begin
    if(reset_n == 0) q <= 63'b0;
    else if(en) q <= d;
    else q <= q;
  end


endmodule
