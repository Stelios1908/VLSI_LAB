set DESIGN_NAME accumulator

analyze -format verilog {./src/accumulator/accumulator.v ./src/accumulator/shift_reg.v  }
elaborate $DESIGN_NAME

link
check_design

##set delay 200
##set_max_delay $delay -from [all_inputs] -to [all_outputs]
read_sdc scripts/accumulator/acc_clock.sdc
set_max_area 0


compile


change_names -h -rules verilog
write -h -f verilog -output netlist.v
write_sdf netlist.sdf



exit
