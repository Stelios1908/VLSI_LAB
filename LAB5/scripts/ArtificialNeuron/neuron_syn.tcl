set DESIGN_NAME neuron

analyze -format verilog {./src/ArtificialNeuron/neuron.v ./src/ArtificialNeuron/mycell.v }
elaborate $DESIGN_NAME

link
check_design

set delay 2500
set_max_delay $delay -from [all_inputs] -to [all_outputs]
#read_sdc scripts/VDMACHINE/VD_clock.sdc
set_max_area 0


compile


change_names -h -rules verilog
write -h -f verilog -output netlist.v
write_sdf netlist.sdf


gui_start

