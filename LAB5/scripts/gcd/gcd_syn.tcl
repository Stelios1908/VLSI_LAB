set DESIGN_NAME gcd

analyze -format verilog {./src/gcd/gcd.v ./src/gcd/dataPath.v ./src/gcd/controlUnit.v }
elaborate $DESIGN_NAME

link
check_design

##set delay 200
##set_max_delay $delay -from [all_inputs] -to [all_outputs]
read_sdc scripts/gcd/gcd_clock.sdc
set_max_area 0


compile


change_names -h -rules verilog
write -h -f verilog -output netlist.v
write_sdf netlist.sdf



exit
