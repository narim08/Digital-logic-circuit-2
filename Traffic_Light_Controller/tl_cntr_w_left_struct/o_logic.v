module o_logic(Q, La, Lb);
  input [2:0] Q;
  output [1:0] La, Lb;
  wire iw0, iw2;
  wire wa1, wb1;
  
  //La1
  _inv inv_0(.a(Q[0]), .y(iw0));
  _and2 a2_0(.a(Q[1]), .b(iw0), .y(wa1));
  _or2 o2_0(.a(wa1), .b(Q[2]), .y(La[1]));
  
  //La0
  _or2 o2_1(.a(Q[0]), .b(Q[2]), .y(La[0]));
  
  //Lb1
  _inv inv_1(.a(Q[2]), .y(iw2));
  _and2 a2_1(.a(Q[1]), .b(iw0), .y(wb1));
  _or2 o2_2(.a(iw2), .b(wb1), .y(Lb[1]));
  
  //Lb0
  _or2 o2_3(.a(iw2), .b(Q[0]), .y(Lb[0]));
		
endmodule
