open_hw_manager
connect_hw_server
open_hw_target -xvc_url host.docker.internal:2542
set dev [lindex [get_hw_devices xc7z020*] 0]
current_hw_device $dev
set_property PROGRAM.FILE {/home/user/ibex-demo-system/build/lowrisc_ibex_demo_system_0/synth_pynqz2-vivado/lowrisc_ibex_demo_system_0.bit} $dev
program_hw_devices $dev
close_hw_manager
