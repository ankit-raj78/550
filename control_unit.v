module control_unit(opcode, Rdst, ALUinB, Rwe, Rwd, DMwe, all_Rtype, ALUop, addi, add, sub);

	input[4:0] opcode, ALUop;
	output Rdst, Rwe, Rwd, DMwe, all_Rtype, ALUinB, addi, add, sub;
	
	wire lw,sw,sll,sra;
	
	wire not_o4, not_o3, not_o2, not_o1, not_o0, not_Rtype,not_ALUop4, not_ALUop3, not_ALUop2, not_ALUop1, not_ALUop0,isr1,isr2;
	
	not not4(not_o4, opcode[4]);
	not not3(not_o3, opcode[3]);
	not not2(not_o2, opcode[2]);
	not not1(not_o1, opcode[1]);
	not not0(not_o0, opcode[0]);
	
	not not10(not_ALUop4, ALUop[4]);
   not not6(not_ALUop3, ALUop[3]);
   not not7(not_ALUop2, ALUop[2]);
   not not8(not_ALUop1, ALUop[1]);
   not not9(not_ALUop0, ALUop[0]);

	
	and and_r(all_Rtype, not_o4, not_o3, not_o2, not_o1, not_o0); //00000
	
	and and_addi(addi, not_o4, not_o3, opcode[2], not_o1, opcode[0]); //00101-addi
	
	and and_lw(lw, not_o4, opcode[3], not_o2 , not_o1, not_o0); //lw
	
	and and_sw(sw, not_o4, not_o3, opcode[2] , opcode[1], opcode[0]); //sw
	
	not not5(not_Rtype, all_Rtype);
	
//	and and_sll(sll, not_ALUop4, not_ALUop3, ALUop[2], not_ALUop1, not_ALUop0);
//	and and_sra(sra, not_ALUop4, not_ALUop3, ALUop[2], not_ALUop1, ALUop[0]);
	
	//and isr_1(isr1, all_Rtype, sll);
	//and isr_2(isr2, all_Rtype, sra);
	
	//or or1(Rdst, not_Rtype, isr1, isr2);
	
	assign Rdst = sw ;

	and and_add(add,not_ALUop4, not_ALUop3, not_ALUop2, not_ALUop1, not_ALUop0);
	and and_sub(sub,not_ALUop4, not_ALUop3, not_ALUop2, not_ALUop1, ALUop[0]);
	
	or or_rwe(Rwe, all_Rtype, addi, lw);
	or or_aluinb(ALUinB, addi,lw,sw);
	
	
	assign DMwe = sw;
	assign Rwd = lw;
	
endmodule


	