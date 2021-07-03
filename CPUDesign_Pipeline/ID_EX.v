module ID_EX (clk, rst, IRWr, Stall1, Stall2,
PC_in, im_dout, grf_out_A_in, grf_out_B_in, reg_write_no_in, RegDst_in, ALUOp_in, ALUSrc_in, Branch_in, MemRead_in, MemWrite_in, RegWrite_in, DatatoReg_in,ext_in,ShamtSrc_in,
PC, instr, grf_out_A, grf_out_B, reg_write_no , RegDst, ALUOp, ALUSrc, Branch, MemRead, MemWrite, RegWrite, DatatoReg, ext, ShamtSrc);               
   input clk;
   input rst;
   input IRWr; 
   input Stall1;
   input Stall2;

   input [31:0] PC_in;
   input [31:0] im_dout;
   input [31:0] grf_out_A_in;
   input [31:0] grf_out_B_in;
   input [31:0] ext_in;
   input [4:0] reg_write_no_in;
   input [1:0] RegDst_in;
   input [4:0] ALUOp_in;
   input ALUSrc_in;
   input Branch_in;
   input MemRead_in;
   input MemWrite_in;
   input RegWrite_in;
   input [1:0] DatatoReg_in;
   input ShamtSrc_in;

   output reg [31:0] PC;
   output reg [31:0] instr;
   output reg [31:0] grf_out_A;
   output reg [31:0] grf_out_B;
   output reg [31:0] ext;
   output reg [4:0] reg_write_no;
   output reg [1:0] RegDst;
   output reg [4:0] ALUOp;
   output reg ALUSrc;
   output reg Branch;
   output reg MemRead;
   output reg MemWrite;
   output reg RegWrite;
   output reg [1:0] DatatoReg;
   output reg ShamtSrc;
               
   always @(posedge clk or posedge rst) begin
      if ( rst ) begin
         PC <= 0;
         instr <= 0;
         grf_out_A <= 0;
         grf_out_B <= 0;
         reg_write_no <= 0;
         RegDst <= 0;
         ALUOp <= 5'b00000;
         ALUSrc <= 0;
         Branch <= 0;
         MemRead <= 0;
         MemWrite <= 0;
         RegWrite <= 0;
         DatatoReg <= 2'b00;
         ext <= 0;
         ShamtSrc <= 0;
      end
      else if (IRWr) begin
         if(Stall1 || Stall2) begin
            PC <= PC_in;
            instr <= im_dout;
            grf_out_A <= grf_out_A_in;
            grf_out_B <= grf_out_B_in;
            reg_write_no <= reg_write_no_in;
            RegDst <= RegDst_in;
            ALUOp <= ALUOp_in;
            ALUSrc <= ALUSrc_in;
            Branch <= Branch_in;
            MemRead <= 0;
            MemWrite <= 0;
            RegWrite <= 0;
            DatatoReg <= DatatoReg_in;
            ext <= ext_in;
            ShamtSrc <= ShamtSrc_in;
         end
         else begin
            PC <= PC_in;
            instr <= im_dout;
            grf_out_A <= grf_out_A_in;
            grf_out_B <= grf_out_B_in;
            reg_write_no <= reg_write_no_in;
            RegDst <= RegDst_in;
            ALUOp <= ALUOp_in;
            ALUSrc <= ALUSrc_in;
            Branch <= Branch_in;
            MemRead <= MemRead_in;
            MemWrite <= MemWrite_in;
            RegWrite <= RegWrite_in;
            DatatoReg <= DatatoReg_in;
            ext <= ext_in;
            ShamtSrc <= ShamtSrc_in;
         end
      end
   end  
endmodule