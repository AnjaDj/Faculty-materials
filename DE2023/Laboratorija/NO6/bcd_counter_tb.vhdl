library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bcd_counter_tb is
end bcd_counter_tb;

architecture bcd_counter_tb_beh of bcd_counter_tb is

    component bcd_counter is
        port(   
            CLR, CLK, G_D : in std_logic;
            data_out : out std_logic_vector(3 downto 0)
        );
    end component;

    signal clear, clock : std_logic :='0';
    signal up_down : std_logic;
    signal d_out : std_logic_vector(3 downto 0);

begin
    lbl: bcd_counter port map(CLR => clear, CLK => clock, G_D => up_down, data_out => d_out);
    process begin
        up_down <= '1';
        clear <= '1';
        clock <= '0';
        wait for 10 ns;
        clock <= '1';
        wait for 10 ns;
        --report "d_out = " & integer'image(to_integer(unsigned(d_out)));
        assert(d_out = "0000") report "Failed clear to zero." severity error;
        clock <= '0';
        clear <= '0';
        wait for 10 ns;
        for i in 1 to 9 loop
            clock <= '1';
            wait for 10 ns;
            --report "d_out = " & integer'image(to_integer(unsigned(d_out)));
            assert(i = to_integer(unsigned(d_out))) report "Failed counting up, i = " & integer'image(i) severity error;
            clock <= '0';
            wait for 10 ns;
        end loop;
        clear <= '1';
        clock <= '0';
        wait for 10 ns;
        clock <= '1';
        wait for 10 ns;
        --report "d_out = " & integer'image(to_integer(unsigned(d_out)));
        assert(d_out = "0000") report "Failed clear to zero." severity error;
        clock <= '0';
        wait for 10 ns;
        up_down <= '0';
        clock <= '1';
        wait for 10 ns;
        --report "d_out = " & integer'image(to_integer(unsigned(d_out)));
        assert(d_out = "1001") report "Failed clear to nine." severity error;
        clear <= '0';
        for i in 8 downto 0 loop
            clock <= '0';
            wait for 10 ns;
            clock <= '1';
            wait for 10 ns;
            --report "d_out = " & integer'image(to_integer(unsigned(d_out)));
            assert(i = to_integer(unsigned(d_out))) report "Failed counting down, i = " & integer'image(i) severity error;
        end loop;

        assert false report "Test finished." severity note;
        wait;
    end process;
end bcd_counter_tb_beh ; 