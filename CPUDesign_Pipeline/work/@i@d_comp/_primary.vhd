library verilog;
use verilog.vl_types.all;
entity ID_comp is
    port(
        Instr_Type      : in     vl_logic_vector(5 downto 0);
        in_A            : in     vl_logic_vector(31 downto 0);
        in_B            : in     vl_logic_vector(31 downto 0);
        isValid         : out    vl_logic
    );
end ID_comp;
