library ieee;
use ieee.std_logic_1164.all;

entity tb_SRAM is
end tb_SRAM;

architecture beh_tb_SRAM of tb_SRAM is

    constant n : integer := 4;
    constant m : integer := 2;

    signal data_in, data_out : std_logic_vector(m-1 downto 0);
    signal CS : std_logic := '1';
    signal RE, WE : std_logic;
    signal address : integer;

begin

    -- Instanciranje komponente SRAM-a SRAM1
    SRAM1 : entity work.SRAM
        generic map ( 
            n => n,
            m => m 
        )
        port map(
            data_in => data_in,
            data_out => data_out,
            CS => CS, 
            WE => WE,
            RE => RE,
            address => address
        );

    process
    begin
            -- UPIS
            RE <= '0'; WE <= '1';
            data_in <= "00"; address <= 0; wait for 5 ns;
            data_in <= "01"; address <= 1; wait for 5 ns;
            data_in <= "10"; address <= 2; wait for 5 ns;
            data_in <= "11"; address <= 3; wait for 5 ns;

            -- CITANJE
            RE <= '1'; WE <= '0';
            address <= 0; wait for 5 ns; assert (data_out = "00") report "E0" severity error;
            address <= 1; wait for 5 ns; assert (data_out = "01") report "E1" severity error;
            address <= 2; wait for 5 ns; assert (data_out = "10") report "E2" severity error;
            address <= 3; wait for 5 ns; assert (data_out = "11") report "E3" severity error;

            -- Onemogucenje cipa 
            CS <= '0'; wait for 5 ns;
            assert (data_out = "ZZ") report "EZ" severity error;

            assert false report "Test done!" severity error;
            wait;

    end process;
end beh_tb_SRAM;