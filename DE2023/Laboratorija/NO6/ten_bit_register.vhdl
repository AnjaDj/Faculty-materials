library ieee;

use ieee.std_logic_1164.all;

entity ten_bit_register is
    port(
        CLR, CLK, EN : in std_logic;
        data_in : in std_logic_vector(9 downto 0);
        data_out : out std_logic_vector(9 downto 0)
    );
end ten_bit_register;

architecture ten_bit_register_beh of ten_bit_register is

signal tmp_out : std_logic_vector(9 downto 0) := "0000000000";

begin
    data_out <= tmp_out;
    process(CLK) 
    begin
        if(rising_edge(CLK)) then
            if(CLR = '1') then
                tmp_out <= "0000000000";
            elsif(EN = '1') then
                tmp_out <= data_in;
            end if;
        end if;
    end process;
end ten_bit_register_beh;