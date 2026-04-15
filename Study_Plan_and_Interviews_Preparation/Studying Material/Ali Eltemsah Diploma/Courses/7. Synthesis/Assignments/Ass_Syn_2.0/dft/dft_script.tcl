define_design_lib work -path ./work

set_svf UART.svf

puts "###########################################"
puts "#      #setting Design Libraries           #"
puts "###########################################"

################## Design Compiler Library Files ######################

lappend search_path /home/IC/Labs/Ass_Syn_2.0/std_cells
lappend search_path /home/IC/Labs/Ass_Syn_2.0/rtl
lappend search_path /home/IC/Labs/Ass_Syn_2.0/rtl/UART_TX
lappend search_path /home/IC/Labs/Ass_Syn_2.0/rtl/UART_RX
lappend search_path /home/IC/Labs/Ass_Syn_2.0/rtl/UART_TOP

set SSLIB "scmetro_tsmc_cl013g_rvt_ss_1p08v_125c.db"
set TTLIB "scmetro_tsmc_cl013g_rvt_tt_1p2v_25c.db"
set FFLIB "scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c.db"

## Standard Cell libraries 
set target_library [list $SSLIB $TTLIB $FFLIB]

## Standard Cell & Hard Macros libraries 
set link_library [list * $SSLIB $TTLIB $FFLIB]  

puts "###########################################"
puts "#             Reading RTL Files           #"
puts "###########################################"

#echo "###############################################"
#echo "############# Reading RTL Files  ##############"
#echo "###############################################"

#TX
read_file -format verilog MUX_8x1.v
read_file -format verilog Parity_Calc.v
read_file -format verilog serializer.v
read_file -format verilog UART_Tx_FSM.v
read_file -format verilog UART_Tx.v
#RX
read_file -format verilog data_sampling.v
read_file -format verilog deserializer.v
read_file -format verilog edge_bit_counter.v
read_file -format verilog parity_check.v
read_file -format verilog stop_check.v
read_file -format verilog start_check.v
read_file -format verilog UART_Rx.v
read_file -format verilog UART_Rx_FSM.v
#UART TOP
read_file -format verilog UART_TOP/mux_2X1.v
read_file -format verilog UART_TOP/UART.v

puts "###############################################"
puts "######## Liniking All The Design Parts ########"
puts "###############################################"

#################### Liniking All The Design Parts #########################
#echo "###############################################"
#echo "# Linking The Top Module with its submodules  #"
#echo "###############################################"

link 

#################### Liniking All The Design Parts #########################
puts "###############################################"
puts "######## checking design consistency ##########"
puts "###############################################"

check_design

############# Make unique copies of replicated modules by ##################
############# giving each replicated module a unique name  #############

#uniquify

#################### Define Design Constraints #########################
source ./const.tcl

#################### Archirecture Scan Chains #########################
puts "###############################################"
puts "############ Configure scan chains ############"
puts "###############################################"

set_scan_configuration -clock_mixing no_mix  -style multiplexed_flip_flop -replace true -max_length 100

puts "###############################################"
puts "########## Mapping & Optimization #############"
puts "###############################################"

###################### Mapping and optimization ########################

compile -scan

################################################################### 
# Setting Test Timing Variables
################################################################### 

# Preclock Measure Protocol (default protocol)
set test_default_period 100
set test_default_delay 0
set test_default_bidir_delay 0
set test_default_strobe 20
set test_default_strobe_width 0

########################## Define DFT Signals ##########################

set_dft_signal -port [get_ports scan_clk]  -type ScanClock   -view existing_dft  -timing {30 60}
set_dft_signal -port [get_ports scan_rst]  -type Reset       -view existing_dft  -active_state 0
set_dft_signal -port [get_ports test_mode] -type Constant    -view existing_dft  -active_state 1 
set_dft_signal -port [get_ports test_mode] -type TestMode    -view spec          -active_state 1 
set_dft_signal -port [get_ports SE]        -type ScanEnable  -view spec          -active_state 1   -usage scan
set_dft_signal -port [get_ports SI]        -type ScanDataIn  -view spec 
set_dft_signal -port [get_ports SO]        -type ScanDataOut -view spec

############################# Create Test Protocol #####################

create_test_protocol
                            
###################### Pre-DFT Design Rule Checking ####################

dft_drc -verbose

############################# Preview DFT ##############################

preview_dft -show scan_summary


############################# Insert DFT ###############################

insert_dft

######################## Optimize Logic post DFT #######################

compile -scan -incremental

###################### Design Rule Checking post DFT ###################

dft_drc -verbose -coverage_estimate > drc_post_dft_coverage.rpt

#############################################################################
# Write out Design after initial compile
#############################################################################

write_file -format verilog -hierarchy -output UART.v
write_file -format ddc 	   -hierarchy -output UART.ddc
write_sdf UART.sdf

################# reporting #######################

report_area -hierarchy > area.rpt
report_power -hierarchy > power.rpt
report_timing -max_paths 100 -delay_type min > hold.rpt
report_timing -max_paths 100 -delay_type max > setup.rpt
report_clock -attributes > clocks.rpt
report_port > ports.rpt
report_constraint -all_violators > constraints.rpt

################# starting graphical user interface #######################

#gui_start
