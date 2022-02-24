library verilog;
use verilog.vl_types.all;
entity register_64 is
    port(
        clk             : in     vl_logic;
        clr             : in     vl_logic;
        enable          : in     vl_logic;
        input_D         : in     vl_logic_vector(63 downto 0);
        output_Q        : out    vl_logic_vector(63 downto 0)
    );
end register_64;
