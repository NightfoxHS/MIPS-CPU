library verilog;
use verilog.vl_types.all;
entity ShamtSrc_mux is
    port(
        \in\            : in     vl_logic_vector(4 downto 0);
        ShamtSrc        : in     vl_logic;
        \out\           : out    vl_logic_vector(4 downto 0)
    );
end ShamtSrc_mux;
