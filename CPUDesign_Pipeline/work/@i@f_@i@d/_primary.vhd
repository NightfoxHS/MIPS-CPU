library verilog;
use verilog.vl_types.all;
entity IF_ID is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        IRWr            : in     vl_logic;
        Flush           : in     vl_logic;
        PC_in           : in     vl_logic_vector(31 downto 0);
        im_dout         : in     vl_logic_vector(31 downto 0);
        PC              : out    vl_logic_vector(31 downto 0);
        instr           : out    vl_logic_vector(31 downto 0)
    );
end IF_ID;
