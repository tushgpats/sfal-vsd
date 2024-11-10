set_app_var link_path [list * /home/ganesh/ICC2Exp/VSDBabySoC_ICC2/sky130_fd_sc_hd__tt_025C_1v80.db /home/ganesh/ICC2Exp/VSDBabySoC_ICC2/avsdpll.db /home/ganesh/ICC2Exp/VSDBabySoC_ICC2/avsddac.db]
  
  read_verilog /home/ganesh/ICC2Exp/VSDBabySoC_ICC2/standaloneFlow/vsdbabysoc_post_route_net.v
  current_design vsdbabysoc
  link_design
  
  #set_min_library -min_version /home/ganesh/VSDBabySoC/src/timing_libs/sky130_fd_sc_hd__ff_n40C_1v95.db /home/ganesh/VSDBabySoC/src/timing_libs/sky130_fd_sc_hd__ss_n40C_1v28.db
  
  read_sdc  /home/ganesh/ICC2Exp/VSDBabySoC_ICC2/standaloneFlow/vsdbabysoc_post_route.sdc
  read_parasitics /home/ganesh/ICC2Exp/VSDBabySoC_ICC2/standaloneFlow/vsdbabysoc_parasitics.temp1_25.spef
  
  report_analysis_coverage > /home/ganesh/ICC2Exp/VSDBabySoC_ICC2/standaloneFlow/rpts_icc2/prime_time_analysis_coverage.rpt
  report_constraint -all_violators > /home/ganesh/ICC2Exp/VSDBabySoC_ICC2/standaloneFlow/rpts_icc2/prime_time_constraint.rpt
  report_timing -delay_type max -capacitance -input_pins -nets -transition_time -nosplit -significant_digits 4 > /home/ganesh/ICC2Exp/VSDBabySoC_ICC2/standaloneFlow/rpts_icc2/prime_time_setup_timing.rpt
  report_timing -delay_type min -capacitance -input_pins -nets -transition_time -nosplit -significant_digits 4 > /home/ganesh/ICC2Exp/VSDBabySoC_ICC2/standaloneFlow/rpts_icc2/prime_time_hold_timing.rpt

