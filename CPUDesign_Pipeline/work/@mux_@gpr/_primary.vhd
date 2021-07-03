library verilog;
use verilog.vl_types.all;
entity Mux_Gpr is
    port(
        Gpr_sel         : in     vl_logic;
        WrData          : in     vl_logic_vector(31 downto 0);
        GprData         : in     vl_logic_vector(31 downto 0);
        \out\           : out    vl_logic_vector(31 downto 0)
    );
end Mux_Gpr;
