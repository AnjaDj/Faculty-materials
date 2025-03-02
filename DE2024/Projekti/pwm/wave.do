# Ukloni sve prethodne talasne oblike
delete wave *

# Dodaj signale testbench-a
add wave /dc_controller_tb/clk
add wave /dc_controller_tb/reset
add wave /dc_controller_tb/duty
add wave /dc_controller_tb/polarity
add wave /dc_controller_tb/start
add wave /dc_controller_tb/stop
add wave /dc_controller_tb/motor_out

# Podešavanje prikaza
configure wave -namecolwidth 200
configure wave -valuecolwidth 100

run 1ms
