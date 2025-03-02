library ieee;

use ieee.std_logic_1164.all;

entity bcd_counter is
    port(
        CLR, CLK, G_D : in std_logic;
        data_out : out std_logic_vector(3 downto 0)
    );
end bcd_counter;

architecture bcd_counter_beh of bcd_counter is
type counter_state is (S0,S1,S2,S3,S4,S5,S6,S7,S8,S9);
signal pr_state, nx_state : counter_state := S1;

begin
    -- sekvencijalni dio
    process(CLK,CLR)
    begin
        if (CLK = '1' and CLK'event) then
            if (CLR = '1') then
                if (G_D = '1') then
                    -- brojanje unaprijed
                    pr_state <= S0;
                else
                    -- brojanje unazad
                    pr_state <= S9;
                end if;
            else
                pr_state <= nx_state;
            end if;
        end if;
    end process;
    
    -- kombinacioni dio
    process(pr_state)
    begin
        case pr_state is
        when S0 =>
            if (G_D = '1') then
                nx_state <= S1;
            else
                nx_state <= S9;
            end if;
            data_out <= "0000";
        when S1 =>
            if (G_D = '1') then
                nx_state <= S2;
            else
                nx_state <= S0;
            end if;
            data_out <= "0001";
        when S2 =>
            if (G_D = '1') then
                nx_state <= S3;
            else
                nx_state <= S1;
            end if;
            data_out <= "0010";
        when S3 =>
            if (G_D = '1') then
                nx_state <= S4;
            else
                nx_state <= S2;
            end if;
            data_out <= "0011";
        when S4 =>
            if (G_D = '1') then
                nx_state <= S5;
            else
                nx_state <= S3;
            end if;
            data_out <= "0100";
        when S5 =>
            if (G_D = '1') then
                nx_state <= S6;
            else
                nx_state <= S4;
            end if;
            data_out <= "0101";
        when S6 =>
            if (G_D = '1') then
                nx_state <= S7;
            else
                nx_state <= S5;
            end if;
            data_out <= "0110";
        when S7 =>
            if (G_D = '1') then
                nx_state <= S8;
            else
                nx_state <= S6;
            end if;
            data_out <= "0111";
        when S8 =>
            if (G_D = '1') then
                nx_state <= S9;
            else
                nx_state <= S7;
            end if;
            data_out <= "1000";
        when S9 =>
            if (G_D = '1') then
                nx_state <= S0;
            else
                nx_state <= S8;
            end if;
            data_out <= "1001";
        end case;
    end process;
end bcd_counter_beh;