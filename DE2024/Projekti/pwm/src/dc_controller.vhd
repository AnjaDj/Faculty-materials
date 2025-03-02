library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity dc_controller is
  port (
    clk        : in  STD_LOGIC;                     -- Clock signal
    reset      : in  STD_LOGIC;                     -- Reset signal
    duty       : in  STD_LOGIC_VECTOR(7 downto 0);  -- Duty cycle (0-255)
    polarity   : in  STD_LOGIC;                     -- Polarity control signal
	start      : in STD_LOGIC;                      -- Start control signal
	stop       : in STD_LOGIC;						-- Stop control signal
    motor_out  : out STD_LOGIC                      -- Motor output signal
  );
end dc_controller;

architecture Behavioral of dc_controller is

  signal pwm_signal        : STD_LOGIC := '0';
  Signal pwm_with_polarity : STD_LOGIC := '0';

  component pwm
    port (
      clk      : in  STD_LOGIC;
      reset    : in  STD_LOGIC;
      duty     : in  STD_LOGIC_VECTOR(7 downto 0);
      pwm_out  : out STD_LOGIC
    );
  end component;

begin
  -- PWM instantiation
  pwm_inst : pwm port map (
    clk      => clk,
    reset    => reset,
    duty     => duty,
    pwm_out  => pwm_signal
  );

  -- Polarity logic
  process(clk)
  begin
    if rising_edge(clk) then
      if polarity = '0' then
        pwm_with_polarity <= pwm_signal;      -- Forward direction rotation
      else
        pwm_with_polarity <= not pwm_signal;  -- Reverse direction rotation
      end if;
    end if;
  end process;

  -- Output logic
  motor_out <= start and not(stop) and pwm_with_polarity;

end Behavioral;

