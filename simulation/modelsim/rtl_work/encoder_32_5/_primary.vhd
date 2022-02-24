library verilog;
use verilog.vl_types.all;
entity encoder_32_5 is
    port(
        Code            : out    vl_logic_vector(4 downto 0);
        r0out           : in     vl_logic;
        r1out           : in     vl_logic;
        r2out           : in     vl_logic;
        r3out           : in     vl_logic;
        r4out           : in     vl_logic;
        r5out           : in     vl_logic;
        r6out           : in     vl_logic;
        r7out           : in     vl_logic;
        r8out           : in     vl_logic;
        r9out           : in     vl_logic;
        r10out          : in     vl_logic;
        r11out          : in     vl_logic;
        r12out          : in     vl_logic;
        r13out          : in     vl_logic;
        r14out          : in     vl_logic;
        r15out          : in     vl_logic;
        HIout           : in     vl_logic;
        LOout           : in     vl_logic;
        ZHIout          : in     vl_logic;
        ZLOWout         : in     vl_logic;
        PCout           : in     vl_logic;
        MDRout          : in     vl_logic;
        inPortout       : in     vl_logic;
        Cout            : in     vl_logic;
        clk             : in     vl_logic
    );
end encoder_32_5;
