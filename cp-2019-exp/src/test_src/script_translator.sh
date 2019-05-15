#!/bin/bash

#
## SETTINGS
#

SRC_DIR=${1}
BENCHNAME=${2}
SRC_REG='\*.smt2'		# regexp 4 files of interest
SRC_TRANSLATOR="${BASE_DIR}/src/parser_src/our_compiler.py"

function apply_file () {
    src_file=${1} ;
    dst_file=`echo ${src_file} | sed -E 's/(.*)\.smt2/\1.mzn/'`;
    echo "## ---- translating $src_file ---- ##";
    shift;
    if [ "$BENCHNAME" = "symba" ] || [ "$BENCHNAME" = "real_bmc" ]; then
        eval 'time python $SRC_TRANSLATOR --printer_opt 1 --float_domains 1 $src_file $dst_file';
    else
       eval 'time python $SRC_TRANSLATOR --printer_opt 1 $src_file $dst_file';
    fi
}

function apply_dir () {
    re=${1} ; func=${2} ;
    shift ; shift ;

    for file in `ls -A ${re} 2>/dev/null`
    do
        eval '${func} `pwd`/${file} ${@}'
    done

}
function apply_rec () {
    pushd ${1} 1>/dev/null ;
    shift ;

    eval "${@}" ;

    for dir in `ls -d */ 2>/dev/null`
    do
        apply_rec `pwd`/${dir} ${@} ;
    done
    popd 1>/dev/null
}

#function cp_dirtree () {
#	dest_dir=`pwd | sed 's#'${SRC_DIR}'#'${DST_DIR}'#'`
#	if [[ ! ( -d ${dest_dir} ) ]]; then
#		mkdir ${dest_dir}
#	fi
#}

#
## MAIN
#

dirs -c
apply_rec ${SRC_DIR} apply_dir ${SRC_REG} apply_file

