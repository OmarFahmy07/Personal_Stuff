
########################### Define Top Module ############################
                                                   
set top_module reciprocal

##################### Define Working Library Directory ######################
                                                   
define_design_lib work -path ./work

################## Design Compiler Library Files #setup ######################

puts "###########################################"
puts "#      #setting Design Libraries          #"
puts "###########################################"

#Add the path of the libraries to the search_path variable
lappend search_path /home/IC/Projects/temp_project/Backend/std_cells
lappend search_path /home/IC/Projects/temp_project/RTL

set SSLIB "scmetro_tsmc_cl013g_rvt_ss_1p08v_125c.db"
set TTLIB "scmetro_tsmc_cl013g_rvt_tt_1p2v_25c.db"
set FFLIB "scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c.db"

## Standard Cell libraries 
set target_library [list $SSLIB $TTLIB $FFLIB]

## Standard Cell & Hard Macros libraries 
set link_library [list * $SSLIB $TTLIB $FFLIB]  

######################## Reading RTL Files #################################

puts "###########################################"
puts "#             Reading RTL Files           #"
puts "###########################################"

set file_format sverilog

analyze -format $file_format reciprocal.sv
analyze -format $file_format mul.sv

elaborate reciprocal

###################### Defining toplevel ###################################

current_design $top_module

puts "###############################################"
puts "######## checking design consistency ##########"
puts "###############################################"

check_design

############################### Path groups ################################

puts "###############################################"
puts "################ Path groups ##################"
puts "###############################################"

# group_path -name INREG -from [all_inputs]
# group_path -name REGOUT -to [all_outputs]
# group_path -name INOUT -from [all_inputs] -to [all_outputs]

#################### Define Design Constraints #########################

puts "###############################################"
puts "############ Design Constraints #### ##########"
puts "###############################################"

source ./Cons/cons.tcl

###################### Mapping and optimization ########################

puts "###############################################"
puts "########## Mapping & Optimization #############"
puts "###############################################"

compile_ultra
# compile -map_effort medium

#############################################################################
# Write out Design after initial compile
#############################################################################

write_file -format verilog -hierarchy -output ./Outputs/$top_module.v
write_file -format ddc -hierarchy -output ./Outputs/$top_module.ddc
write_sdc  -nosplit ./Outputs/$top_module.sdc

################# reporting #######################

report_area -hierarchy > ./Reports/area.rpt
report_power -hierarchy > ./Reports/power.rpt
report_timing -max_paths 100 -delay_type min > ./Reports/hold.rpt
report_timing -max_paths 100 -delay_type max > ./Reports/setup.rpt
report_clock -attributes > ./Reports/clocks.rpt
report_constraint -all_violators > ./Reports/constraints.rpt

################# starting graphical user interface #######################
#gui_start

exit
