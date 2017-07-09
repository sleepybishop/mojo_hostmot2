#!/bin/sh

if [ -z "$1" ]; then
				echo no project file name given
				exit -1
fi

echo "vhdl work out/$1.vhd" > $1.prj
for VHD in `find common/ -name '*.vhd'`; do echo vhdl work "$VHD" >> $1.prj ; done
for VHD in `find card/   -name '*.vhd'`; do echo vhdl work "$VHD" >> $1.prj ; done
for VHD in `find pin/    -name '*.vhd'`; do echo vhdl work "$VHD" >> $1.prj ; done

