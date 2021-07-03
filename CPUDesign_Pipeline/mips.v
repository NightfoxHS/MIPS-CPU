
module mips( );
  	reg clk, reset;
    	 
	initial begin
		$readmemh( "Test_Instr.txt", IM.IMem ) ; 
		$monitor("PC = 0x%8X, IR = 0x%8X", PC.oldpc, IM.Out );   

		clk = 1 ;
		reset = 0 ;
		#5 reset = 1 ;
		#20 reset = 0 ;
	end
	
   	always #50 clk = ~clk;  
	 
	wire [31:0] old_PC;
	wire [31:0] new_PC;
	
	wire beq_zero;
	wire [1:0]  PC_sel;
	wire [31:0] Instrl;
	
	wire ExtOp;
	wire [31:0] ext_out;
	 
	wire [1:0]  Data_to_Reg_sel;
	wire [31:0] Data_to_Reg;
	wire [1:0]  RegDst;
	wire [4:0]  Reg_rd;
	wire RegWrite;
	wire [31:0] grf_out_A;
	wire [31:0] grf_out_B;
	wire ShamtSrc;
	 
	wire ALUSrc;
	wire [31:0] ALUSrc_out;
	wire [4:0]  ALUCtr;
	wire [4:0]  Shamt;
	wire [31:0] ALU_out;	 
	
	wire [31:0] dm_data_out;
	wire MemWrite;
	wire MemRead;

	wire [31:0] PC_ID;
	wire [31:0] Instrl_ID;
	wire IRWr_IF;
	wire Flush;
	wire [31:0] grf_out_A_comp;
	wire [31:0] grf_out_B_comp;
	wire [1:0] ForwardA_ID;
	wire [1:0] ForwardB_ID;

	wire IRWr_ID;
	wire Stall1;
	wire Stall2;
	wire Branch;
	wire [31:0] PC_EX;
	wire [31:0] Instrl_EX;
	wire [31:0] grf_out_A_EX;
	wire [31:0] grf_out_B_EX;
	wire [4:0] reg_write_no_EX;
	wire [1:0] RegDst_EX;
	wire [4:0] ALUOp_EX;
	wire ALUSrc_EX;
	wire Branch_EX;
	wire MemRead_EX;
	wire MemWrite_EX;
	wire [1:0] DatatoReg_EX;
	wire [31:0] ext_EX;
	wire ShmatSrc_EX;
	wire [31:0] grf_out_A_alu;
	wire [31:0] grf_out_B_alu;
	wire [1:0] ForwardA_EX;
	wire [1:0] ForwardB_EX;

	wire IRWr_EX;
	wire [31:0] ext_MEM;
	wire [31:0] ALURes_MEM;
	wire [31:0] grf_out_B_MEM;
	wire [4:0] reg_write_no_MEM;
	wire Branch_MEM;
	wire MemRead_MEM;
	wire MemWrite_MEM;
	wire RegWrite_MEM;
	wire [1:0] DatatoReg_MEM;

	wire [31:0] ALURes_WB;
	wire [31:0] Mem_out_WB;
	wire [4:0] reg_write_no_WB;
	wire RegWrite_WB;
	wire [1:0] DatatoReg_WB;

	im  IM(old_PC[11:2],Instrl);
	npc NPC(old_PC,Instrl_ID[15:0],Instrl_ID[25:0],grf_out_A,PC_ID,beq_zero,PC_sel,new_PC,Flush,Stall1,Stall2);
	pc  PC(new_PC,clk,reset,old_PC);

	IF_ID if_id(clk,reset,IRWr_IF,Flush,old_PC,Instrl,PC_ID,Instrl_ID);
	ctrl CTRL(Instrl_ID[31:26],Instrl_ID[5:0],RegDst,ALUSrc,MemRead,RegWrite,MemWrite,Data_to_Reg_sel,PC_sel,ExtOp,ALUCtr,ShamtSrc,Branch);
	RegDst_mux REGDST(RegDst,Instrl_ID[20:16],Instrl_ID[15:11],Reg_rd);
	gpr GRF(clk,reset,Instrl_ID[25:21],Instrl_ID[20:16],reg_write_no_WB,Data_to_Reg,RegWrite_WB,grf_out_A,grf_out_B);
	extend EXTEND(Instrl_ID[15:0],ExtOp,ext_out);
	Forward_ID FrID(reg_write_no_EX,reg_write_no_MEM,RegWrite_MEM,RegWrite_WB,Instrl_ID[25:21],Instrl_ID[20:16],ForwardA_ID, ForwardB_ID);
	ForwardA_mux FrA_ID(ForwardA_ID,grf_out_A,Data_to_Reg,ALU_out,grf_out_A_comp);
	ForwardB_mux FrB_ID(ForwardB_ID,grf_out_B,Data_to_Reg,ALU_out,grf_out_B_comp);
	ID_comp comp(Instrl_ID[31:26],grf_out_A_comp,grf_out_B_comp,beq_zero);
	
	Hazard_Data HzDt(Instrl_ID[25:21],Instrl_ID[20:16],Instrl_EX[20:16],MemRead_EX,Stall1);
	Hazard_Ctrl_1 HzCt1(Instrl_ID[25:21],Instrl_ID[20:16],reg_write_no_EX,RegWrite_EX,Branch_EX,Stall2);
	Hazard_Ctrl_2 HzCt2(Instrl_ID[25:21],Instrl_ID[20:16],Instrl_EX[20:16],MemRead_EX,IRWr_IF,IRWr_ID,IRWr_EX,IRWr_MEM,Branch_EX);

	ID_EX id_ex(clk,reset,IRWr_ID,Stall1,Stall2,PC_ID,Instrl_ID,grf_out_A,grf_out_B,Reg_rd,RegDst,ALUCtr,ALUSrc,Branch,MemRead,MemWrite,RegWrite,Data_to_Reg_sel,ext_out, ShamtSrc,
				PC_EX,Instrl_EX,grf_out_A_EX,grf_out_B_EX,reg_write_no_EX,RegDst_EX,ALUOp_EX,ALUSrc_EX,Branch_EX,MemRead_EX,MemWrite_EX,RegWrite_EX,DatatoReg_EX,ext_EX, ShmatSrc_EX); //undefined Branch
	Forward_EX FrEX(reg_write_no_MEM,reg_write_no_WB,RegWrite_MEM,RegWrite_WB,Instrl_EX[25:21],Instrl_EX[20:16],ForwardA_EX,ForwardB_EX);
	ForwardA_mux FrA_EX(ForwardA_EX,grf_out_A_EX,Data_to_Reg,ALURes_MEM,grf_out_A_alu);
	ForwardB_mux FrB_EX(ForwardB_EX,grf_out_B_EX,Data_to_Reg,ALURes_MEM,grf_out_B_alu);
	ALUSrc_mux ALUSRC(grf_out_B_alu,ext_EX,ALUSrc_EX,ALUSrc_out);
	ShamtSrc_mux SHAMTSRC(Instrl_EX[10:6],ShmatSrc_EX,Shamt);
	alu ALU(grf_out_A_alu,ALUSrc_out,ALUOp_EX,Shamt,Instrl_EX[15:0],ALU_out);

	EX_MEM ex_mem(clk,reset,IRWr_EX,ext_EX,ALU_out,grf_out_B_alu,reg_write_no_EX,Branch_EX,MemRead_EX,MemWrite_EX,RegWrite_EX,DatatoReg_EX,
					ext_MEM,ALURes_MEM,grf_out_B_MEM,reg_write_no_MEM,Branch_MEM,MemRead_MEM,MemWrite_MEM,RegWrite_MEM,DatatoReg_MEM);
	dm DM(ALURes_MEM,grf_out_B_MEM,MemWrite_MEM,MemRead_MEM,clk,reset,dm_data_out);

	MEM_WB mem_wb(clk,reset,IRWr_MEM,ALURes_MEM,dm_data_out,reg_write_no_MEM,RegWrite_MEM,DatatoReg_MEM,
					ALURes_WB,Mem_out_WB,reg_write_no_WB,RegWrite_WB,DatatoReg_WB);
	DatatoReg_mux DATATOREG(ALURes_WB,Mem_out_WB,PC_EX,DatatoReg_WB,Data_to_Reg);

endmodule
