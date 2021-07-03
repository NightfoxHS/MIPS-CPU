module Forward_EX(EX_MEM_RegRd, MEM_WB_RegRd, EX_MEM_RegWr, MEM_WB_RegWr, ID_EX_RegRs, ID_EX_RegRt,
ForwardA_EX, ForwardB_EX);

    input [4:0] EX_MEM_RegRd;
    input [4:0] MEM_WB_RegRd;
    input EX_MEM_RegWr;
    input MEM_WB_RegWr;
    input [4:0] ID_EX_RegRs;
    input [4:0] ID_EX_RegRt;

    output reg [1:0] ForwardA_EX;
    output reg [1:0] ForwardB_EX;

    always @(*) begin
        if(EX_MEM_RegWr && EX_MEM_RegRd != 5'b00000 && EX_MEM_RegRd == ID_EX_RegRs ) begin
            ForwardA_EX <= 2'b10;
            ForwardB_EX <= 2'b00;
        end
        else if (EX_MEM_RegWr && EX_MEM_RegRd != 5'b00000 && EX_MEM_RegRd == ID_EX_RegRt) begin
            ForwardA_EX <= 2'b00;
            ForwardB_EX <= 2'b10;
        end
        else if (MEM_WB_RegWr && MEM_WB_RegRd != 5'b00000 && MEM_WB_RegRd == ID_EX_RegRs) begin
            ForwardA_EX <= 2'b01;
            ForwardB_EX <= 2'b00;
        end
        else if (MEM_WB_RegWr && MEM_WB_RegRd != 5'b00000 && MEM_WB_RegRd == ID_EX_RegRt) begin
            ForwardA_EX <= 2'b00;
            ForwardB_EX <= 2'b01;
        end
        else begin
            ForwardA_EX <= 2'b00;
            ForwardB_EX <= 2'b00;
        end
    end

endmodule

module Forward_ID(EX_MEM_RegRd, MEM_WB_RegRd, EX_MEM_RegWr, MEM_WB_RegWr, IF_ID_RegRs, IF_ID_RegRt,
ForwardA_ID, ForwardB_ID);

    input [4:0] EX_MEM_RegRd;
    input [4:0] MEM_WB_RegRd;
    input EX_MEM_RegWr;
    input MEM_WB_RegWr;
    input [4:0] IF_ID_RegRs;
    input [4:0] IF_ID_RegRt;

    output reg [1:0] ForwardA_ID;
    output reg [1:0] ForwardB_ID;

    always @(*) begin
        if(EX_MEM_RegWr && EX_MEM_RegRd != 5'b00000 && EX_MEM_RegRd == IF_ID_RegRs ) begin
            ForwardA_ID <= 2'b10;
            ForwardB_ID <= 2'b00;
        end
        else if (EX_MEM_RegWr && EX_MEM_RegRd != 5'b00000 && EX_MEM_RegRd == IF_ID_RegRt) begin
            ForwardA_ID <= 2'b00;
            ForwardB_ID <= 2'b10;
        end
        else if (MEM_WB_RegWr && MEM_WB_RegRd != 5'b00000 && MEM_WB_RegRd == IF_ID_RegRs) begin
            ForwardA_ID <= 2'b01;
            ForwardB_ID <= 2'b00;
        end
        else if (MEM_WB_RegWr && MEM_WB_RegRd != 5'b00000 && MEM_WB_RegRd == IF_ID_RegRt) begin
            ForwardA_ID <= 2'b00;
            ForwardB_ID <= 2'b01;
        end
        else begin
            ForwardA_ID <= 2'b00;
            ForwardB_ID <= 2'b00;
        end
    end

endmodule


