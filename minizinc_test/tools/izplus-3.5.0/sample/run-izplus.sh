#!/bin/sh

#
# run this script as following:
#
#   $ ./run-izplus.sh  -a cargo_coarsePiles.mzn -d challenge04_1s_626.dzn
#

FZN_CMD="../bin/fzn_izplus"
FZN_FLAGS="-f"
MZN_LIBDIR="../mzn-lib"

minizinc -f "$FZN_CMD $FZN_FLAGS" -I $MZN_LIBDIR $@
