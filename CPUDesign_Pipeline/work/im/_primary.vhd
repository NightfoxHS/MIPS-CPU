library verilog;
use verilog.vl_types.all;
entity im is
    port(
        Addr            : in     vl_logic_vector(11 downto 2);
        \Out\           : out    vl_logic_vector(31 downto 0)
    );
end im;
