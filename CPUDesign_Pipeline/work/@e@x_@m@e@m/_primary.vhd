library verilog;
use verilog.vl_types.all;
entity EX_MEM is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        IRWr            : in     vl_logic;
        ext_in          : in     vl_logic_vector(31 downto 0);
        ALURes_in       : in     vl_logic_vector(31 downto 0);
        grf_out_B_in    : in     vl_logic_vector(31 downto 0);
        reg_write_no_in : in     vl_logic_vector(4 downto 0);
        Branch_in       : in     vl_logic;
        MemRead_in      : in     vl_logic;
        MemWrite_in     : in     vl_logic;
        RegWrite_in     : in     vl_logic;
        DatatoReg_in    : in     vl_logic_vector(1 downto 0);
        ext             : out    vl_logic_vector(31 downto 0);
        ALURes          : out    vl_logic_vector(31 downto 0);
        grf_out_B       : out    vl_logic_vector(31 downto 0);
        reg_write_no    : out    vl_logic_vector(4 downto 0);
        Branch          : out    vl_logic;
        MemRead         : out    vl_logic;
        MemWrite        : out    vl_logic;
        RegWrite        : out    vl_logic;
        DatatoReg       : out    vl_logic_vector(1 downto 0)
    );
end EX_MEM;
