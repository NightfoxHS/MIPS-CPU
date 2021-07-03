library verilog;
use verilog.vl_types.all;
entity Forward_EX is
    port(
        EX_MEM_RegRd    : in     vl_logic_vector(4 downto 0);
        MEM_WB_RegRd    : in     vl_logic_vector(4 downto 0);
        EX_MEM_RegWr    : in     vl_logic;
        MEM_WB_RegWr    : in     vl_logic;
        ID_EX_RegRs     : in     vl_logic_vector(4 downto 0);
        ID_EX_RegRt     : in     vl_logic_vector(4 downto 0);
        ForwardA_EX     : out    vl_logic_vector(1 downto 0);
        ForwardB_EX     : out    vl_logic_vector(1 downto 0)
    );
end Forward_EX;
