module Hazard_Data(IF_ID_RegRs, IF_ID_RegRt, ID_EX_RegRt, ID_EX_MemRead, Stall);
    // for instruction lw
    input [4:0] IF_ID_RegRs;
    input [4:0] IF_ID_RegRt;
    input [4:0] ID_EX_RegRt;
    input ID_EX_MemRead;

    output reg Stall;

    always @(*) begin
        if(ID_EX_MemRead && 
        ((ID_EX_RegRt == IF_ID_RegRs) || (ID_EX_RegRt == IF_ID_RegRt)))
            Stall <= 1;
        else
            Stall <= 0;
    end
endmodule

module Hazard_Ctrl_1(IF_ID_RegRs1, IF_ID_RegRt1, ID_EX_RegRd1, ID_EX_RegWrite, Branch, Stall1);
    // for instruction beq&bne alu
    input [4:0] IF_ID_RegRs1;
    input [4:0] IF_ID_RegRt1;
    input [4:0] ID_EX_RegRd1;
    input ID_EX_RegWrite;
    input Branch;
    output reg Stall1;

    always @(*) begin
        if(ID_EX_RegWrite && Branch &&
        ((ID_EX_RegRd1 == IF_ID_RegRs1) || (ID_EX_RegRd1 == IF_ID_RegRt1)))
            Stall1 <= 1;
        else
            Stall1 <= 0;
    end
endmodule

module Hazard_Ctrl_2(IF_ID_RegRs2, IF_ID_RegRt2, ID_EX_RegRt2, ID_EX_MemRead2, IRWr_IF,IRWr_ID,IRWr_EX,IRWr_MEM,Branch2);
    // for instruction beq&bne mem
    input [4:0] IF_ID_RegRs2;
    input [4:0] IF_ID_RegRt2;
    input [4:0] ID_EX_RegRt2;
    input ID_EX_MemRead2;
    input Branch2;
    output reg IRWr_IF;
    output reg IRWr_ID;
    output reg IRWr_EX;
    output reg IRWr_MEM;

    always @(*) begin
        if(ID_EX_MemRead2 && Branch2 &&
        ((ID_EX_RegRt2 == IF_ID_RegRs2) || (ID_EX_RegRt2 == IF_ID_RegRt2))) begin
            IRWr_IF <= 1'b0;
            IRWr_ID <= 1'b0;
            IRWr_EX <= 1'b1;
            IRWr_MEM <= 1'b1;
        end
        else begin
            IRWr_IF <= 1'b1;
            IRWr_ID <= 1'b1;
            IRWr_EX <= 1'b1;
            IRWr_MEM <= 1'b1;
        end
    end
endmodule
