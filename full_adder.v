/* Full adder module to create a 8 bit ripple carry adder module
*/
module full_adder(a, b, cin, sum, cout);

	input a, b, cin;
	output sum, cout;
	
	wire w1,w2,w3,w4;
	
   xor xor_gate(sum, a, b, cin);
	xor xor_gate1(w1, a, b);
	and and_gate(w2, a, b);
	and and_gate1(w3, w1, cin);
	or  or_gate(cout, w2, w3);
	
endmodule 
