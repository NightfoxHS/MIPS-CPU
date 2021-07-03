
module npc(
   	input [31:0] oldPC,
	input [15:0] beq_imm,
	input [25:0] addr,
	input [31:0] reg_in,
	input [31:0] PC_ID,
	input beq_zero,    
    input [1:0] PC_sel,   
    output reg [31:0] newPC,
	output reg Flush,
	input Stall1,
	input Stall2
    );
  
   wire [31:0] PC4;
   wire [31:0] PC4_ID;
   assign PC4 = oldPC + 4;
   assign PC4_ID = PC_ID + 4;
   
	always @(*) begin
		if(Stall1 || Stall2) begin
			newPC = oldPC;
			Flush = 0;
		end
		else
			case(PC_sel)
				2'b00:	begin
					newPC = PC4;
					Flush = 0;
				end
				2'b01:	begin			
					if(beq_zero == 1) begin
						newPC = PC4_ID + {{14{beq_imm[15]}},beq_imm[15:0],2'b00};//beq
						Flush = 1;
					end
					else begin
						newPC = PC4;	
						Flush = 0;
					end
				end
				2'b10: //j&jal
					begin
						newPC = {{PC4[31:28]},addr[25:0],2'b00};
						Flush = 1;
					end
				2'b11: //jr
				begin
					newPC = reg_in; 
					Flush = 1;
				end
			endcase
	 end	 

endmodule
