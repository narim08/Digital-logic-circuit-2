module BUS_addr(m_req, addr, s0_sel, s1_sel);
  input m_req;
  input [15:0] addr;
  output s0_sel, s1_sel;
  
  reg s0_sel, s1_sel;
  
  
  always@(m_req, addr) begin
    if(m_req==1'b0) begin //no slave
	   {s0_sel, s1_sel} = 2'b00;
	 end
	 else begin //m_req==1
      if(addr[15:11]==5'b00000) begin //s0_sel: 0x0000~0x07FF
	     {s0_sel, s1_sel} = 2'b10; 
	   end
	   else if(addr[15:9]==7'b0111000) begin //s1_sel: 0x7000~0x71FF
	     {s0_sel, s1_sel} = 2'b01;
	   end
	   else begin //invalid address
	     {s0_sel, s1_sel} = 2'b00;
	   end
	 end
  end
  
endmodule
