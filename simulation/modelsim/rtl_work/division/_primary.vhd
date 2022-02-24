library verilog;
use verilog.vl_types.all;
entity division is
    port(
        Dividend        : in     vl_logic_vector(31 downto 0);
        Divisor         : in     vl_logic_vector(31 downto 0);
        Z               : out    vl_logic_vector(63 downto 0)
    );
end division;
