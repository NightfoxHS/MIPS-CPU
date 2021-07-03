library verilog;
use verilog.vl_types.all;
entity npc is
    port(
        oldPC           : in     vl_logic_vector(31 downto 0);
        beq_imm         : in     vl_logic_vector(15 downto 0);
        addr            : in     vl_logic_vector(26 downto 0);
        reg_in          : in     vl_logic_vector(31 downto 0);
        beq_zero        : in     vl_logic;
        PC_sel          : in     vl_logic_vector(1 downto 0);
        newPC           : out    vl_logic_vector(31 downto 0)
    );
end npc;
