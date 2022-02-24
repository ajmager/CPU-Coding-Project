library verilog;
use verilog.vl_types.all;
entity register_64 is
    port(
        clk             : in     vl_logic;
        clr             : in     vl_logic;
        enable          : in     vl_logic;
        Zhi             : in     vl_logic;
        Zlow            : in     vl_logic;
        input_DZ        : in     vl_logic_vector(63 downto 0);
        output_QZ       : out    vl_logic_vector(31 downto 0)
    );
end register_64;
