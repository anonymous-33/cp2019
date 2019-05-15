#!/bin/bash

OUT_DIR=$1 #output directory for the whole tests replication
export OUT_DIR
TEST_SRC_DIR="${PWD}/src/test_src"
declare -a solver_int=("ourtool_smt2" "ourtool_flat" "g12_fd" "gecode" "izplus" "jacop" "picat_sat" "or_tools" "choco" "picat_cp" "chuffed" "hcsp")
declare -a solver_float=("ourtool_smt2" "ourtool_flat" "g12_mip" "gecode")
declare -a solver_float_ml=("ourtool_smt2" "ourtool_flat" "g12_mip" "gecode" "ourtool_flat_def")


function call_translator {
    eval "$TEST_SRC_DIR/script_translator.sh $1 $2 > $OUT_DIR/translation_times_$2.txt 2>&1";
}

function call_performance_testing {
    if [ "$2" = "symba" ] || [ "$2" = "real_bmc" ] || [ "$2" = "combinatorial" ]; then
        eval "mkdir $BASE_DIR/$OUT_DIR/$2_ris";
        for val in "${solver_float[@]}"; do
            eval "touch $BASE_DIR/$OUT_DIR/$2_ris/$val.txt"
        done;
    elif [ "$2" = "int_bmc" ]; then
        eval "mkdir $BASE_DIR/$OUT_DIR/$2_ris";
        for val in "${solver_int[@]}"; do
            eval "touch $BASE_DIR/$OUT_DIR/$2_ris/$val.txt"
        done;
    else
        eval "mkdir $BASE_DIR/$OUT_DIR/$2_ris";
        for val in "${solver_float_ml[@]}"; do
            eval "touch $BASE_DIR/$OUT_DIR/$2_ris/$val.txt"
        done;
    fi
    eval "$TEST_SRC_DIR/testing_performance_$2.sh $1 $BASE_DIR/$OUT_DIR/$2_ris";
}

function create_plot_table {
    mkdir "$BASE_DIR/$OUT_DIR/PLOT";
    eval "python3 $OTHER_SRC/extract_result.py 1 0 1 $BASE_DIR/$OUT_DIR/machine_learning_ris/ 600"
    eval "python3 $OTHER_SRC/extract_result.py 2 0 1 $BASE_DIR/$OUT_DIR/machine_learning_ris/summary_ris.txt 600 > $BASE_DIR/$OUT_DIR/machine_learning_ris/table.txt"
    eval "python3 $OTHER_SRC/extract_result.py 1 0 1 $BASE_DIR/$OUT_DIR/combinatorial_ris/ 600"
    eval "python3 $OTHER_SRC/extract_result.py 2 0 1 $BASE_DIR/$OUT_DIR/combinatorial_ris/summary_ris.txt 600 > $BASE_DIR/$OUT_DIR/combinatorial_ris/table.txt"
    eval "python3 $OTHER_SRC/extract_result.py 1 1 1 $BASE_DIR/$OUT_DIR/int_bmc_ris/ 600"
    eval "python3 $OTHER_SRC/extract_result.py 2 1 1 $BASE_DIR/$OUT_DIR/int_bmc_ris/summary_ris.txt 600 > $BASE_DIR/$OUT_DIR/int_bmc_ris/table.txt"
    eval "python3 $OTHER_SRC/extract_result.py 1 0 1 $BASE_DIR/$OUT_DIR/real_bmc_ris/ 600"
    eval "python3 $OTHER_SRC/extract_result.py 2 0 1 $BASE_DIR/$OUT_DIR/real_bmc_ris/summary_ris.txt 600 > $BASE_DIR/$OUT_DIR/real_bmc_ris/table.txt"
    eval "python3 $OTHER_SRC/extract_result.py 1 0 1 $BASE_DIR/$OUT_DIR/symba_ris/ 600"
    eval "python3 $OTHER_SRC/extract_result.py 2 0 1 $BASE_DIR/$OUT_DIR/symba_ris/summary_ris.txt 600 > $BASE_DIR/$OUT_DIR/symba_ris/table.txt"


}

function full_test {
    for directory in bench/*
    do
        name_bench=`echo ${directory}|sed -E 's/bench\/(.*)/\1/g'`;
        echo "CALLING THE OMT2MZN PARSER FOR $name_bench"
        call_translator "${PWD}/$directory" "$name_bench"
        echo "TESTING THE PERFORMANCE FOR $name_bench"
        call_performance_testing "${PWD}/$directory" "$name_bench"
    done;
}

#
## MAIN
#

if [[ $# -ne 1 ]]; then
	echo "Error: specify destination directories" 1>&2
	exit
fi
if [[ ! ( -d ${OUT_DIR} ) ]]; then
	mkdir ${OUT_DIR}
	if [[ ! ( -d ${OUT_DIR} ) ]]; then
		echo "Error: unable to create destination directory." 1>&2
		exit
	fi
fi

echo "Monitor RAM"
monitor_ram.sh >> ram_killed.out&
echo "Running TEST"
full_test
create_plot_table
