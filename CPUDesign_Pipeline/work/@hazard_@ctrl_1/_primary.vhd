library verilog;
use verilog.vl_types.all;
entity Hazard_Ctrl_1 is
    port(
        IF_ID_RegRs1    : in     vl_logic_vector(4 downto 0);
        IF_ID_RegRt1    : in     vl_logic_vector(4 downto 0);
        ID_EX_RegRd1    : in     vl_logic_vector(4 downto 0);
        ID_EX_RegWrite  : in     vl_logic;
        Branch          : in     vl_logic;
        Stall1          : out    vl_logic
    );
end Hazard_Ctrl_1;
