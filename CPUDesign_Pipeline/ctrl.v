`include "ctrl_encode_def.v"
`include "instruction_def.v"

module ctrl(
    input [5:0] opcode,
    input [5:0] func,
    output reg [1:0] RegDst,
    output reg ALUSrc,
    output reg MemRead,
    output reg RegWrite,
    output reg MemWrite,
    output reg [1:0] DatatoReg,
    output reg [1:0] PC_sel,
    output reg ExtOp,
    output reg [4:0] ALUCtrl,
    output reg ShamtSrc,
	output reg Branch
    );
	
	always @(opcode or func ) begin
		case(opcode)
		`INSTR_RTYPE_OP:   // R type  
				case(func)
				  //addu
				  `INSTR_ADDU_FUNCT:
				  begin
					  RegDst = 2'b01;
					  ALUSrc = 0;
					  MemRead = 0;
					  RegWrite = 1;
					  MemWrite = 0;
					  DatatoReg = 2'b00;
					  PC_sel = 2'b00;
					  ExtOp = 0;
					  ALUCtrl = `ALUOp_ADDU;		
					  ShamtSrc = 0;
					  Branch = 0;
				  end
			
				  //subu
				  `INSTR_SUBU_FUNCT:
				  begin
					  RegDst = 2'b01;
				    ALUSrc = 0;
					  MemRead = 0;
					  RegWrite = 1;
					  MemWrite = 0;
					  DatatoReg = 2'b00;
					  PC_sel = 2'b00;
					  ExtOp = 0;
					  ALUCtrl = `ALUOp_SUBU;		
					  ShamtSrc = 0;
					  Branch = 0;
				  end								
					
					//add
					`INSTR_ADD_FUNCT:
					begin
					  RegDst = 2'b01;
						ALUSrc = 0;
						MemRead = 0;
						RegWrite = 1;
						MemWrite = 0;
						DatatoReg = 2'b00;
						PC_sel = 2'b00;
						ExtOp = 0;
						ALUCtrl = `ALUOp_ADD;		
						ShamtSrc = 0;
						Branch = 0;
					end								
					
					//sub
					`INSTR_SUB_FUNCT:
					begin
					  RegDst = 2'b01;
						ALUSrc = 0;
						MemRead = 0;
						RegWrite = 1;
						MemWrite = 0;
						DatatoReg = 2'b00;
						PC_sel = 2'b00;
						ExtOp = 0;
						ALUCtrl = `ALUOp_SUB;		
						ShamtSrc = 0;
						Branch = 0;
					end
					
					//or
					`INSTR_OR_FUNCT:
					begin
					  RegDst = 2'b01;
						ALUSrc = 0;
						MemRead = 0;
						RegWrite = 1;
						MemWrite = 0;
						DatatoReg = 2'b00;
						PC_sel = 2'b00;
						ExtOp = 0;
						ALUCtrl = `ALUOp_OR;		
						ShamtSrc = 0;
						Branch = 0;
					end
					
					//and
					`INSTR_AND_FUNCT:
					begin
					  RegDst = 2'b01;
						ALUSrc = 0;
						MemRead = 0;
						RegWrite = 1;
						MemWrite = 0;
						DatatoReg = 2'b00;
						PC_sel = 2'b00;
						ExtOp = 0;
						ALUCtrl = `ALUOp_AND;		
						ShamtSrc = 0;
						Branch = 0;
					end
					
					//sll
					`INSTR_SLL_FUNCT:
					begin
					  RegDst = 2'b01;
						ALUSrc = 0;
						MemRead = 0;
						RegWrite = 1;
						MemWrite = 0;
						DatatoReg = 2'b00;
						PC_sel = 2'b00;
						ExtOp = 0;
						ALUCtrl = `ALUOp_SLL;
						ShamtSrc = 1;
						Branch = 0;
					end
					
					//srl
					`INSTR_SRL_FUNCT:
					begin
					  RegDst = 2'b01;
						ALUSrc = 0;
						MemRead = 0;
						RegWrite = 1;
						MemWrite = 0;
						DatatoReg = 2'b00;
						PC_sel = 2'b00;
						ExtOp = 0;
						ALUCtrl = `ALUOp_SRL;
						ShamtSrc = 1;
						Branch = 0;
					end
					
					//sra
					`INSTR_SRA_FUNCT:
					begin
					  RegDst = 2'b01;
						ALUSrc = 0;
						MemRead = 0;
						RegWrite = 1;
						MemWrite = 0;
						DatatoReg = 2'b00;
						PC_sel = 2'b00;
						ExtOp = 0;
						ALUCtrl = `ALUOp_SRA;
						ShamtSrc = 1;
						Branch = 0;
					end
					
					//jr
			    `INSTR_JR_FUNCT:
			    begin
			      RegDst = 2'b00;
				    ALUSrc = 0;
				    MemRead = 0;
				    RegWrite = 0;
				    MemWrite = 0;
				    DatatoReg = 2'b00;
				    PC_sel = 2'b11;
				    ExtOp = 0;
				    ALUCtrl = 3'b000;			
				    ShamtSrc = 0;
					Branch = 1;
			    end
			    
			    //slt
			    `INSTR_SLT_FUNCT:
			    begin
					  RegDst = 2'b01;
						ALUSrc = 0;
						MemRead = 0;
						RegWrite = 1;
						MemWrite = 0;
						DatatoReg = 2'b00;
						PC_sel = 2'b00;
						ExtOp = 0;
						ALUCtrl = `ALUOp_SLT;		
						ShamtSrc = 0;
						Branch = 0;
					end
																					
				
				endcase //the end of the func
			
			//addi
			`INSTR_ADDI_OP:
			begin
			  RegDst = 2'b00;
				ALUSrc = 1;
				MemRead = 0;
				RegWrite = 1;
				MemWrite = 0;
				DatatoReg = 2'b00;
				PC_sel = 2'b00;
				ExtOp = 1;
				ALUCtrl = `ALUOp_ADD;		
				ShamtSrc = 0;
				Branch = 0;
			end
			
			//slti
			`INSTR_SLTI_OP:
			begin
			  RegDst = 2'b00;
				ALUSrc = 1;
				MemRead = 0;
				RegWrite = 1;
				MemWrite = 0;
				DatatoReg = 2'b00;
				PC_sel = 2'b00;
				ExtOp = 1;
				ALUCtrl = `ALUOp_SLT;		
				ShamtSrc = 0;
				Branch = 0;
			end
		  
			//ori
			`INSTR_ORI_OP:  //6'b001101:
			 begin
				 RegDst = 2'b00;
				 ALUSrc = 1;
				 MemRead = 0;
				 RegWrite = 1;
				 MemWrite = 0;
				 DatatoReg = 2'b00;
				 PC_sel = 2'b00;
				 ExtOp = 0;
				 ALUCtrl = `ALUOp_OR;				
				 ShamtSrc = 0;
				 Branch = 0;
			 end
			 
			 //lui
			 `INSTR_LUI_OP:
			 begin
			   RegDst = 2'b00;
				 ALUSrc = 1;
				 MemRead = 0;
				 RegWrite = 1;
				 MemWrite = 0;
				 DatatoReg = 2'b00;
				 PC_sel = 2'b00;
				 ExtOp = 0;
				 ALUCtrl = `ALUOp_LUI;		
				 ShamtSrc = 0;
				 Branch = 0;
			 end
			 
			//beq 
			`INSTR_BEQ_OP:  
			begin
				RegDst = 2'b00;
				ALUSrc = 0;
				MemRead = 0;
				RegWrite = 0;
				MemWrite = 0;
				DatatoReg = 2'b00;
				PC_sel = 2'b01;
				ExtOp = 0;
				ALUCtrl = `ALUOp_EQL;			
				ShamtSrc = 0;
				Branch = 1;
			end
			
			//bne
			`INSTR_BNE_OP:  
			begin
				RegDst = 2'b00;
				ALUSrc = 0;
				MemRead = 0;
				RegWrite = 0;
				MemWrite = 0;
				DatatoReg = 2'b00;
				PC_sel = 2'b01;
				ExtOp = 0;
				ALUCtrl = `ALUOp_BNE;			
				ShamtSrc = 0;
				Branch = 1;
			end
			
			//jump
			`INSTR_J_OP:
			begin
			  RegDst = 2'b00;
				ALUSrc = 0;
				MemRead = 0;
				RegWrite = 0;
				MemWrite = 0;
				DatatoReg = 2'b00;
				PC_sel = 2'b10;
				ExtOp = 0;
				ALUCtrl = 3'b000;			
				ShamtSrc = 0;
				Branch = 1;
			end
			
			//jal
			`INSTR_JAL_OP:
			begin
			  RegDst = 2'b10;
				ALUSrc = 0;
				MemRead = 0;
				RegWrite = 1;
				MemWrite = 0;
				DatatoReg = 2'b10;
				PC_sel = 2'b10;
				ExtOp = 0;
				ALUCtrl = 3'b000;			
				ShamtSrc = 0;
				Branch = 1;
			end
			
			//lw
			`INSTR_LW_OP:
			begin
			  RegDst = 2'b00;
				ALUSrc = 1;
				MemRead = 1;
				RegWrite = 1;
				MemWrite = 0;
				DatatoReg = 2'b01;
				PC_sel = 2'b00;
				ExtOp = 0;
				ALUCtrl = `ALUOp_LW;			
				ShamtSrc = 0;
				Branch = 0;
			end
			
			//sw
			`INSTR_SW_OP:
			begin
			  RegDst = 2'b00;
				ALUSrc = 1;
				MemRead = 0;
				RegWrite = 0;
				MemWrite = 1;
				DatatoReg = 2'b00;
				PC_sel = 2'b00;
				ExtOp = 0;
				ALUCtrl = `ALUOp_SW;			
				ShamtSrc = 0;
				Branch = 0;
			end
			
			default:
					begin
						RegDst = 2'b00;
						ALUSrc = 0;
						MemRead = 0;
						RegWrite = 0;
						MemWrite = 0;
						DatatoReg = 2'b00;
						PC_sel = 2'b00;
						ExtOp = 0;
						ALUCtrl = 3'b000;
					  ShamtSrc = 0;
					  Branch = 0;
					end
			
		endcase
	 end
	 

endmodule
