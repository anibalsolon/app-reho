#!/bin/bash

/opt/afni/3dmaskdump -noijk $1 | /opt/afni/1d_tool.py -show_mmms -infile - | grep 'col 0' > stats.1D

MEAN=$(sed -r 's/.*mean\s*=\s*([0-9.-]+).*/\1/' stats.1D)
SD=$(sed -r 's/.*stdev\s*=\s*([0-9.-]+).*/\1/' stats.1D)

/opt/afni/3dcalc -a $1 -expr "((a - $MEAN) / $SD)" -prefix $2
rm stats.1D