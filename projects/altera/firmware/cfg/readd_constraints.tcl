set path_script [file dirname [file normalize [info script]]]
set path_src [file join {*}[lrange [file split $path_script] 0 end-5]]

set project [lindex $argv 0]

project_open $project -revision top

set_global_assignment -name SDC_FILE $path_src/ipbus-firmware/boards/DK-SI-AGI040FES/synth/firmware/ucf/constraints.sdc -remove
set_global_assignment -name SDC_FILE $path_src/ipbus-firmware/boards/DK-SI-AGI040FES/synth/firmware/ucf/constraints.sdc

export_assignments
project_close