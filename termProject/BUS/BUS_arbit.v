module BUS_arbit(clk, reset_n, m_req, m_grant);
  input clk, reset_n;
  input m_req;
  output m_grant;
  
  parameter IDLE = 1'b0; 
  parameter M = 1'b1;
  
  reg state, next_state;
  reg m_grant, next_m_grant;
  
  
  //Sequential circuit part
  always@(posedge clk, negedge reset_n) begin
    if(!reset_n) begin
	   state <= IDLE;
		m_grant <= 1'b0;
	 end
	 else begin
	   state <= next_state;
		m_grant <= next_m_grant;
	 end
  end
  
  
  always@(*) begin
  case(state)
  IDLE: begin
	 if(m_req) begin //state transition
	   next_state = M;
		next_m_grant = 1'b1;
	 end
	 else begin //!m0_req
	   next_state = IDLE;
		next_m_grant = 1'b0;
	 end
  end
  
  M: begin
	 if(!m_req) begin //state transition
	   next_state = IDLE;
		next_m_grant = 1'b0;
	 end
	 else begin //m_req==1
	   next_state = M;
		next_m_grant = 1'b1;
	 end
  end
  endcase
  end
  
  
endmodule
