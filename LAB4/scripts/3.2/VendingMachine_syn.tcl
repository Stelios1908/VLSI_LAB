set DESIGN_NAME VendingMachine

analyze -format verilog {./src/3.2/VendingMachine.v}
elaborate $DESIGN_NAME

link
check_design

##set delay 200
##set_max_delay $delay -from [all_inputs] -to [all_outputs]
read_sdc scripts/3.2/VendingMachine_clock.sdc
set_max_area 0

set_optimize_registers
compile_ultra

set resultdir "./results_VendingMachine_compile_ultra"
set postfix "compile_ultra"
exec mkdir -p -- $resultdir
report_timing > $resultdir/timing_report.${postfix}.rpt
report_qor > $resultdir/qor_report.${postfix}.rpt
report_area -hierarchy > $resultdir/area_report.${postfix}.rpt
report_power -hierarchy > $resultdir/power_report.${postfix}.rpt

write -hierarchy -format verilog -output $resultdir/VendingMachine_compiled_ultra.${postfix}.v
gui_start
