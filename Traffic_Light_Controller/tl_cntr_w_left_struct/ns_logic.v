module ns_logic(Ta, Tal, Tb, Tbl, Q, D);
  input Ta, Tal, Tb, Tbl;
  input [2:0] Q;
  output [2:0] D;
  wire w2_0, w2_1, w2_2;
  wire w1_0, w1_1, w1_2;
  wire w0_0, w0_1, w0_2, w0_3;
  wire iw0, iw1, iw2;
  wire iwTa, iwTal, iwTb, iwTbl;
  
  //D2
  _inv inv_0(.a(Q[2]), .y(iw2));
  _and3 a3_0(.a(iw2), .b(Q[1]), .c(Q[0]), .y(w2_0));
  
  _inv inv_1(.a(Q[1]), .y(iw1));
  _and2 a2_0(.a(Q[2]), .b(iw1), .y(w2_1));
  
  _inv inv_2(.a(Q[0]), .y(iw0));
  _and3 a3_1(.a(Q[2]), .b(Q[1]), .c(iw0), .y(w2_2));
  
  _or3 o3_0(.a(w2_0), .b(w2_1), .c(w2_2), .y(D[2]));
  
  
  //D1
  _and3 a3_2(.a(iw2), .b(iw1), .c(Q[0]), .y(w1_0));
  _and2 a2_1(.a(Q[1]), .b(iw0), .y(w1_1));
  _and3 a3_3(.a(Q[2]), .b(iw1), .c(Q[0]), .y(w1_2));
  
  _or3 o3_1(.a(w1_0), .b(w1_1), .c(w1_2), .y(D[1]));
  
  
  //D0
  _inv inv_3(.a(Ta), .y(iwTa));
  _inv inv_4(.a(Tal), .y(iwTal));
  _inv inv_5(.a(Tb), .y(iwTb));
  _inv inv_6(.a(Tbl), .y(iwTbl));
  
  _and4 a4_0(.a(iw2), .b(iw1), .c(iw0), .d(iwTa), .y(w0_0));
  _and4 a4_1(.a(iw2), .b(Q[1]), .c(iw0), .d(iwTal), .y(w0_1));
  _and4 a4_2(.a(Q[2]), .b(iw1), .c(iw0), .d(iwTb), .y(w0_2));
  _and4 a4_3(.a(Q[2]), .b(Q[1]), .c(iw0), .d(iwTbl), .y(w0_3));
  
  _or4 o4_0(.a(w0_0), .b(w0_1), .c(w0_2), .d(w0_3), .y(D[0]));
  
endmodule
