#!/bin/bash

##############################################################
##
# CHANGE ONLY IF REALLY NECESSARY
##
##############################################################

export BASE_DIR="$PWD"
export TOOLS_DIRS="${BASE_DIR}/tools"
export SOLVERS_DIRS="${TOOLS_DIRS}/solvers"
export OURTOOL="${SOLVERS_DIRS}/ourtool-1.6.1/"
export OURTOOL162="${SOLVERS_DIRS}/ourtool-1.6.2/"
export G12="${SOLVERS_DIRS}/g12/"
export GECODE="${SOLVERS_DIRS}/gecode/gecode-inst-dir/bin"
export PICAT="${SOLVERS_DIRS}/picat/Picat"
export HCSP="${SOLVERS_DIRS}/hcsp-1.3.0/hcsp-1.3.0-x86_64"
export CHUFFED="${SOLVERS_DIRS}/chuffed/chuffed-inst-dir/bin"
export IZPLUS="${SOLVERS_DIRS}/iZplus-3.5.0/izC_v3_5_0_linux64/bin"
export ORTOOLS="${SOLVERS_DIRS}/or-tools/or-tools_flatzinc_Ubuntu-16.04-64bit_v6.7.4981/bin"
export JACOP="${SOLVERS_DIRS}/JaCop-4.5.0"
export CHOCO="${SOLVERS_DIRS}/choco"
export MINIZINC="${TOOLS_DIRS}/mzn_inst_dir221/bin"
export OTHER_SRC="${BASE_DIR}/src/other_src"
export TEST_SRC="${BASE_DIR}/src/test_src"

#GUROBI LICENSE CONFIGURATIONS
#export GUROBI=${SOLVERS_DIRS}/gurobi/gurobi801/linux64/bin
#export GRB_LICENSE_FILE=${GUROBI}/gurobi.lic
#export LD_LIBRARY_PATH=${GUROBI}/lib:$LD_LIBRARY_PATH

export LD_LIBRARY_PATH="${SOLVERS_DIRS}/gecode/gecode-inst-dir/lib/":$LD_LIBRARY_PATH
#export PATH_GUROBI="${BASE_DIR}/tool"

function pathappend()
{
  for ARG in "$@"
  do
    if [ -d "$ARG" ] && [[ ":$PATH:" != *":$ARG:"* ]]; then
        PATH="${PATH:+"$PATH:"}$ARG"
    fi
  done
  # credits: Guillaume Perrault-Archambault@superuser.com
}

function pathprepend()
{
  for ((i=$#; i>0; i--));
  do
    ARG=${!i}
    if [ -d "$ARG" ] && [[ ":$PATH:" != *":$ARG:"* ]]; then
        PATH="$ARG${PATH:+":$PATH"}"
    fi
  done
  # credits: Guillaume Perrault-Archambault@superuser.com,
  #          ishmael@superuser.com
}

pathprepend "${OURTOOL}"
pathprepend "${OURTOOL162}"
pathprepend "${G12}"
pathprepend "${GECODE}"
pathprepend "${PICAT}"
pathprepend "${HCSP}"
pathprepend "${CHUFFED}"
pathprepend "${IZPLUS}"
pathprepend "${ORTOOLS}"
pathprepend "${CHOCO}"
pathprepend "${JACOP}"
pathprepend "${MINIZINC}"
pathprepend "${OTHER_SRC}"
echo "Environment LOADED"
chmod +x experiment.sh
chmod +x "$OTHER_SRC"/*.sh
chmod +x "$TEST_SRC"/*.sh
