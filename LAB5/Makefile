SHELL = /bin/bash
VCS = vcs -full64


VCS_POWER = -kdb
VCS_OPTS=  -debug_access+all 
VCS_TIME_SCALE =  -timescale=1ns/1ps
GUI_OPTS = -gui=dve


a: 
	$(VCS) -q -debug_access+all -timescale=1ns/1ns src/accumulator/shift_reg.v src/accumulator/accumulator.v src/accumulator/accumulator_tb.v -o $@
	./$@ 	


rca_synth:
	dc_shell -f scripts/2.1/rca_syn.tcl

rca_tim:
	 $(VCS) $(VCS_OPTS) $(VCS_TIME_SCALE) -sdf max:rca_tb.DUT:netlist.sdf src/2.1/rca_tb.v netlist.v \
		/usr/local/eda/synLibs/asap7/7nm/verilog/*.v -o rca_timing 
		 ./rca_timing $(GUI_OPTS)
		
rca_pw:
	$(VCS) $(VCS_POWER) $(VCS_OPTS) $(VCS_TIME_SCALE) -sdf max:rca_tb.DUT:netlist.sdf src/2.1/rca_tb.v netlist.v \
		/usr/local/eda/synLibs/asap7/7nm/verilog/*.v -o rca_timing
		./rca_timing -ucli -do scripts/2.1/dump.tcl
		pt_shell -f scripts/2.1/rca_pw.tcl

example: rca_synth rca_tim rca_pw


gcd_synth:
	dc_shell -f scripts/gcd/gcd_syn.tcl

gcd_tim:
	 $(VCS) $(VCS_OPTS) $(VCS_TIME_SCALE) -sdf max:gcd_tb.DUT:netlist.sdf  src/gcd/gcd_tb.v netlist.v \
		/usr/local/eda/synLibs/asap7/7nm/verilog/*.v -o gcd_timing 
		 ./gcd_timing $(GUI_OPTS)
		
gcd_pw:
	$(VCS) $(VCS_POWER) $(VCS_OPTS) $(VCS_TIME_SCALE) -sdf max:gcd_tb.DUT:netlist.sdf src/gcd/gcd_tb.v netlist.v \
		/usr/local/eda/synLibs/asap7/7nm/verilog/*.v -o gcd_timing
		./gcd_timing -ucli -do scripts/gcd/dump.tcl
		pt_shell -f scripts/gcd/gcd_pw.tcl

gcd: gcd_synth gcd_tim gcd_pw



acc_synth:
	dc_shell -f scripts/accumulator/acc_syn.tcl


acc_tim:
	 $(VCS) $(VCS_OPTS) $(VCS_TIME_SCALE) -sdf max:accumulator_tb.DUT:netlist.sdf src/accumulator/accumulator_tb.v netlist.v \
		/usr/local/eda/synLibs/asap7/7nm/verilog/*.v -o acc_timing
		  ./acc_timing $(GUI_OPTS)

acc_pw:
	$(VCS) $(VCS_POWER) $(VCS_OPTS) $(VCS_TIME_SCALE) -sdf max:accumulator_tb.DUT:netlist.sdf src/accumulator/accumulator_tb.v netlist.v \
		/usr/local/eda/synLibs/asap7/7nm/verilog/*.v -o acc_timing
		./acc_timing -ucli -do scripts/accumulator/dump.tcl
		pt_shell -f scripts/accumulator/acc_pw.tcl

acc: acc_synth acc_tim acc_pw


vdm_synth:
	dc_shell -f scripts/VDMachine/VD_syn.tcl


vdm_tim:
	 $(VCS) $(VCS_OPTS) $(VCS_TIME_SCALE) -sdf max:VendingMachine_tb.DUT:netlist.sdf src/VDMachine/VendingMachine_tb.v netlist.v \
		/usr/local/eda/synLibs/asap7/7nm/verilog/*.v -o vdm_timing 
		 ./vdm_timing $(GUI_OPTS)
	
vdm_pw:
	$(VCS) $(VCS_POWER) $(VCS_OPTS) $(VCS_TIME_SCALE) -sdf max:VendingMachine_tb.DUT:netlist.sdf src/VDMachine/VendingMachine_tb.v netlist.v \
		/usr/local/eda/synLibs/asap7/7nm/verilog/*.v -o vdm_timing
		./vdm_timing -ucli -do scripts/VDMachine/dump.tcl
		pt_shell -f scripts/VDMachine/VD_pw.tcl	

vdm: vdm_synth vdm_tim vdm_pw

clean_synth:
	rm -f -r csrc
	rm -f  *.log
	rm -f  *.syn
	rm -f  *.pvl
	rm -f  *.mr
	rm -f  *.mr
	rm -f  *.log
	rm -f  *.svf
	rm -f  *.sdf
	rm -f  *.v

clean_tim:
	rm -f -r csrc
	rm -f -r DVEfiles
	rm -f -r *.daidir
	rm -f *.vcd
	rm -f *.key
	rm -f *.vpd

clean_pw:
	rm -f *.fsdb
	rm -f verdi_config_file

clean: clean_synth clean_tim clean_pw
	


