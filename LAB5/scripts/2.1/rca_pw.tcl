read_verilog netlist.v
link_design

set power_enable_analysis true

read_fsdb -strip_path rca_tb/DUT rca.fsdb

update_power
report_power


exit
