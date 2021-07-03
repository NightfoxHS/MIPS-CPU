module IF_ID (clk, rst, IRWr, Flush,
PC_in, im_dout, 
PC, instr);
   input clk;
   input rst;
   input IRWr; 
   input Flush;

   input  [31:0] PC_in;
   input  [31:0] im_dout;
   
   output reg [31:0] PC;
   output reg [31:0] instr;
               
   always @(posedge clk or posedge rst) begin
      if ( rst ) begin
         PC <= 0;
         instr <= 0;
      end
      else if (IRWr) begin
         if(Flush) begin
            PC <= PC_in;
            instr <= 32'b0;
         end
         else begin
            PC <= PC_in;
            instr <= im_dout;
         end
      //$display("Instrl_ID:%8x",instr);
      end
   end  
endmodule