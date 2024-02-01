module rca_clk(clk,a,b,ci,s,co);
  input clk; //clock
  input [31:0] a,b; 
  input ci; //carry in
  
  output [31:0] s; //sum
  output co; //carry out
  
  reg [31:0]  reg_a, reg_b; 
  reg         reg_ci;
  reg [31:0]  reg_s;
  reg         reg_co;
  
  wire [31:0] wire_s; 
  wire wire_co;
  
  
  always @ (posedge clk) 
  begin 
    reg_a <= a; 
    reg_b <= b;
    reg_ci <= ci;
	 reg_s <= wire_s; 
    reg_co <= wire_co;
  end
  
  //32-bit RCA module instance
  rca32 rca32_0(.a(reg_a), .b(reg_b), .ci(reg_ci), .s(wire_s), .co(wire_co));

  assign s = reg_s; 
  assign co = reg_co;

endmodule
