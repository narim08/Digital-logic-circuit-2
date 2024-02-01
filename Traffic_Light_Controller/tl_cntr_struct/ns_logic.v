module ns_logic(Ta, Tb, Q, D);
  input Ta, Tb;
  input [1:0] Q;
  output [1:0] D;
  wire w0, w1;
  wire iw0, iw1;
  
  //D0
  _nor3 n3_inst(.a(Q[1]), .b(Q[0]), .c(Ta), .y(w0));
  
  _inv inv_ins1(.a(Q[0]), .y(iw0));
  _inv inv_ins2(.a(Tb), .y(iw1));
  _and3 a3_inst(.a(Q[1]), .b(iw0), .c(iw1), .y(w1));
  
  _or2 o2_inst(.a(w0), .b(w1), .y(D[0]));
  
  
  //D1
  _xor2 x2_inst(.a(Q[1]), .b(Q[0]), .y(D[1]));
  
endmodule
  