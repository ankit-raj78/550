module muxes_1(a, b, sel, out);

	input  a,b;
	input sel;
	output  out;
	
	wire w1,w2, not_sel;
	
	and and_gate1(w1, b, sel);
	not not_gate1(not_sel, sel);
	and and_gate2(w2, a, not_sel);
	or  or_gate1(out, w1, w2);
	
endmodule

