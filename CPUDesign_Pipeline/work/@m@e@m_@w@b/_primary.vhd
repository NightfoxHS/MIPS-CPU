library verilog;
use verilog.vl_types.all;
entity MEM_WB is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        IRWr            : in     vl_logic;
        MemAddr_in      : in     vl_logic_vector(31 downto 0);
        Mem_out_in      : in     vl_logic_vector(31 downto 0);
        reg_write_no_in : in     vl_logic_vector(4 downto 0);
        RegWrite_in     : in     vl_logic;
        DatatoReg_in    : in     vl_logic_vector(1 downto 0);
        MemAddr         : out    vl_logic_vector(31 downto 0);
        Mem_out         : out    vl_logic_vector(31 downto 0);
        reg_write_no    : out    vl_logic_vector(4 downto 0);
        RegWrite        : out    vl_logic;
        DatatoReg       : out    vl_logic_vector(1 downto 0)
    );
end MEM_WB;
