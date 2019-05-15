#!/bin/bash

#
## SETTINGS
#

SRC_DIR=${1}
DST_DIR=${2}
SRC_REG='\*.smt2'		# regexp 4 files of interest

CHOCO_PARSER="$CHOCO/choco-parsers-4.0.4-with-dependencies.jar"
JACOP_PATH="$JACOP/jacop-4.5.0.jar"
PICAT_SAT="$SOLVERS_DIRS/picat/fzn_picat_sat.pi"
PICAT_CP="$SOLVERS_DIRS/picat/fzn_picat_cp.pi"

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
       # g12-mip -> g12fd
       echo "## ---- $path_file_mzn ---- ##" >> "$DST_DIR"/g12_fd.txt;
       echo "### ---- mzn2fzn-g12-fd ---- ###" >> "$DST_DIR"/g12_fd.txt;
       eval "{ /usr/bin/time -v timeout --signal=SIGKILL 10m mzn2fzn -G g12_fd -O- --fzn g12-fd-$file_fzn.fzn $mzn_file  >> $DST_DIR/g12_fd.txt; }  2>>  $DST_DIR/g12_fd.txt";
       echo "### ---- g12-fd ---- ###">> "$DST_DIR"/g12_fd.txt;
       eval "{ /usr/bin/time -v timeout --signal=SIGKILL 10m flatzinc g12-fd-$file_fzn.fzn >> $DST_DIR/g12_fd.txt; } 2>> $DST_DIR/g12_fd.txt";
       # gecode
       echo "## ---- $path_file_mzn ---- ##">> "$DST_DIR"/gecode.txt;
       echo "### ---- mzn2fzn-gecode ---- ###" >>"$DST_DIR"/gecode.txt;
       eval "{ /usr/bin/time -v timeout --signal=SIGKILL 10m mzn2fzn -G gecode-lib-mzn -O- --fzn gecode-$file_fzn.fzn $mzn_file >> $DST_DIR/gecode.txt; } 2>> $DST_DIR/gecode.txt ";
       echo "### ---- gecode ---- ###">> "$DST_DIR"/gecode.txt;
       eval "{ /usr/bin/time -v timeout --signal=SIGKILL 10m fzn-gecode gecode-$file_fzn.fzn >> $DST_DIR/gecode.txt; } 2>> $DST_DIR/gecode.txt";
       # gurobi-lim
       #cp  "$mzn_file" gurobi_mzn_file.mzn;
       #sed -i'' -E 's/var int:/var -1000000..1000000:/g' gurobi_mzn_file.mzn;
       #echo "## ---- $path_file_mzn ---- ##">> "$DST_DIR"/gurobi_lim.txt;
       #echo "### ---- mzn2fzn-gurobi ---- ###">> "$DST_DIR"/gurobi_lim.txt;
       #eval "{ /usr/bin/time -v timeout --signal=SIGKILL 10m mzn2fzn --solver Gurobi -O- --fzn gurobi-lim-$file_fzn.fzn gurobi_mzn_file.mzn >> $DST_DIR/gurobi_lim.txt; } 2>>  $DST_DIR/gurobi_lim.txt";
       #echo "### ---- gurobi ---- ###" >> "$DST_DIR"/gurobi_lim.txt;
       #eval "{ /usr/bin/time -v timeout --signal=SIGKILL 10m minizinc --solver Gurobi gurobi-lim-$file_fzn.fzn >> $DST_DIR/gurobi_lim.txt; } 2>> $DST_DIR/gurobi_lim.txt";
       # gurobi
       #echo "## ---- $path_file_mzn ---- ##">> "$DST_DIR"/gurobi.txt;
       #echo "### ---- mzn2fzn-gurobi ---- ###">> "$DST_DIR"/gurobi.txt;
       #eval "{ /usr/bin/time -v timeout --signal=SIGKILL 10m mzn2fzn --solver Gurobi -O- --fzn gurobi-$file_fzn.fzn gurobi_mzn_file.mzn >> $DST_DIR/gurobi.txt; } 2>>  $DST_DIR/gurobi.txt";
       #echo "### ---- gurobi ---- ###" >> "$DST_DIR"/gurobi.txt;
       #eval "{ /usr/bin/time -v timeout --signal=SIGKILL 10m minizinc --solver Gurobi gurobi-$file_fzn.fzn >> $DST_DIR/gurobi.txt; } 2>> $DST_DIR/gurobi.txt";
       # ourtool
       echo "## ---- $path_file_mzn ---- ##" >> "$DST_DIR"/ourtool_flat.txt;
       echo "### ---- mzn2fzn ---- ###" >> "$DST_DIR"/ourtool_flat.txt;
       eval "{ /usr/bin/time -v timeout --signal=SIGKILL 10m mzn2fzn -O- --fzn ourtool-$file_fzn.fzn $mzn_file >> $DST_DIR/ourtool_flat.txt; } 2>> $DST_DIR/ourtool_flat.txt";
       echo "### ---- ourtool-fzn-opz3 ---- ###" >> "$DST_DIR"/ourtool_flat.txt;
       eval "{ /usr/bin/time -v timeout --signal=SIGKILL 10m ourtool -opt.fzn.bv_integers=False -opt.fzn.ite_encoding=True -input=fzn < ourtool-$file_fzn.fzn >> $DST_DIR/ourtool_flat.txt; } 2>> $DST_DIR/ourtool_flat.txt";
       # or-tools-sat
       echo "## ---- $path_file_mzn ---- ##">> "$DST_DIR"/or_tools.txt;
       echo "### ---- mzn2fzn-or-tools-sat ---- ###" >>"$DST_DIR"/or_tools.txt;
       eval "{ /usr/bin/time -v timeout --signal=SIGKILL 10m mzn2fzn -G ortools_sat -O- --fzn or-tools-sat-$file_fzn.fzn $mzn_file >> $DST_DIR/or_tools.txt; } 2>> $DST_DIR/or_tools.txt ";
       echo "### ---- or-tools-sat ---- ###">> "$DST_DIR"/or_tools.txt;
       eval "{ /usr/bin/time -v timeout --signal=SIGKILL 10m fzn-or-tools or-tools-sat-$file_fzn.fzn >> $DST_DIR/or_tools.txt; } 2>> $DST_DIR/or_tools.txt";
       #or-tools-cp
       echo "### ---- mzn2fzn-or-tools-cp ---- ###" >>"$DST_DIR"/or_tools.txt;
       eval "{ /usr/bin/time -v timeout --signal=SIGKILL 10m mzn2fzn -G ortools_cp -O- --fzn or-tools-cp-$file_fzn.fzn $mzn_file >> $DST_DIR/or_tools.txt; } 2>> $DST_DIR/or_tools.txt ";
       echo "### ---- or-tools-cp ---- ###">> "$DST_DIR"/or_tools.txt;
       eval "{ /usr/bin/time -v timeout --signal=SIGKILL 10m fzn-or-tools or-tools-cp-$file_fzn.fzn >> $DST_DIR/or_tools.txt; } 2>> $DST_DIR/or_tools.txt";
       # picat-sat
       echo "## ---- $path_file_mzn ---- ##">> "$DST_DIR"/picat_sat.txt;
       echo "### ---- mzn2fzn-picat-sat ---- ###" >>"$DST_DIR"/picat_sat.txt;
       eval "{ /usr/bin/time -v timeout --signal=SIGKILL 10m mzn2fzn -G picat-mzn -O- --fzn picat-sat-$file_fzn.fzn $mzn_file >> $DST_DIR/picat_sat.txt; } 2>> $DST_DIR/picat_sat.txt ";
       echo "### ---- picat-sat ---- ###">> "$DST_DIR"/picat_sat.txt;
       eval "{ /usr/bin/time -v timeout --signal=SIGKILL 10m picat $PICAT_SAT picat-sat-$file_fzn.fzn >> $DST_DIR/picat_sat.txt; } 2>> $DST_DIR/picat_sat.txt";
       # JaCoP
       echo "## ---- $path_file_mzn ---- ##">> "$DST_DIR"/jacop.txt;
       echo "### ---- mzn2fzn-jacop ---- ###" >>"$DST_DIR"/jacop.txt;
       eval "{ /usr/bin/time -v timeout --signal=SIGKILL 10m mzn2fzn -G jacop -O- --fzn jacop-$file_fzn.fzn $mzn_file >> $DST_DIR/jacop.txt; } 2>> $DST_DIR/jacop.txt ";
       echo "### ---- jacop ---- ###">> "$DST_DIR"/jacop.txt;
       eval "{ /usr/bin/time -v timeout --signal=SIGKILL 10m  java -Xss10g -cp $JACOP_PATH org.jacop.fz.Fz2jacop jacop-$file_fzn.fzn >> $DST_DIR/jacop.txt; } 2>> $DST_DIR/jacop.txt";
       # iZPlus
       echo "## ---- $path_file_mzn ---- ##">> "$DST_DIR"/izplus.txt;
       echo "### ---- mzn2fzn-izplus ---- ###" >>"$DST_DIR"/izplus.txt;
       eval "{ /usr/bin/time -v timeout --signal=SIGKILL 10m mzn2fzn -G izc -O- --fzn izplus-$file_fzn.fzn $mzn_file >> $DST_DIR/izplus.txt; } 2>> $DST_DIR/izplus.txt ";
       echo "### ---- izplus---- ###">> "$DST_DIR"/izplus.txt;
       eval "{ /usr/bin/time -v timeout --signal=SIGKILL 10m fzn_izplus izplus-$file_fzn.fzn >> $DST_DIR/izplus.txt; } 2>> $DST_DIR/izplus.txt";
       #PicatCP
       echo "## ---- $path_file_mzn ---- ##" >> "$DST_DIR"/picat_cp.txt;
       echo "### ---- mzn2fzn-picat-cp ---- ###" >>"$DST_DIR"/picat_cp.txt;
       eval "{ /usr/bin/time -v timeout --signal=SIGKILL 10m mzn2fzn -G picat-mzn -O- --fzn picat-cp-$file_fzn.fzn $mzn_file >> $DST_DIR/picat_cp.txt; } 2>> $DST_DIR/picat_cp.txt ";
       echo "### ---- picat-cp ---- ###">> "$DST_DIR"/picat_cp.txt;
       eval "{ /usr/bin/time -v timeout --signal=SIGKILL 10m picat $PICAT_CP picat-cp-$file_fzn.fzn >> $DST_DIR/picat_cp.txt; } 2>> $DST_DIR/picat_cp.txt";
       #Choco
       echo "## ---- $path_file_mzn ---- ##" >> "$DST_DIR"/choco.txt;
       echo "### ---- mzn2fzn-choco ---- ###" >> "$DST_DIR"/choco.txt;
       eval "{ /usr/bin/time -v timeout --signal=SIGKILL 10m mzn2fzn -G choco-mzn-lib -O- --fzn choco-$file_fzn.fzn $mzn_file >> $DST_DIR/choco.txt; } 2>> $DST_DIR/choco.txt ";
       echo "### ---- choco ---- ###" >> "$DST_DIR"/choco.txt;
       eval "{ /usr/bin/time -v timeout --signal=SIGKILL 10m  java -cp .:$CHOCO_PARSER org.chocosolver.parser.flatzinc.ChocoFZN  choco-$file_fzn.fzn >> $DST_DIR/choco.txt; } 2>> $DST_DIR/choco.txt ";
       #Chuffed
       echo "## ---- $path_file_mzn ---- ##" >> "$DST_DIR"/chuffed.txt;
       echo "### ---- mzn2fzn-chuffed ---- ###" >> "$DST_DIR"/chuffed.txt;
       eval "{ /usr/bin/time -v timeout --signal=SIGKILL 10m  mzn2fzn -O- --fzn chuffed-$file_fzn.fzn $mzn_file >> $DST_DIR/chuffed.txt; } 2>> $DST_DIR/chuffed.txt ";
       echo "### ---- chuffed ---- ###" >> "$DST_DIR"/chuffed.txt;
       eval "{ /usr/bin/time -v timeout --signal=SIGKILL 10m  fzn-chuffed chuffed-$file_fzn.fzn >> $DST_DIR/chuffed.txt;} 2>> $DST_DIR/chuffed.txt ";
       #Hcsp
       echo "## ---- $path_file_mzn ---- ##" >> "$DST_DIR"/hcsp.txt;
       echo "### ---- mzn2fzn-hcsp ---- ###" >> "$DST_DIR"/hcsp.txt;
       eval "{ /usr/bin/time -v timeout --signal=SIGKILL 10m  mzn2fzn -G hcsplib -O- --fzn hcsp-$file_fzn.fzn $mzn_file >> $DST_DIR/hcsp.txt; } 2>> $DST_DIR/hcsp.txt";
       echo "### ---- hcsp ---- ###" >> "$DST_DIR"/hcsp.txt;
       eval "{ /usr/bin/time -v timeout --signal=SIGKILL 10m  hcsp.big -F fzn hcsp-$file_fzn.fzn >> $DST_DIR/hcsp.txt; } 2>> $DST_DIR/hcsp.txt";


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
