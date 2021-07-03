library verilog;
use verilog.vl_types.all;
entity Hazard_Ctrl_2 is
    port(
        IF_ID_RegRs2    : in     vl_logic_vector(4 downto 0);
        IF_ID_RegRt2    : in     vl_logic_vector(4 downto 0);
        ID_EX_RegRt2    : in     vl_logic_vector(4 downto 0);
        ID_EX_MemRead2  : in     vl_logic;
        IRWr_IF         : out    vl_logic;
        IRWr_ID         : out    vl_logic;
        IRWr_EX         : out    vl_logic;
        IRWr_MEM        : out    vl_logic;
        Branch2         : in     vl_logic
    );
end Hazard_Ctrl_2;
