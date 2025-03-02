library ieee;
use ieee.std_logic_1164.all;

entity tb_ram is
end entity tb_ram;

architecture beh_tb_ram of tb_ram is

    constant word_size : integer := 8;          -- mogucnost promjene
    constant number_of_words : integer := 128;  -- velicine RAM-a

    signal data_in, data_out : std_logic_vector(word_size-1 downto 0);
    signal clk, RE, WE : std_logic;
    signal address : integer;

begin

     -- Instanciranje komponente RAM-a RAM1
        RAM1 : entity work.RAM
        generic map ( 
            word_size => word_size,
            number_of_words => number_of_words 
        )
        port map(
            data_in => data_in,
            data_out => data_out,
            clk => clk, 
            WE => WE,
            RE => RE,
            address => address
        );

        process
        begin
                -- UPIS
                RE <= '0'; WE <= '1'; clk <= '0'; wait for 5 ns;
                clk <= '1'; data_in <= "00000000"; address <= 0; wait for 5 ns;     clk <= '0'; wait for 5 ns;
                clk <= '1'; data_in <= "00000001"; address <= 1; wait for 5 ns;     clk <= '0'; wait for 5 ns;
                clk <= '1'; data_in <= "00000010"; address <= 2; wait for 5 ns;     clk <= '0'; wait for 5 ns;
                clk <= '1'; data_in <= "00000011"; address <= 3; wait for 5 ns;     clk <= '0'; wait for 5 ns;
                clk <= '1'; data_in <= "00000100"; address <= 4; wait for 5 ns;     clk <= '0'; wait for 5 ns;
                clk <= '1'; data_in <= "00000101"; address <= 5; wait for 5 ns;     clk <= '0'; wait for 5 ns;
                clk <= '1'; data_in <= "00000110"; address <= 6; wait for 5 ns;     clk <= '0'; wait for 5 ns;
                clk <= '1'; data_in <= "00000111"; address <= 7; wait for 5 ns;     clk <= '0'; wait for 5 ns;
                clk <= '1'; data_in <= "00001000"; address <= 8; wait for 5 ns;     clk <= '0'; wait for 5 ns;
                clk <= '1'; data_in <= "00001001"; address <= 9; wait for 5 ns;     clk <= '0'; wait for 5 ns;
                clk <= '1'; data_in <= "00001010"; address <= 10; wait for 5 ns;     clk <= '0'; wait for 5 ns;
                clk <= '1'; data_in <= "00001011"; address <= 11; wait for 5 ns;     clk <= '0'; wait for 5 ns;
                clk <= '1'; data_in <= "00001100"; address <= 12; wait for 5 ns;     clk <= '0'; wait for 5 ns;
                clk <= '1'; data_in <= "00001101"; address <= 13; wait for 5 ns;     clk <= '0'; wait for 20 ns;
                -- isti sablon i za sve preostale kombinacije...

                -- CITANJE
                RE <= '1'; WE <= '0';
                clk <= '1'; address <= 0; wait for 5 ns; assert(data_out = "00000000") report "E0" severity error;    clk <= '0'; wait for 5 ns;
                clk <= '1'; address <= 1; wait for 5 ns; assert(data_out = "00000001") report "E1" severity error;    clk <= '0'; wait for 5 ns;
                clk <= '1'; address <= 2; wait for 5 ns; assert(data_out = "00000010") report "E2" severity error;    clk <= '0'; wait for 5 ns;
                clk <= '1'; address <= 3; wait for 5 ns; assert(data_out = "00000011") report "E3" severity error;    clk <= '0'; wait for 5 ns;
                clk <= '1'; address <= 4; wait for 5 ns; assert(data_out = "00000100") report "E4" severity error;    clk <= '0'; wait for 5 ns;
                clk <= '1'; address <= 5; wait for 5 ns; assert(data_out = "00000101") report "E5" severity error;    clk <= '0'; wait for 5 ns;
                clk <= '1'; address <= 6; wait for 5 ns; assert(data_out = "00000110") report "E6" severity error;    clk <= '0'; wait for 5 ns;
                clk <= '1'; address <= 7; wait for 5 ns; assert(data_out = "00000111") report "E7" severity error;    clk <= '0'; wait for 5 ns;
                clk <= '1'; address <= 8; wait for 5 ns; assert(data_out = "00001000") report "E8" severity error;    clk <= '0'; wait for 5 ns;
                clk <= '1'; address <= 9; wait for 5 ns; assert(data_out = "00001001") report "E9" severity error;    clk <= '0'; wait for 5 ns;
                clk <= '1'; address <= 10; wait for 5 ns; assert(data_out = "00001010") report "E10" severity error;    clk <= '0'; wait for 5 ns;
                clk <= '1'; address <= 11; wait for 5 ns; assert(data_out = "00001011") report "E11" severity error;    clk <= '0'; wait for 5 ns;
                clk <= '1'; address <= 12; wait for 5 ns; assert(data_out = "00001100") report "E12" severity error;    clk <= '0'; wait for 5 ns;
                clk <= '1'; address <= 13; wait for 5 ns; assert(data_out = "00001101") report "E13" severity error;    clk <= '0'; wait for 5 ns;

                assert false report "Test done!" severity error;
                wait;

        end process;

end beh_tb_ram;