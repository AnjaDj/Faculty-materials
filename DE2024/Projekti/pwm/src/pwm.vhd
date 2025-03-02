library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity pwm is
  port (
    clk     : in  STD_LOGIC;                    -- Clock signal
    reset   : in  STD_LOGIC;                    -- Reset signal
    duty    : in  STD_LOGIC_VECTOR(7 downto 0); -- Duty cycle (0-255)
    pwm_out : out STD_LOGIC                     -- PWM output signal
  );
end pwm;

architecture Behavioral of pwm is
  signal counter : unsigned(7 downto 0) := (others => '0'); -- 8-bit counter
begin
  process(clk)
  begin
  
    if rising_edge(clk) then
      if reset = '1' then
        counter <= (others => '0');
        pwm_out <= '0';
      else
        if counter = "11111111" then
          counter <= (others => '0'); -- Reset counter after reaching maximum
        else
          counter <= counter + 1; -- Increment counter
        end if;

         -- Generate PWM signal
        if counter < unsigned(duty) then
          pwm_out <= '1';
        else
          pwm_out <= '0';
        end if;
		
	  end if;
    end if;
	
  end process;
end Behavioral;

