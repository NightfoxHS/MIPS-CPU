
module npc(
   input [31:0] oldPC,
	 input [15:0] beq_imm,
	 input [25:0] addr,
	 input [31:0] reg_in,
	 input  beq_zero,    
    input [1:0] PC_sel,   
    output reg [31:0] newPC
    );
  
   wire [31:0] PC4;
   assign PC4 = oldPC + 4;
   
	 always @(oldPC or beq_imm or beq_zero or PC_sel) begin
		case(PC_sel)
			2'b00:	newPC = PC4;
			2'b01:			
				if(beq_zero == 1) newPC = PC4 + {{14{beq_imm[15]}},beq_imm[15:0],2'b00};//beq
				else newPC = PC4;	
			2'b10: //j&jal
			  newPC = {{PC4[31:28]},addr[25:0],2'b00};
			2'b11: newPC = reg_in; //jr
	  				
		endcase		
	
	 end	 

endmodule
