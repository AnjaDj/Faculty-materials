library ieee;
use ieee.std_logic_1164.all;

entity RAM is
generic( 
    word_size : integer := 8;
    number_of_words : integer := 128
);
port(
    clk, RE, WE : in std_logic;
    address : in integer;
    data_in  : in  std_logic_vector(word_size-1 downto 0);
    data_out : out std_logic_vector(word_size-1 downto 0)
 );
end entity RAM;

architecture beh_RAM of RAM is 
    type RAM_CAPACITY is array (0 to number_of_words-1) of std_logic_vector(word_size-1 downto 0);
    signal internal_registers : RAM_CAPACITY;
begin
    process(clk)
    begin

        if(rising_edge(clk)) then
            for i in 0 to number_of_words-1 loop
                if(address = i) then
                                    if(WE = '1' and RE = '0') then internal_registers(i) <= data_in;
                                 elsif(WE = '0' and RE = '1') then data_out <= internal_registers(i);
                                    end if;
                end if;
            end loop;
        end if;

    end process;
end beh_RAM;