set synopsys_auto_setup true

#set_svf "/home/IC/Labs/Ass_Syn_2.0/dft/UART.svf"

set SSLIB "/home/IC/Labs/Ass_Syn_2.0/std_cells/scmetro_tsmc_cl013g_rvt_ss_1p08v_125c.db"
set TTLIB "/home/IC/Labs/Ass_Syn_2.0/std_cells/scmetro_tsmc_cl013g_rvt_tt_1p2v_25c.db"
set FFLIB "/home/IC/Labs/Ass_Syn_2.0/std_cells/scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c.db"

## Read reference technology libraries
read_db -container Ref [list $SSLIB $TTLIB $FFLIB]

## Read Reference Design Files
read_verilog -container Ref "/home/IC/Labs/Ass_Syn_2.0/rtl/UART_TX/MUX_8x1.v"
read_verilog -container Ref "/home/IC/Labs/Ass_Syn_2.0/rtl/UART_TX/Parity_Calc.v"
read_verilog -container Ref "/home/IC/Labs/Ass_Syn_2.0/rtl/UART_TX/serializer.v"
read_verilog -container Ref "/home/IC/Labs/Ass_Syn_2.0/rtl/UART_TX/UART_Tx.v"
read_verilog -container Ref "/home/IC/Labs/Ass_Syn_2.0/rtl/UART_TX/UART_Tx_FSM.v"
read_verilog -container Ref "/home/IC/Labs/Ass_Syn_2.0/rtl/UART_RX/data_sampling.v"
read_verilog -container Ref "/home/IC/Labs/Ass_Syn_2.0/rtl/UART_RX/deserializer.v"
read_verilog -container Ref "/home/IC/Labs/Ass_Syn_2.0/rtl/UART_RX/edge_bit_counter.v"
read_verilog -container Ref "/home/IC/Labs/Ass_Syn_2.0/rtl/UART_RX/parity_check.v"
read_verilog -container Ref "/home/IC/Labs/Ass_Syn_2.0/rtl/UART_RX/start_check.v"
read_verilog -container Ref "/home/IC/Labs/Ass_Syn_2.0/rtl/UART_RX/stop_check.v"
read_verilog -container Ref "/home/IC/Labs/Ass_Syn_2.0/rtl/UART_RX/UART_Rx.v"
read_verilog -container Ref "/home/IC/Labs/Ass_Syn_2.0/rtl/UART_RX/UART_Rx_FSM.v"
read_verilog -container Ref "/home/IC/Labs/Ass_Syn_2.0/rtl/UART_TOP/mux_2X1.v"
read_verilog -container Ref "/home/IC/Labs/Ass_Syn_2.0/rtl/UART_TOP/UART.v"

## set the top Reference Design 
set_reference_design UART
set_top UART


## Read implementation technology libraries
read_db -container Imp [list $SSLIB $TTLIB $FFLIB]

## Read Implementation Design Files
read_verilog -container Imp "/home/IC/Labs/Ass_Syn_2.0/dft/UART.v"

## set the top Implementation Design
set_implementation_design UART
set_top UART

############################### Don't verify #################################

# do not verify scan out port as a compare point as it is existed only after synthesis and not existed in the RTL
#scan_out
set_dont_verify_points -type port Ref:/WORK/*/SO
set_dont_verify_points -type port Imp:/WORK/*/SO

############################### contants #####################################

# all atpg enable(test_mode, scan_enable) are zero during formal compare

#test_mode
set_constant Ref:/WORK/*/test_mode 0
set_constant Imp:/WORK/*/test_mode 0

#scan_enable
set_constant Ref:/WORK/*/SE 0
set_constant Imp:/WORK/*/SE 0

## matching Compare points
match


## verify
set successful [verify]
if {!$successful} {
diagnose
analyze_points -failing
}

#Reports
report_passing_points > "passing_points.rpt"
report_failing_points > "failing_points.rpt"
report_aborted_points > "aborted_points.rpt"
report_unverified_points > "unverified_points.rpt"


start_gui

