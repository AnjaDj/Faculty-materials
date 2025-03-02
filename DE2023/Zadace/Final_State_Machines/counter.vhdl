library ieee;
use ieee.std_logic_1164.all;

entity counter is
port( clr, cls, clk, gd : in std_logic;
      data_out : out std_logic_vector(3 downto 0)
);
end counter;

architecture beh_counter of counter is

    type counter_states is (S0,S1,S2,S3,S4,S5,S6,S7,S8,S9,S10,S11,S12,S13,S14,S15);
    signal present_state, next_state : counter_states;

    begin
    -- SEKVENCIJALNI DIO

        process(clr,cls,clk)
        begin
                if (clr = '0') then present_state <= S0;
                elsif(cls = '0') then present_state <= S15;
                elsif(clk'event and clk = '0') then present_state <= next_state;
                end if;
        end process;

    -- KOMBINACIONI DIO

        process(present_state)
        begin
                case present_state is
                                    when S0 =>  if (gd = '1') then  data_out <= "0000";   
                                                                    next_state <= S1;
                                                else                data_out <= "0000";   
                                                                    next_state <= S15;
                                                end if;
                                    when S1 =>  if (gd = '1') then  data_out <= "0001";   
                                                                    next_state <= S2;
                                                else                data_out <= "0001";   
                                                                    next_state <= S0;
                                                end if;
                                    when S2 =>  if (gd = '1') then  data_out <= "0010";   
                                                                    next_state <= S3;
                                                else                data_out <= "0010";   
                                                                    next_state <= S1;
                                                end if;
                                    when S3 =>  if (gd = '1') then  data_out <= "0011";   
                                                                    next_state <= S4;
                                                else                data_out <= "0011";   
                                                                    next_state <= S2; 
                                                end if;
                                    when S4 =>  if (gd = '1') then  data_out <= "0100";   
                                                                    next_state <= S5;
                                                else                data_out <= "0100";   
                                                                    next_state <= S3;
                                                end if;
                                    when S5 =>  if (gd = '1') then  data_out <= "0101";   
                                                                    next_state <= S6;
                                                else                data_out <= "0101";   
                                                                    next_state <= S4;
                                                end if;
                                    when S6 =>  if (gd = '1') then  data_out <= "0110";   
                                                                    next_state <= S7;
                                                else                data_out <= "0110";   
                                                                    next_state <= S5;
                                                end if;
                                    when S7 =>  if (gd = '1') then  data_out <= "0111";   
                                                                    next_state <= S8;
                                                else                data_out <= "0111";   
                                                                    next_state <= S6;
                                                end if;
                                    when S8 =>  if (gd = '1') then  data_out <= "1000";   
                                                                    next_state <= S9;
                                                else                data_out <= "1000";   
                                                                    next_state <= S7;
                                                end if;
                                    when S9 => if (gd = '1') then  data_out <= "1001";   
                                                                    next_state <= S10;
                                                else                data_out <= "1001";   
                                                                    next_state <= S8; 
                                                end if;
                                    when S10 => if (gd = '1') then  data_out <= "1010";   
                                                                    next_state <= S11;
                                                else                data_out <= "1010";  
                                                                    next_state <= S9;
                                                end if;
                                    when S11 => if (gd = '1') then  data_out <= "1011";   
                                                                    next_state <= S12;
                                                else                data_out <= "1011";   
                                                                    next_state <= S10;
                                                end if;
                                    when S12 => if (gd = '1') then  data_out <= "1100";   
                                                                    next_state <= S13;
                                                else                data_out <= "1100";   
                                                                    next_state <= S11;
                                                end if;
                                    when S13 => if (gd = '1') then  data_out <= "1101";   
                                                                    next_state <= S14;
                                                else                data_out <= "1101";   
                                                                    next_state <= S12; 
                                                end if;
                                    when S14 => if (gd = '1') then  data_out <= "1110";   
                                                                    next_state <= S15;
                                                else                data_out <= "1110";  
                                                                    next_state <= S13;
                                                end if;
                                    when S15 => if (gd = '1') then  data_out <= "1111";   
                                                                    next_state <= S0;
                                                else                data_out <= "1111";   
                                                                    next_state <= S14;
                                                end if;
                end case;                
        end process;

end beh_counter;