module bus_addr(addr, s0_sel, s1_sel);
  input [7:0] addr;
  output s0_sel, s1_sel;
  
  reg s0_sel, s1_sel;
  
  
  always@(addr) begin
    if(addr[7:5]==3'b000) begin //0x00~0x1F
	   {s0_sel, s1_sel} = 2'b10;
	 end
	 else if(addr[7:5]==3'b001) begin //0x20~0x3F
	   {s0_sel, s1_sel} = 2'b01;
	 end
	 else begin
	   {s0_sel, s1_sel} = 2'b00;
	 end
  end
  
  
endmodule
