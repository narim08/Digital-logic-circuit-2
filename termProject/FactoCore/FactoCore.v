module FactoCore(clk,reset_n,s_sel,s_wr,s_addr,s_din,s_dout,interrupt);
  input clk, reset_n;
  input s_sel, s_wr;
  input [15:0] s_addr;
  input [63:0] s_din;
  
  output wire [63:0] s_dout;
  output reg interrupt;
  
  reg wr, next_wr;
  reg [3:0] state, next_state;
  reg [15:0] addr, next_addr;
  reg [63:0] din, next_din;
  reg [63:0] op_start, next_op_start;
  reg [63:0] op_clear, next_op_clear;
  reg [63:0] operand, next_operand;
  reg [127:0] res, next_res;
  
  wire [127:0] result;
  wire op_done;
  
  
  //instance
  RF rf_inst(.clk(clk), .reset_n(reset_n), .wAddr(addr), .wData(din), .we(wr), .rAddr(addr), .rData(s_dout));
  FactoCtr fctr_inst(.clk(clk), .reset_n(reset_n), .op_start(op_start[0]), .op_clear(op_clear[0]), .oper(operand), .op_done(op_done), .result(result));
  
  
   //Encoded state
  parameter IDLE = 4'b0000;
  parameter START_operand1 = 4'b0001;
  parameter START_operand2 = 4'b0010;
  parameter START_Facto = 4'b0011;
  
  parameter RES_H = 4'b0100;
  parameter RES_L = 4'b0101;
  parameter IntrEn_READ = 4'b0110;
  parameter IntrEn2 = 4'b0111;
  
  parameter DONE = 4'b1000;
  parameter CLEAR = 4'b1001;
  parameter CLEAR2 = 4'b1010;
  parameter CLEAR3 = 4'b1011;
  
  
  //Sequential circuit part
  always @ (posedge clk or negedge reset_n) 
  begin
  if(!reset_n)
  begin
    state <= IDLE;
    addr <= s_addr;
	 din <= s_din;
	 wr <= s_wr;
	 op_start <= 64'd0;
	 op_clear <= 64'd0;
	 operand <= 64'd0;
	 res <= 64'd0;
  end
  else
  begin
    state <= next_state;
    addr <= next_addr;
	 din <= next_din;
	 wr <= next_wr;
	 op_start <= next_op_start;
	 op_clear <= next_op_clear;
	 operand <= next_operand;
	 res <= next_res;
  end
  end

  
   //combinational circuit part
  always @ (*) //state output generation
  begin 
  case(state)
  IDLE:
  begin
    if(addr==16'h7000 && s_dout==64'd1) begin //opstart
	   next_wr=1; //write;
		next_addr=16'h7008; //opdone
		next_din=64'h0000_0000_0000_0002; //opdone[1]=1
		next_state=START_operand1;
		next_op_start=64'd0;
	 end
	 else begin
	   next_state=IDLE;
		next_op_start=64'd0;
	 end
  end
  
  START_operand1:
  begin
    next_op_start=64'd0;
    next_wr=0; //read
	 next_addr=16'h7020; //operand
	 next_state = START_operand2;
  end
  
  START_operand2:
  begin
    next_operand = s_dout; //operand read
	 next_state = START_Facto;
  end
  
  START_Facto:
  begin
    if(s_dout==64'd0) begin //0!
	   next_op_start=64'd0;
	   next_wr=1; //write
		next_addr=16'h7008; //opdone
		next_din=64'h0000_0000_0000_0003; //end
		next_state=RES_H;
		next_res=64'd1;
	 end
	 else begin //FactoCtr start
	   next_operand=operand;
		next_op_clear=64'd0;
	   next_op_start=64'd1;
		if(op_done==1)begin //FactoCtr end
	     next_op_start=64'd0;
		  next_wr=1; //write
	     next_addr=16'h7008; //opdone
		  next_din=64'h0000_0000_0000_0003; //end
		  next_state=RES_H;
		  next_res=result;
		end
		else begin
		  next_state=START_Facto;
		end
	 end
  end
  
  RES_H: //result_h
  begin
    next_wr=1; //write
	 next_addr=16'h7028; //result_h
	 next_din=res[127:64];
	 next_state=RES_L;
  end
  
  RES_L: //result_l
  begin
    next_wr=1; //write
	 next_addr=16'h7030; //result_l
	 next_din=res[63:0];
	 next_state=IntrEn_READ;
  end
  
  IntrEn_READ:
  begin
    next_wr=0; //read
	 next_addr=16'h7018; //intrEn
	 next_state=IntrEn2;
  end
  
  IntrEn2:
  begin
    next_res=s_dout;
	 if(next_res==64'd1) begin //interrupt
	   interrupt=1;
	 end
	 else begin
	   interrupt=0;
	 end
	 next_wr=0; //read
	 next_addr=16'h7008; //opclear
	 next_state=DONE;
  end
  
  DONE:
  begin
    if(s_dout==64'd1) begin //opclear
	   next_wr = 16'h7000; //opstart clear
		next_din=64'd0;
		next_state=CLEAR;
	 end
	 else begin
	   next_state = state;
      next_addr = s_addr;
	   next_din = s_din;
	   next_wr = wr;
	   next_op_start = op_start; 
	   next_op_clear = op_clear;
	   next_operand = operand;
	   next_res = res;
	 end
  end
  
  CLEAR:
  begin
    next_wr = 16'h7010; //opdone clear
	 next_din=64'd0;
	 next_state=CLEAR2;
  end
  
  CLEAR2:
  begin
    next_wr = 16'h7028; //result_h clear
	 next_din=64'd0;
	 next_state=CLEAR3;
  end
  
  CLEAR3:
  begin
    next_wr = 16'h7030; //result_l clear
	 next_din=64'd1;
	 next_state=state;
  end
  
  endcase
  end
  
endmodule
