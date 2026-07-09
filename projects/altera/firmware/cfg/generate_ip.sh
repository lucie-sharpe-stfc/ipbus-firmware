project="$(find . -iname '*.qpf')"

qsys-script --script=../../src/ipbus-firmware/components/ipbus_eth/firmware/ip/tse_sys.tcl --quartus-project=$project
qsys-script --script=../../src/ipbus-firmware/components/ipbus_util/firmware/ip/iopll.tcl --quartus-project=$project
qsys-script --script=../../src/ipbus-firmware/boards/DK-SI-AGI040FES/synth/firmware/ip/reset_release.tcl --quartus-project=$project
qsys-script --script=../../src/ipbus-firmware/boards/DK-SI-AGI040FES/synth/firmware/ip/probe.tcl --quartus-project=$project

quartus_sh -t ../../src/ipbus-firmware/projects/altera/firmware/cfg/readd_constraints.tcl $project