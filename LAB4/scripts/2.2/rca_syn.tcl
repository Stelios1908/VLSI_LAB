set DESIGN_NAME pipline_rca

analyze -format verilog {./src/2.2/rca.v ./src/2.2/fulladder.v ./src/2.2/myreg.v ./src/2.2/pipline_rca.v}
elaborate $DESIGN_NAME

link
check_design

##set delay 200
##set_max_delay $delay -from [all_inputs] -to [all_outputs]
read_sdc scripts/2.2/rca_clock.sdc
set_max_area 0

set_optimize_registers
compile

set resultdir "./results_rca_compile"
set postfix "compile"
exec mkdir -p -- $resultdir
report_timing > $resultdir/timing_report.${postfix}.rpt
report_qor > $resultdir/qor_report.${postfix}.rpt
report_area -hierarchy > $resultdir/area_report.${postfix}.rpt
report_power -hierarchy > $resultdir/power_report.${postfix}.rpt

write -hierarchy -format verilog -output $resultdir/rca_compiled.${postfix}.v

gui_start
