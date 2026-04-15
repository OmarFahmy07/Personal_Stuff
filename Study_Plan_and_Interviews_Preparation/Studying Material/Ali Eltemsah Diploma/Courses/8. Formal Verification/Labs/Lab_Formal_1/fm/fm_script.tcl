
############################## Formality Setup File ##############################

set SSLIB "/home/IC/Labs/Lab_Formal_1/std_cells/scmetro_tsmc_cl013g_rvt_ss_1p08v_125c.db"
set TTLIB "/home/IC/Labs/Lab_Formal_1/std_cells/scmetro_tsmc_cl013g_rvt_tt_1p2v_25c.db"
set FFLIB "/home/IC/Labs/Lab_Formal_1/std_cells/scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c.db"

## Read Reference Design Files


## set the top Reference Design 


## Read Implementation technology libraries


## Read Implementation Design Files


## set the top Implementation Design



## matching Compare points



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
