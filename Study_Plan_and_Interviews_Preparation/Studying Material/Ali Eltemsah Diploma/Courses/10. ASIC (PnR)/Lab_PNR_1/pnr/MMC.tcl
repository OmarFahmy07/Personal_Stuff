
create_library_set -name min_library -timing "../std_cells/libs/scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c.lib"
create_library_set -name max_library -timing "../std_cells/libs/scmetro_tsmc_cl013g_rvt_ss_1p08v_125c.lib"
create_library_set -name typ_library -timing "../std_cells/libs/scmetro_tsmc_cl013g_rvt_tt_1p2v_25c.lib"

create_constraint_mode -name func_mode -sdc_files {../dft/ALU_TOP.sdc}

create_rc_corner -name RCcorner -T {25}

create_delay_corner -name min_corner -library_set min_library -rc_corner RCcornercreate_delay_corner -name max_corner -library_set max_library -rc_corner RCcorner

create_analysis_view -name setup_analysis_view -delay_corner max_corner -constraint_mode func_mode
create_analysis_view -name hold_analysis_view  -delay_corner min_corner -constraint_mode func_mode

set_analysis_view -setup {setup_analysis_view} -hold {hold_analysis_view}
