module ram(clk,cen,wen,s_addr,s_din,s_dout);
  input clk;
  input cen,wen;
  input [7:0] s_addr;
  input [63:0] s_din;
  output reg [63:0] s_dout;
  
  reg [63:0] mem [0:255];
  integer i;
  
  
  //memory initialization
  initial begin
    for(i=0; i<256; i=i+1) begin
      mem[i]<=64'h0;
    end
  end
  
  
  //read/write performance
  always@(posedge clk) begin //write
    if(cen & wen) begin
	   mem[s_addr] <= s_din;
		s_dout <= 64'h0;
	 end
	 else if(cen & !wen) begin
	   s_dout <= mem[s_addr];
	 end
	 else if(!cen) begin
	   s_dout <= 64'h0;
	 end
  end
  
  
endmodule
