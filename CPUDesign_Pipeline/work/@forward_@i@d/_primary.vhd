library verilog;
use verilog.vl_types.all;
entity Forward_ID is
    port(
        EX_MEM_RegRd    : in     vl_logic_vector(4 downto 0);
        MEM_WB_RegRd    : in     vl_logic_vector(4 downto 0);
        EX_MEM_RegWr    : in     vl_logic;
        MEM_WB_RegWr    : in     vl_logic;
        IF_ID_RegRs     : in     vl_logic_vector(4 downto 0);
        IF_ID_RegRt     : in     vl_logic_vector(4 downto 0);
        ForwardA_ID     : out    vl_logic_vector(1 downto 0);
        ForwardB_ID     : out    vl_logic_vector(1 downto 0)
    );
end Forward_ID;
