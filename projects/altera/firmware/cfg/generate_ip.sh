SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
CLOCK_DEFINITIONS="$SCRIPT_DIR/clock_definition.tcl"

project="$(find . -iname '*.qpf')"

qsys-script --script=../../src/ipbus-firmware/components/ipbus_eth/firmware/ip/tse_sys.tcl --quartus-project=$project
qsys-script --script=../../src/ipbus-firmware/components/ipbus_util/firmware/ip/clocks/iopll.tcl --quartus-project=$project
qsys-script --script=../../src/ipbus-firmware/boards/DK-SI-AGI040FES/synth/firmware/ip/reset_release.tcl --quartus-project=$project
qsys-script --script=../../src/ipbus-firmware/boards/DK-SI-AGI040FES/synth/firmware/ip/probe.tcl --quartus-project=$project

quartus_sh -t ../../src/quartus-emp/projects/example/firmware/cfg/readd_constraints.tcl $project