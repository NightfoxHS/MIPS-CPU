
`include "ctrl_encode_def.v"

module alu(
    input [31:0] A,
    input [31:0] B, //ALUSrc_out
    input [4:0] ALUOp,
    input [4:0] shamt,
    input [15:0] offset,
    output reg [31:0] C,
	 output reg zero
    );
    
	 always @(A or B or ALUOp or shamt) begin
		case(ALUOp)
			`ALUOp_ADDU: C = A + B; //addu
			`ALUOp_SUBU: C = A - B; //subu
			`ALUOp_ADD: C = $signed(A) + $signed(B); //add&addi
			`ALUOp_SUB: C = $signed(A) - $signed(B); //sub
			`ALUOp_OR: C = A | B; //or&ori
			`ALUOp_AND: C = A & B; //and
			`ALUOp_LUI: C = {B[15:0],16'h0000}; //lui
			`ALUOp_SLL: C = B << shamt; //sll
			`ALUOp_SRL: C = B >> shamt; //srl
			`ALUOp_SRA: C = $signed(B) >>> shamt; //sra		
			`ALUOp_EQL: zero = (A==B)?1'b1:1'b0;//beq
			`ALUOp_BNE: zero = (A==B)?1'b0:1'b1;//bne			
			`ALUOp_SLT: begin //slt&slti	
			     if($signed(A)<$signed(B)) C = 32'h0001;
			     else C = 32'h0000;
			     //$display("C: %8x",C);
			   end
			`ALUOp_SW: C = $signed(A) + {{16{offset[15]}},offset[15:0]};
			`ALUOp_LW: C = $signed(A) + {{16{offset[15]}},offset[15:0]};
		endcase
	 end
	 
endmodule



