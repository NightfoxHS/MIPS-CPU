`include "instruction_def.v"

module ID_comp(Instr_Type,in_A,in_B,isValid);
    input [5:0] Instr_Type;
    input [31:0] in_A;
    input [31:0] in_B;
    output reg isValid;

    always @(*) begin
        if(Instr_Type == `INSTR_BEQ_OP)
            isValid <= ~|(in_A ^ in_B)?1'b1:1'b0;
        else if(Instr_Type == `INSTR_BNE_OP)
            isValid <= ~|(in_A ^ in_B)?1'b0:1'b1;
        else
            isValid <= 1'b0;
    end
endmodule