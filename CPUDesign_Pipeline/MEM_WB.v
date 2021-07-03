module MEM_WB (clk, rst, IRWr, 
MemAddr_in, Mem_out_in, reg_write_no_in, RegWrite_in, DatatoReg_in,
MemAddr, Mem_out, reg_write_no, RegWrite, DatatoReg);
   input clk;
   input rst;
   input IRWr; 

   input [31:0] MemAddr_in;
   input [31:0] Mem_out_in;
   input [4:0] reg_write_no_in;
   input RegWrite_in;
   input [1:0] DatatoReg_in;

   output reg [31:0] MemAddr;
   output reg [31:0] Mem_out;
   output reg [4:0] reg_write_no;
   output reg RegWrite;
   output reg [1:0] DatatoReg;
               
   always @(posedge clk or posedge rst) begin
      if ( rst ) begin
         MemAddr <= 0;
         Mem_out <= 0;
         reg_write_no <= 0;
         RegWrite <= 0;
         DatatoReg <= 0;
      end
      else if (IRWr) begin
         MemAddr <= MemAddr_in;
         Mem_out <= Mem_out_in;
         reg_write_no <= reg_write_no_in;
         RegWrite <= RegWrite_in;
         DatatoReg <= DatatoReg_in;
      end
   end  
endmodule