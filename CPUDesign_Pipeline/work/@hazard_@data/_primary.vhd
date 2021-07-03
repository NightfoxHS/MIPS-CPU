library verilog;
use verilog.vl_types.all;
entity Hazard_Data is
    port(
        IF_ID_RegRs     : in     vl_logic_vector(4 downto 0);
        IF_ID_RegRt     : in     vl_logic_vector(4 downto 0);
        ID_EX_RegRt     : in     vl_logic_vector(4 downto 0);
        ID_EX_MemRead   : in     vl_logic;
        Stall           : out    vl_logic
    );
end Hazard_Data;
