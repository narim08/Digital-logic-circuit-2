module bus_arbit(clk, reset_n, m0_req, m1_req, m0_grant, m1_grant);
  input clk, reset_n;
  input m0_req, m1_req;
  output m0_grant, m1_grant;
  
  parameter M0 = 1'b0; 
  parameter M1 = 1'b1;
  
  reg state, next_state;
  reg m0_grant, m1_grant;
  reg next_m0_grant, next_m1_grant;
  
  
  //Sequential circuit part
  always@(posedge clk, negedge reset_n) begin
    if(!reset_n) begin
	   state <= M0;
		m0_grant <= 1'b1;
		m1_grant <= 1'b0;
	 end
	 else begin
	   state <= next_state;
		m0_grant <= next_m0_grant;
		m1_grant <= next_m1_grant;
	 end
  end
  
  
  always@(*) begin
  case(state)
  M0: begin
	 if(!m0_req && m1_req) begin
	   next_state = M1;
		next_m0_grant = 1'b0;
      next_m1_grant = 1'b1;
	 end
	 else if(!m0_req && !m1_req) begin
	   next_state = M0;
		next_m0_grant = 1'b1;
      next_m1_grant = 1'b0;
	 end
	 else begin //m0_req==1
	   next_state = M0;
		next_m0_grant = 1'b1;
      next_m1_grant = 1'b0;
	 end
  end
  
  M1: begin
	 if(!m1_req) begin
	   next_state = M0;
		next_m0_grant = 1'b1;
      next_m1_grant = 1'b0;
	 end
	 else begin //m1_req==1
	   next_state = M1;
		next_m0_grant = 1'b0;
      next_m1_grant = 1'b1;
	 end
  end
  endcase
  end
  
  
endmodule
