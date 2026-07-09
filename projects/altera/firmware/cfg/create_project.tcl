package require ::quartus::project

set pName ""
if { $argc != 1 } {
    puts "Please provide a project name."
    exit
} else {
    set pName [lindex $argv 0]
}

puts "Creating project: $pName"
project_new -revision top $pName -overwrite

set path_script [file dirname [file normalize [info script]]]
set path_src [file join {*}[lrange [file split $path_script] 0 end-5]]

# Configure project
source $path_src/ipbus-firmware/boards/DK-SI-AGI040FES/synth/firmware/ucf/add_assignments.tcl
source $path_src/ipbus-firmware/boards/DK-SI-AGI040FES/synth/firmware/ucf/add_pins.tcl
source $path_script/add_files.tcl

export_assignments

puts "Finished"
