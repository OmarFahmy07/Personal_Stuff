# Constraints
# ----------------------------------------------------------------------------
#
# 1. Master Clock Definitions
#
# 2. Generated Clock Definitions
#
# 3. Clock Uncertainties
#
# 4. Clock Latencies 
#
# 5. Clock Relationships
#
# 6. set input/output delay on ports
#
# 7. Driving cells
#
# 8. Output load

####################################################################################
           #########################################################
                  #### Section 1 : Clock Definition ####
           #########################################################
#################################################################################### 
# 1. Master Clock Definitions 
# 2. Generated Clock Definitions
# 3. Clock Latencies
# 4. Clock Uncertainties
# 4. Clock Transitions
####################################################################################
set RX_CLK_NAME 	RX_CLK
set TX_CLK_NAME		TX_CLK
set CLK_SETUP_SKEW	0.25
set CLK_HOLD_SKEW	0.05
set RX_CLK_PERIOD 	100
set TX_CLK_PERIOD	800
set CLK_RISE		0.1
set CLK_FALL		0.1
set CLK_LAT		0
set DIV_RATIO		8

create_clock -name $RX_CLK_NAME -period $RX_CLK_PERIOD [get_ports RX_CLK]
create_clock -name $TX_CLK_NAME -period $TX_CLK_PERIOD [get_ports TX_CLK]

#create_generated_clock -master_clock $RX_CLK_NAME -source [get_ports RX_CLK] -name $TX_CLK_NAME -divide_by $DIV_RATIO [get_ports TX_CLK]

set_clock_uncertainty -setup $CLK_SETUP_SKEW [get_clocks $RX_CLK_NAME]
set_clock_uncertainty -hold $CLK_HOLD_SKEW  [get_clocks $RX_CLK_NAME]

set_clock_uncertainty -setup $CLK_SETUP_SKEW [get_clocks $TX_CLK_NAME]
set_clock_uncertainty -hold $CLK_HOLD_SKEW   [get_clocks $TX_CLK_NAME]

set_clock_transition -rise $CLK_RISE  [get_clocks $RX_CLK_NAME]
set_clock_transition -fall $CLK_FALL  [get_clocks $RX_CLK_NAME]

set_clock_transition -rise $CLK_RISE  [get_clocks $TX_CLK_NAME]
set_clock_transition -fall $CLK_FALL  [get_clocks $TX_CLK_NAME]

set_clock_latency $CLK_LAT [get_clocks $RX_CLK_NAME]
set_clock_latency $CLK_LAT [get_clocks $TX_CLK_NAME]

set_dont_touch_network TX_CLK
set_dont_touch_network RX_CLK
set_dont_touch_network RST

####################################################################################
           #########################################################
                  #### Section 2 : Clocks Relationships ####
           #########################################################
####################################################################################
set_multicycle_path -setup $DIV_RATIO -from $TX_CLK_NAME -to $RX_CLK_NAME
set_multicycle_path -hold [expr $DIV_RATIO - 1] -from $TX_CLK_NAME -to $RX_CLK_NAME

####################################################################################
           #########################################################
             #### Section 3 : #set input/output delay on ports ####
           #########################################################
####################################################################################
set RX_CLK_INPUT_DELAY   [expr 0.2 * $RX_CLK_PERIOD]
set RX_CLK_OUTPUT_DELAY  [expr 0.2 * $RX_CLK_PERIOD]

#Constrain Input Paths
set_input_delay $RX_CLK_INPUT_DELAY -clock $RX_CLK_NAME [get_ports PAR_TYP]
set_input_delay $RX_CLK_INPUT_DELAY -clock $RX_CLK_NAME [get_ports PAR_EN]
set_input_delay $RX_CLK_INPUT_DELAY -clock $TX_CLK_NAME [get_ports P_DATA_TX]
set_input_delay $RX_CLK_INPUT_DELAY -clock $TX_CLK_NAME [get_ports DATA_VALID_TX]
set_input_delay $RX_CLK_INPUT_DELAY -clock $RX_CLK_NAME [get_ports RX_IN]
set_input_delay $RX_CLK_INPUT_DELAY -clock $RX_CLK_NAME [get_ports PRESCALE_RX]

#Constrain Output Paths
set_output_delay $RX_CLK_OUTPUT_DELAY -clock $TX_CLK_NAME [get_ports TX_OUT]
set_output_delay $RX_CLK_OUTPUT_DELAY -clock $TX_CLK_NAME [get_ports BUSY_TX]
set_output_delay $RX_CLK_OUTPUT_DELAY -clock $RX_CLK_NAME [get_ports P_DATA_RX]
set_output_delay $RX_CLK_OUTPUT_DELAY -clock $RX_CLK_NAME [get_ports PAR_ERR_RX]
set_output_delay $RX_CLK_OUTPUT_DELAY -clock $RX_CLK_NAME [get_ports STP_ERR_RX]
set_output_delay $RX_CLK_OUTPUT_DELAY -clock $RX_CLK_NAME [get_ports DATA_VALID_RX]

####################################################################################
           #########################################################
                  #### Section 4 : Driving cells ####
           #########################################################
####################################################################################
set_driving_cell -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -lib_cell BUFX2M -pin Y [get_ports PAR_TYP]
set_driving_cell -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -lib_cell BUFX2M -pin Y [get_ports PAR_EN]
set_driving_cell -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -lib_cell BUFX2M -pin Y [get_ports P_DATA_TX]
set_driving_cell -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -lib_cell BUFX2M -pin Y [get_ports DATA_VALID_TX]
set_driving_cell -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -lib_cell BUFX2M -pin Y [get_ports RX_IN]
set_driving_cell -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -lib_cell BUFX2M -pin Y [get_ports PRESCALE_RX]

####################################################################################
           #########################################################
                  #### Section 5 : Output load ####
           #########################################################
####################################################################################
set_load 50 [get_ports TX_OUT]
set_load 50 [get_ports BUSY_TX]
set_load 50 [get_ports P_DATA_RX]
set_load 50 [get_ports PAR_ERR_RX]
set_load 50 [get_ports STP_ERR_RX]
set_load 50 [get_ports DATA_VALID_RX]

####################################################################################
           #########################################################
                 #### Section 6 : Operating Condition ####
           #########################################################
####################################################################################

# Define the Worst Library for Max(#setup) analysis
# Define the Best Library for Min(hold) analysis
set_operating_conditions -min_library "scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c" -min "scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c" -max_library "scmetro_tsmc_cl013g_rvt_ss_1p08v_125c" \
-max "scmetro_tsmc_cl013g_rvt_ss_1p08v_125c"

####################################################################################
           #########################################################
                  #### Section 7 : wireload Model ####
           #########################################################
####################################################################################
set_wire_load_model -name tsmc13_wl30 -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c

