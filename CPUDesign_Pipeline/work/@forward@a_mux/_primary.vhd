library verilog;
use verilog.vl_types.all;
entity ForwardA_mux is
    port(
        ForwardA        : in     vl_logic_vector(1 downto 0);
        grf_out_A       : in     vl_logic_vector(31 downto 0);
        dm              : in     vl_logic_vector(31 downto 0);
        ALURes          : in     vl_logic_vector(31 downto 0);
        \out\           : out    vl_logic_vector(31 downto 0)
    );
end ForwardA_mux;
