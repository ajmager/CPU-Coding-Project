library verilog;
use verilog.vl_types.all;
entity register_PC is
    port(
        clk             : in     vl_logic;
        clr             : in     vl_logic;
        enable          : in     vl_logic;
        IncPC           : in     vl_logic;
        input_DPC       : in     vl_logic_vector(31 downto 0);
        output_QPC      : out    vl_logic_vector(31 downto 0)
    );
end register_PC;
