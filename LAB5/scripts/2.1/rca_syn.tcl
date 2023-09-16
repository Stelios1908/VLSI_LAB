set DESIGN_NAME rca

analyze -format verilog {./src/2.1/rca.v ./src/2.1/fulladder.v ./src/2.1/myreg.v }
elaborate $DESIGN_NAME

link
check_design

##set delay 200
##set_max_delay $delay -from [all_inputs] -to [all_outputs]
read_sdc scripts/2.1/rca_clock.sdc
set_max_area 0


compile

change_names -h -rules verilog
write -h -f verilog -output netlist.v
write_sdf netlist.sdf

exit
