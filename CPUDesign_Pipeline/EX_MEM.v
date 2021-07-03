module EX_MEM (clk, rst, IRWr, 
ext_in, ALURes_in, /*beq_zero_in,*/ grf_out_B_in, reg_write_no_in, Branch_in, MemRead_in, MemWrite_in, RegWrite_in, DatatoReg_in,
ext, ALURes, /*beq_zero,*/ grf_out_B, reg_write_no, Branch, MemRead, MemWrite, RegWrite, DatatoReg);
   input clk;
   input rst;
   input IRWr;

   input [31:0] ext_in;
   input [31:0] ALURes_in;
   //input beq_zero_in;
   input [31:0] grf_out_B_in;
   input [4:0] reg_write_no_in;
   input Branch_in;
   input MemRead_in;
   input MemWrite_in;
   input RegWrite_in;
   input [1:0] DatatoReg_in;

   output reg [31:0] ext;
   output reg [31:0] ALURes;
   //output reg beq_zero;
   output reg [31:0] grf_out_B;
   output reg [4:0] reg_write_no;
   output reg Branch;
   output reg MemRead;
   output reg MemWrite;
   output reg RegWrite;
   output reg [1:0] DatatoReg;
               
   always @(posedge clk or posedge rst) begin
      if ( rst ) begin
         ext <= 0;
         ALURes <= 0;
         //beq_zero <= 0;
         grf_out_B <= 0;
         reg_write_no <= 0;
         Branch <= 0;
         MemRead <= 0;
         MemWrite <= 0;
         RegWrite <= 0;
         DatatoReg <= 0;
      end
      else if (IRWr) begin
         ext <= ext_in;
         ALURes <= ALURes_in;
         //beq_zero <= beq_zero_in;
         grf_out_B <= grf_out_B_in;
         reg_write_no <= reg_write_no_in;
         Branch <= Branch_in;
         MemRead <= MemRead_in;
         MemWrite <= MemWrite_in;
         RegWrite <= RegWrite_in;
         DatatoReg <= DatatoReg_in;
      end
   end  
endmodule