#!/bin/bash

# TODO: edit this path to the absolute directory path
#       containing this experiment.

export BASE_DIR=".../cp2019/minizinc_test"

##############################################################
##
# CHANGE ONLY IF REALLY NECESSARY
##
##############################################################

# path
export PATH_BIN="${BASE_DIR}/bin"
export PATH_CHOCO="${BASE_DIR}/tools/choco-4.0.4"
export PATH_CHUFFED="${BASE_DIR}/tools/chuffed/bin"
export PATH_FZN2SMT="${BASE_DIR}/tools/fzn2smt-2.0.02"
export PATH_G12="${BASE_DIR}/tools/g12-1.6.0"
export PATH_GECODE="${BASE_DIR}/tools/gecode-6.0.1/bin"
export PATH_HCSP="${BASE_DIR}/tools/hcsp-1.3.0/bin"
export PATH_IZPLUS="${BASE_DIR}/tools/izplus-3.5.0/bin"
export PATH_JACOP="${BASE_DIR}/tools/jacop-4.5.0"
export PATH_MINIZINC="${BASE_DIR}/tools/minizinc-2.2.1/bin"
export PATH_OUR_OMT_TOOL="${BASE_DIR}/tools/our_omt_tool/bin"
export PATH_ORTOOLS="${BASE_DIR}/tools/or-tools-6.7.4981/bin"
export PATH_PICAT="${BASE_DIR}/tools/picat"
export PATH_PICAT_SAT="${BASE_DIR}/tools/picat/fzn_picat_sat.pi"
export PATH_PICAT_CP="${BASE_DIR}/tools/picat/fzn_picat_cp.pi"
export PATH_BOOL2INT="${BASE_DIR}/tools/sort_bool2int"
export PATH_YICES="${BASE_DIR}/tools/yices-2.2.1/bin"
# ld
export LD_PATH_GECODE="${BASE_DIR}/tools/gecode-6.0.1/lib"
# classpath
export CLASSPATH_FZN2SMT="${BASE_DIR}/tools/fzn2smt-2.0.02"
export CLASSPATH_ANTLR="${BASE_DIR}/tools/antlr"
# jar
export JAR_CHOCO="${PATH_CHOCO}/choco-parsers-4.0.4-with-dependencies.jar"
export JAR_JACOP="${PATH_JACOP}/jacop-4.5.0.jar"

##############################################################
##
# DO NOT TOUCH
##
##############################################################

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

function def_colors ()
{
    export GREEN="\\033[1;32m"
    export NORMAL="\\033[0;39m"
    export RED="\\033[1;31m"
    export PINK="\\033[1;35m"
    export BLUE="\\033[1;34m"
    export WHITE="\\033[0;02m"
    export WHITE2="\\033[1;08m"
    export YELLOW="\\033[1;33m"
    export CYAN="\\033[1;36m"
}
def_colors

pathprepend "${PATH_BIN}"
pathprepend "${PATH_CHOCO}"
pathprepend "${PATH_CHUFFED}"
pathprepend "${PATH_FZN2SMT}"
pathprepend "${PATH_G12}"
pathprepend "${PATH_GECODE}"
pathprepend "${PATH_HCSP}"
pathprepend "${PATH_IZPLUS}"
pathprepend "${PATH_JACOP}"
pathprepend "${PATH_MINIZINC}"
pathprepend "${PATH_OUR_OMT_TOOL}"
pathprepend "${PATH_ORTOOLS}"
pathprepend "${PATH_PICAT}"
pathprepend "${PATH_BOOL2INT}"
pathprepend "${PATH_YICES}"

export LD_LIBRARY_PATH="${LD_PATH_GECODE}":"${LD_LIBRARY_PATH}"

export CLASSPATH="${CLASSPATH_FZN2SMT}":"${CLASSPATH_ANTLR}"
