/* This is 16 bit CSA mosule which again computes 3 blocks at once. The first block
compuutes the 0-7 bits and 2nd and 3rd blocks computes the 8-15 bits for both cin 1 and 0.
Then the 2nd and 3rd CSA blocks are passed through a 2:1 8 bit mux with the select signal being the cout of the first computed
CSA block to choose between them for the final computation. Theres also a 1 bit mux to select the cout between the 2nd and 3rd 
CSA block based on the cout signal.
*/
module CSA_16(a, b, cin, sum, cout);

	input [15:0] a, b;
	input cin;
   output [15:0] sum;
   output cout;


   wire w1,w2,w3;
   wire [7:0] s1,s2;


   RCA_8 my_RCA1(.a(a[7:0]), .b(b[7:0]), .cin(cin), .sum(sum[7:0]), .cout(w1));
	
   RCA_8 my_RCA2(.a(a[15:8]), .b(b[15:8]), .cin(1'b0), .sum(s1), .cout(w2));
	RCA_8 my_RCA3(.a(a[15:8]), .b(b[15:8]), .cin(1'b1), .sum(s2), .cout(w3));
	
	muxes_8 my_mux1(.a(s1), .b(s2), .sel(w1), .out(sum[15:8]));
	muxes_1  mymux2(.a(w2), .b(w3), .sel(w1), .out(cout));
	
endmodule
