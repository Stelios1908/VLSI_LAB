set DESIGN_NAME accumulator

analyze -format verilog {./src/3.1/accumulator.v ./src/3.1/shift_reg.v}
elaborate $DESIGN_NAME

link
check_design

##set delay 200
##set_max_delay $delay -from [all_inputs] -to [all_outputs]
read_sdc scripts/3.1/accumulator_clock.sdc
set_max_area 0


compile

set resultdir "./results_accumulator_compile"
set postfix "compile"
exec mkdir -p -- $resultdir
report_timing > $resultdir/timing_report.${postfix}.rpt
report_qor > $resultdir/qor_report.${postfix}.rpt
report_area -hierarchy > $resultdir/area_report.${postfix}.rpt
report_power -hierarchy > $resultdir/power_report.${postfix}.rpt

write -hierarchy -format verilog -output $resultdir/accumulator_compiled.${postfix}.v

exit
