
module RegDst_mux(
		input [1:0] RegDst,
		input [20:16] Instrl_rs,
		input [15:11] Instrl_rt,
		output reg [4:0] Reg_rd
    );
	 
	always@(RegDst or Instrl_rs or Instrl_rt)begin
		case(RegDst)
			2'b00: Reg_rd = Instrl_rs[20:16];
			2'b01: Reg_rd = Instrl_rt[15:11];		
			2'b10: Reg_rd = 5'b11111;
		endcase
	end
endmodule



module ALUSrc_mux(
	input [31:0] grf_out,
	input [31:0] extend_out,
	input ALUSrc,
	output reg [31:0] ALUSrc_mux_out
	);	
	
	always@(grf_out or extend_out or ALUSrc)begin
		if(ALUSrc == 1) ALUSrc_mux_out = extend_out;
		else ALUSrc_mux_out = grf_out;
	end
endmodule

module ShamtSrc_mux(
  input [4:0] in,
  input ShamtSrc,
  output reg [4:0] out);
  
  always@(in or ShamtSrc) begin
    if(ShamtSrc == 1) out = in;
    else out = 5'b00000;
  end
endmodule


module DatatoReg_mux(
	input [31:0] ALU_data,
	input [31:0] Mem_data,
	input [31:0] PC_data,
	input [1:0]  DatatoReg,
	output reg [31:0] DatatoReg_out
	);
	
	always@(ALU_data or Mem_data or DatatoReg or PC_data) begin
		case(DatatoReg)
			2'b00: DatatoReg_out = ALU_data;
			2'b01: DatatoReg_out = Mem_data;	
			2'b10: DatatoReg_out = PC_data - 4;		
		endcase
	end
endmodule

module ForwardA_mux(
	input [1:0] ForwardA,
	input [31:0] grf_out_A, //ID/EX
	input [31:0] dm, //MEM/WB
	input [31:0] ALURes, //EX/MEM
	output reg [31:0] out
);

	always@(*) begin
		if(ForwardA == 2'b00)
			out <= grf_out_A;
		else if(ForwardA == 2'b01)
			out <= dm;
		else if(ForwardA == 2'b10)
			out <= ALURes;
	end
endmodule

module ForwardB_mux(
	input [1:0] ForwardB,
	input [31:0] grf_out_B,
	input [31:0] dm, 
	input [31:0] ALURes,
	output reg [31:0] out
);

	always@(*) begin
		if(ForwardB == 2'b00)
			out <= grf_out_B;
		else if(ForwardB == 2'b01)
			out <= dm;
		else if(ForwardB == 2'b10)
			out <= ALURes;
	end
endmodule

module Mux_Gpr(
	input Gpr_sel,
	input [31:0] WrData,
	input [31:0] GprData,
	output reg [31:0] out
);

	always @(*) begin
		if(Gpr_sel)
			out <= WrData;
		else
			out <= GprData;
	end
endmodule