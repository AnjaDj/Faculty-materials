library ieee;

use ieee.std_logic_1164.all;

entity shift_register_tb is
end shift_register_tb;

architecture shift_register_tb_beh of shift_register_tb is
    component shift_register is
        port(
            CLK, CLR, LIN, RIN : in std_logic;
            data_in : in std_logic_vector(5 downto 0);
            mode : in std_logic_vector(1 downto 0);
            data_out : out std_logic_vector(5 downto 0)
        );
        end component;

    signal clock, r_in, l_in : std_logic :='0';
    signal clear : std_logic :='1';
    signal m_in : std_logic_vector(1 downto 0) := "00";
    signal d_in, d_out : std_logic_vector(5 downto 0) :="000000";

begin
    lbl: shift_register port map(CLK => clock, CLR => clear, LIN => l_in, RIN => r_in, mode => m_in, data_in => d_in, data_out => d_out);
    process begin
        clock <= '0';
        wait for 10 ns;
        assert (d_out = "000000") report "Failed beginning clk = 0." severity error;
        d_in <= "111111";
        m_in <= "11";
        clock <= '1';
        wait for 10 ns;
        assert (d_out = "111111") report "Failed parallel entry." severity error;
        clock <= '0';
        wait for 10 ns;
        r_in <= '0';
        m_in <= "01";
        clock <= '1';
        wait for 10 ns;
        assert (d_out = "011111") report "Failed right shift." severity error;
        clock <= '0';
        wait for 10 ns;
        clock <= '1';
        wait for 10 ns;
        assert (d_out = "001111") report "Failed right shift." severity error;
        clock <= '0';
        wait for 10 ns;
        clock <= '1';
        wait for 10 ns;
        assert (d_out = "000111") report "Failed right shift." severity error;
        clock <= '0';
        wait for 10 ns;
        clock <= '1';
        wait for 10 ns;
        assert (d_out = "000011") report "Failed right shift." severity error;
        clock <= '0';
        wait for 10 ns;
        clock <= '1';
        wait for 10 ns;
        assert (d_out = "000001") report "Failed right shift." severity error;
        clock <= '0';
        wait for 10 ns;
        clock <= '1';
        wait for 10 ns;
        assert (d_out = "000000") report "Failed right shift." severity error;
        clock <= '0';
        wait for 10 ns;
        l_in <= '1';
        m_in <= "10";
        clock <= '1';
        wait for 10 ns;
        assert (d_out = "000001") report "Failed left shift." severity error;
        clock <= '0';
        wait for 10 ns;
        clock <= '1';
        wait for 10 ns;
        assert (d_out = "000011") report "Failed left shift." severity error;
        clock <= '0';
        wait for 10 ns;
        clock <= '1';
        wait for 10 ns;
        assert (d_out = "000111") report "Failed left shift." severity error;
        clock <= '0';
        wait for 10 ns;
        clock <= '1';
        wait for 10 ns;
        assert (d_out = "001111") report "Failed left shift." severity error;
        clock <= '0';
        wait for 10 ns;
        clock <= '1';
        wait for 10 ns;
        assert (d_out = "011111") report "Failed left shift." severity error;
        clock <= '0';
        wait for 10 ns;
        clock <= '1';
        wait for 10 ns;
        assert (d_out = "111111") report "Failed left shift." severity error;
        clock <= '0';
        wait for 10 ns;
        clear <= '0';
        wait for 10 ns;
        assert (d_out = "000000") report "Failed clear." severity error;
        
        assert false report "Test finished." severity note;
        wait;
    end process;
end shift_register_tb_beh ;