#!/bin/bash

#
## SETTINGS
#

SRC_DIR=${1}
DST_DIR=${2}
SRC_REG='\*.smt2'		# regexp 4 files of interest


function apply_file () {
    smt2_file=${1};
    path_file_mzn=`echo "$smt2_file" | sed -E 's/(.*)\.smt2/\1/'`;
    file_fzn=$(basename "$smt2_file" ".smt2");

    for mzn_file in "$path_file_mzn"_1_b1.mzn
    do
       # ourtool smt2
       echo "## ---- $path_file_mzn ---- ##" >> "$DST_DIR"/ourtool_smt2.txt;
       echo "### ---- ourtool-smt2 ---- ###" >> "$DST_DIR"/ourtool_smt2.txt;
       eval "{ /usr/bin/time -v timeout --signal=SIGKILL 10m ourtool $smt2_file >> $DST_DIR/ourtool_smt2.txt; } 2>> $DST_DIR/ourtool_smt2.txt";
       # g12-mip
       echo "## ---- $path_file_mzn ---- ##" >> "$DST_DIR"/g12_mip.txt;
       echo "### ---- mzn2fzn-g12-mip ---- ###" >> "$DST_DIR"/g12_mip.txt;
       eval "{ /usr/bin/time -v timeout --signal=SIGKILL 10m mzn2fzn -G linear -O- --fzn g12-mip-$file_fzn.fzn $mzn_file  >> $DST_DIR/g12_mip.txt; }  2>>  $DST_DIR/g12_mip.txt";
       echo "### ---- g12-mip ---- ###">> "$DST_DIR"/g12_mip.txt;
       eval "{ /usr/bin/time -v timeout --signal=SIGKILL 10m flatzinc -b mip  g12-mip-$file_fzn.fzn >> $DST_DIR/g12_mip.txt; } 2>> $DST_DIR/g12_mip.txt";
       # gecode
       echo "## ---- $path_file_mzn ---- ##">> "$DST_DIR"/gecode.txt;
       echo "### ---- mzn2fzn-gecode ---- ###" >>"$DST_DIR"/gecode.txt;
       eval "{ /usr/bin/time -v timeout --signal=SIGKILL 10m mzn2fzn -G gecode-lib-mzn -O- --fzn gecode-$file_fzn.fzn $mzn_file >> $DST_DIR/gecode.txt; } 2>> $DST_DIR/gecode.txt ";
       echo "### ---- gecode ---- ###">> "$DST_DIR"/gecode.txt;
       eval "{ /usr/bin/time -v timeout --signal=SIGKILL 10m fzn-gecode gecode-$file_fzn.fzn >> $DST_DIR/gecode.txt; } 2>> $DST_DIR/gecode.txt";
       # gurobi
       #echo "## ---- $path_file_mzn ---- ##">> "$DST_DIR"/gurobi.txt;
       #echo "### ---- mzn2fzn-gurobi ---- ###">> "$DST_DIR"/gurobi.txt;
       #eval "{ /usr/bin/time -v timeout --signal=SIGKILL 10m mzn2fzn --solver Gurobi -O- --fzn gurobi-$file_fzn.fzn $mzn_file >> $DST_DIR/gurobi.txt; } 2>>  $DST_DIR/gurobi.txt";
       #echo "### ---- gurobi ---- ###" >> "$DST_DIR"/gurobi.txt;
       #eval "{ /usr/bin/time -v timeout --signal=SIGKILL 10m minizinc --solver Gurobi gurobi-$file_fzn.fzn >> $DST_DIR/gurobi.txt; } 2>> $DST_DIR/gurobi.txt";
       # ourtool fzn
       echo "## ---- $path_file_mzn ---- ##" >> "$DST_DIR"/ourtool_flat.txt;
       echo "### ---- mzn2fzn ---- ###" >> "$DST_DIR"/ourtool_flat.txt;
       eval "{ /usr/bin/time -v timeout --signal=SIGKILL 10m mzn2fzn -O- --fzn ourtool-$file_fzn.fzn $mzn_file >> $DST_DIR/ourtool_flat.txt; } 2>> $DST_DIR/ourtool_flat.txt";
       echo "### ---- ourtool-fzn-opz3 ---- ###" >> "$DST_DIR"/ourtool_flat.txt;
       eval "{ /usr/bin/time -v timeout --signal=SIGKILL 10m ourtool -opt.fzn.bv_integers=False -opt.fzn.ite_encoding=True -input=fzn < ourtool-$file_fzn.fzn >> $DST_DIR/ourtool_flat.txt; } 2>> $DST_DIR/ourtool_flat.txt";
    done
    shift;
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

#
## MAIN
#
dirs -c
apply_rec ${SRC_DIR} apply_dir ${SRC_REG} apply_file
