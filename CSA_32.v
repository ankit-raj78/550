module CSA_32(a, b, cin, sum, cout);

	input [31:0] a, b;
	input cin;
   output [31:0] sum;
   output cout;


   wire w1,w2,w3;
   wire [15:0] s1,s2;



   CSA_16 my_CSA1(.a(a[15:0]), .b(b[15:0]), .cin(cin), .sum(sum[15:0]), .cout(w1));
	
   CSA_16 my_CSA2(.a(a[31:16]), .b(b[31:16]), .cin(1'b0), .sum(s1), .cout(w2));
	CSA_16 my_CSA3(.a(a[31:16]), .b(b[31:16]), .cin(1'b1), .sum(s2), .cout(w3));
	
	muxes_16 my_mux1(.a(s1), .b(s2), .sel(w1), .out(sum[31:16]));

	muxes_1  mymux3(.a(w2), .b(w3), .sel(w1), .out(cout));
	//This using the 32nd bit (or nbits-1 here) of a, b and the computed sum to check for signed-overflow 
	//overflow_check my_overflow1(.a(a[31]), .b(b[31]), .sum(sum[31]), .overflow(overflow));

	
   	
endmodule
