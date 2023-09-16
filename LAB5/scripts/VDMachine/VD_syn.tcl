set DESIGN_NAME VendingMachine

analyze -format verilog {./src/VDMachine/VendingMachine.v }
elaborate $DESIGN_NAME

link
check_design

##set delay 200
##set_max_delay $delay -from [all_inputs] -to [all_outputs]
read_sdc scripts/VDMACHINE/VD_clock.sdc
set_max_area 0


compile


change_names -h -rules verilog
write -h -f verilog -output netlist.v
write_sdf netlist.sdf



exit
