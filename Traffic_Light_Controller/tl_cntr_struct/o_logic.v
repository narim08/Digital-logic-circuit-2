module o_logic(Q, La, Lb);
  input [1:0] Q;
  output [1:0] La, Lb;
  wire iw0, iw1;
  
  //La1
  _buf buf_inst(.a(Q[1]), .y(La[1]));
  
  //La0
  _inv inv_inst1(.a(Q[1]), .y(iw0));
  _and2 a2_inst1(.a(iw0), .b(Q[0]), .y(La[0]));
  
  //Lb1
  _inv inv_inst2(.a(Q[1]), .y(Lb[1]));
  
  //Lb0
  _and2 a2_inst2(.a(Q[1]), .b(Q[0]), .y(Lb[0]));
		
endmodule
