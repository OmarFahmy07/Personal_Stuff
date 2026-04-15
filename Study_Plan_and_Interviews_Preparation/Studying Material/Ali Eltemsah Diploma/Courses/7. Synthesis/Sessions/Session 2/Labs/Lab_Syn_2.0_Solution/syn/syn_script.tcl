
################## Design Compiler Library Files ######################

lappend search_path /home/IC/Labs/Lab_Syn_2.0/std_cells
lappend search_path /home/IC/Labs/Lab_Syn_2.0/rtl

set TTLIB "scmetro_tsmc_cl013g_rvt_tt_1p2v_25c.db"

## Standard Cell libraries 
set target_library [list $TTLIB]

## Standard Cell & Hard Macros libraries 
set link_library [list * $TTLIB]  

######################## Reading RTL Files #################################

read_file -format verilog Up_Dn_Counter.v

link 

###################### Mapping and optimization ########################"

compile

#############################################################################
# Write out Design after initial compile
#############################################################################

write_file -format verilog -output Up_Dn_Counter_mapped.v


