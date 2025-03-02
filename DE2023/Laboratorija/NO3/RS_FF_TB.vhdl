library ieee;

use ieee.std_logic_1164.all;

entity RS_FF_TB is
end entity;

architecture RS_FF_TB_beh of RS_FF_TB is
    component RS_FF is 
        port(
            R, S, CLK : in std_logic;
            Q : out std_logic
        );
    end component;

    signal r_in : std_logic :='0';
    signal s_in : std_logic :='0';
    signal clk : std_logic :='0';
    signal q_out : std_logic :='0';

    begin
        lbl: RS_FF port map(R => r_in, S => s_in, CLK => clk, Q => q_out);
        process begin
            r_in <=  '0';
            s_in <=  '0';
            clk <= '0';
            wait for 10 ns;
            assert(q_out = '0') report "Failed r_in = s_in = 0, clk = 0 from Qn-1 = 0." severity error;

            r_in <=  '0';
            s_in <=  '0';
            clk <= '1';
            wait for 10 ns;
            assert(q_out = '0') report "Failed r_in = s_in = 0, clk = 1 from Qn-1 = 0." severity error;

            r_in <=  '0';
            s_in <=  '1';
            clk <= '0';
            wait for 10 ns;
            assert(q_out = '0') report "Failed r_in = 0, s_in = 1, clk = 0 from Qn-1 = 0." severity error;

            r_in <=  '0';
            s_in <=  '1';
            clk <= '1';
            wait for 10 ns;
            assert(q_out = '1') report "Failed r_in = 0, s_in = 1, clk = 1 from Qn-1 = 0." severity error;

            r_in <=  '1';
            s_in <=  '0';
            clk <= '0';
            wait for 10 ns;
            assert(q_out = '1') report "Failed r_in = 1, s_in = 0, clk = 0 from Qn.1 = 1." severity error;

            r_in <=  '1';
            s_in <=  '0';
            clk <= '1';
            wait for 10 ns;
            assert(q_out = '0') report "Failed r_in = 1, s_in = 0, clk = 1 Qn-1 = 1." severity error;

            r_in <=  '0';
            s_in <=  '0';
            clk <= '0';
            wait for 10 ns;

            r_in <=  '0';
            s_in <=  '1';
            clk <= '1';
            wait for 10 ns;

            r_in <=  '0';
            s_in <=  '0';
            clk <= '0';
            wait for 10 ns;

            r_in <=  '0';
            s_in <=  '0';
            clk <= '1';
            wait for 10 ns;
            assert(q_out = '1') report "Failed r_in = 0, s_in = 0, clk = 0 from Qn-1 = 1." severity error;

            -- Clear inputs
            clk <= '0';
            r_in <= '0';
            s_in <= '0';
            assert false report "Test finished." severity note;
            wait;
        end process;
end RS_FF_TB_beh;