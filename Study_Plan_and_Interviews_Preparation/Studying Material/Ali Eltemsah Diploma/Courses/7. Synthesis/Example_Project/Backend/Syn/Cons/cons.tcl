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
# 3. Clock Uncertainties
# 4. Clock Latencies
# 5. Clock Transitions
####################################################################################

set MASTER_CLK_NAME CLK
# set ALU_CLK_NAME ALU_CLK
# set REG_CLK_NAME REG_CLK
set MASTER_CLK_PER 8
# set REG_CLK_PER 200
# set ALU_CLK_PER 100
set CLK_SETUP_SKEW 0.2
set CLK_HOLD_SKEW 0.1
set CLK_LAT 0
set CLK_RISE 0.05
set CLK_FALL 0.05

create_clock -name $MASTER_CLK_NAME -period $MASTER_CLK_PER -waveform "0 [expr $MASTER_CLK_PER/2]" [get_ports clk]

# create_generated_clock -master_clock $MASTER_CLK_NAME -source [get_ports CLK] \
#                        -name $ALU_CLK_NAME [get_port U0_CLK_GATE/GATED_CLK] \
#                        -divide_by 1
# create_generated_clock -master_clock $MASTER_CLK_NAME -source [get_ports CLK] \
#                       -name $REG_CLK_NAME [get_port U0_ClkDiv/o_div_clk] \
#                       -divide_by 2

set_clock_uncertainty -setup $CLK_SETUP_SKEW [get_clocks $MASTER_CLK_NAME]
set_clock_uncertainty -hold $CLK_HOLD_SKEW  [get_clocks $MASTER_CLK_NAME]
# set_clock_uncertainty -setup $CLK_SETUP_SKEW [get_clocks $ALU_CLK_NAME]
# set_clock_uncertainty -hold $CLK_HOLD_SKEW  [get_clocks $ALU_CLK_NAME]
# set_clock_uncertainty -setup $CLK_SETUP_SKEW [get_clocks $REG_CLK_NAME]
# set_clock_uncertainty -hold $CLK_HOLD_SKEW  [get_clocks $REG_CLK_NAME]


set_clock_latency $CLK_LAT [get_clocks $MASTER_CLK_NAME]
# set_clock_latency $CLK_LAT [get_clocks $ALU_CLK_NAME]
# set_clock_latency $CLK_LAT [get_clocks $REG_CLK_NAME]

set_clock_transition -rise $CLK_RISE  [get_clocks $MASTER_CLK_NAME]
set_clock_transition -fall $CLK_FALL  [get_clocks $MASTER_CLK_NAME]
# set_clock_transition -rise $CLK_RISE  [get_clocks $ALU_CLK_NAME]
# set_clock_transition -fall $CLK_FALL  [get_clocks $ALU_CLK_NAME]
# set_clock_transition -rise $CLK_RISE  [get_clocks $REG_CLK_NAME]
# set_clock_transition -fall $CLK_FALL  [get_clocks $REG_CLK_NAME]
					   
set_dont_touch_network clk
set_dont_touch_network rst_n

####################################################################################
           #########################################################
                  #### Section 2 : Clocks Relationships ####
           #########################################################
####################################################################################




####################################################################################
           #########################################################
             #### Section 3 : #set input/output delay on ports ####
           #########################################################
####################################################################################
set master_clk_in_delay  [expr 0.2 * $MASTER_CLK_PER]
set master_clk_out_delay [expr 0.2 * $MASTER_CLK_PER]
# set alu_clk_in_delay  	 [expr 0.2 * $ALU_CLK_PER]
# set alu_clk_out_delay 	 [expr 0.2 * $ALU_CLK_PER]
# set reg_clk_in_delay  	 [expr 0.2 * $REG_CLK_PER]
# set reg_clk_out_delay 	 [expr 0.2 * $REG_CLK_PER]

#Constrain Input Paths
set_input_delay $master_clk_in_delay -clock $MASTER_CLK_NAME [remove_from_collection [all_inputs] [get_ports {clk rst_n}]]

#Constrain Output Paths
set_output_delay $master_clk_out_delay -clock $MASTER_CLK_NAME [all_outputs]

####################################################################################
           #########################################################
                  #### Section 4 : Driving cells ####
           #########################################################
####################################################################################

set_driving_cell -lib_cell BUFX2M [remove_from_collection [all_inputs] [get_ports {clk rst_n}]]

####################################################################################
           #########################################################
                  #### Section 5 : Output load ####
           #########################################################
####################################################################################

set_load 5 [all_outputs]

####################################################################################
           #########################################################
                 #### Section 5 : Operating Condition ####
           #########################################################
####################################################################################

# Define the Worst Library for Max(#setup) analysis
# Define the Best Library for Min(hold) analysis

# set_operating_conditions -min_library "scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c" -min "scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c" -max_library "scmetro_tsmc_cl013g_rvt_ss_1p08v_125c" -max "scmetro_tsmc_cl013g_rvt_ss_1p08v_125c"

####################################################################################
           #########################################################
                  #### Section 6 : wireload Model ####
           #########################################################
####################################################################################

set_wire_load_model -name tsmc13_wl30 -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c
