#!/bin/bash

#
## FUNCTIONS
#
function apply_file () {	# applied over each .mzn file detected
	# src_file=${1} ;
	# has_subdir=${2} ;
	# mzn_only=${3} ;

    if [[ ${2} -eq 0 ]]; then
		#
		## special directory
		#
		shopt -s nullglob
		shopt -s globstar
		for f in $(find . -name "*.dzn")
		do
			# CAVEAT: we assume files in different directories have different names
			dzn_file=`dirname ${1}`"/"${f}
			fzn_file=`echo ${dzn_file} | sed 's#'${SRC_DIR}'#'${FZN_DIR}'#' \
					| sed 's#\.dzn$##'`"_"`basename ${1} | sed 's#\.mzn##'`".fzn"

			test_formula "${1}" "${dzn_file}" "${fzn_file}"

		done
		shopt -u globstar
		shopt -u nullglob
		#
		#
		#
	elif [[ ${3} -eq 0 ]]; then
		#
		## directory with .mzn files only
		#
		fzn_file=`echo ${1} | sed 's#'${SRC_DIR}'#'${FZN_DIR}'#' | sed 's#\.mzn$#\.fzn#'`

		if [[ "${1}" =~ ".model" ]]; then
			echo -e "\tignored:" ${fzn_file} "(model)"
			rm ${fzn_file} 2>/dev/null
            return
		fi

		test_formula "${1}" "" "${fzn_file}"

	else
		#
		## directory with .dzn and .mzn files
		#
		shopt -s nullglob
		for f in *.dzn
		do
			fzn_file=`echo ${1} | sed 's#'${SRC_DIR}'#'${FZN_DIR}'#' \
					| sed 's#\.mzn$##'`"_"`basename ${f} | sed 's#\.dzn##'`".fzn"
			dzn_file=`dirname ${1}`"/"${f}

			test_formula "${1}" "${dzn_file}" "${fzn_file}"

		done
		shopt -u nullglob
		#
		#
		#
	fi
}
function apply_dir () {
    re=${1} ; func=${2} ;
    shift ; shift ;

	echo "Directory "`pwd`" ..."

	test $(( $(find . -maxdepth 1 -type d | wc -l) - 1)) -gt 0
	has_subdir=$? # 0 if has sub-dir, 1 otherwise

    test -n "$(find . -name '*.dzn')"
    mzn_only=$((1 - $?)) # 0 if there are only .mzn files, 1 otherwise

	for file in `ls -A ${re} 2>/dev/null`
	do
		eval '${func} `pwd`/${file} ${@} ${has_subdir} ${mzn_only}'
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
function cp_dirtree () {
	dest_dir=`pwd | sed 's#'${SRC_DIR}'#'${DST_DIR}'#'`
	if [[ ! ( -d ${dest_dir} ) ]]; then
		mkdir ${dest_dir}
	fi
	dest_dir=`pwd | sed 's#'${SRC_DIR}'#'${FZN_DIR}'#'`
	if [[ ! ( -d ${dest_dir} ) ]]; then
		mkdir ${dest_dir}
	fi
}

#
## PROBLEM HANDLERS
#


function test_formula()
{
    formula_count=$((formula_count + 1))

    test_g12 "${@}" "${formula_count}" "std" "fixed"
    test_picat "${@}" "${formula_count}" "std" "cp_std_fixed" "${PATH_PICAT_CP}"
    # WRONG RESULTS ???
    #test_picat "${@}" "${formula_count}" "picat" "cp_picat_fixed" "${PATH_PICAT_CP}"
    test_gecode "${@}" "${formula_count}" "gecode" "fixed"
    test_choco "${@}" "${formula_count}" "choco" "fixed"
    test_izplus "${@}" "${formula_count}" "izplus" "fixed"
    test_chuffed "${@}" "${formula_count}" "chuffed" "fixed"
    test_jacop "${@}" "${formula_count}" "jacop" "fixed"
    test_ortools "${@}" "${formula_count}" "or_tools_cp" "fixed"
    # DOES NOT WORK WITHOUT LICENSE !
    #test_gurobi "${@}" "${formula_count}" "gurobi" "fixed"
    test_hcsp "${@}" "${formula_count}" "hcsp" "fixed"
    test_picat "${@}" "${formula_count}" "picat" "sat_fixed" "${PATH_PICAT_SAT}"
    test_ortools "${@}" "${formula_count}" "or_tools_sat" "fixed"

    test_our_omt_tool "${@}" "${formula_count}" "std" "std-bin-bv-obvbs" \
            -opt.strategy=bin                 \
            -opt.asoft.encoding=car           \
            -opt.fzn.ite_encoding=False       \
            -opt.fzn.bv_integers=True         \
            -opt.theory.bv.engine=obvbs

    test_our_omt_tool "${@}" "${formula_count}" "std" "std-bin-int" \
            -opt.strategy=bin                 \
            -opt.asoft.encoding=car           \
            -opt.fzn.ite_encoding=False       \
            -opt.fzn.bv_integers=False

    return

    # free track: not tested
    test_g12 "${@}" "${formula_count}" "std" "free" --ignore-user-search
    test_picat "${@}" "${formula_count}" "std" "cp_std_free" "${PATH_PICAT_CP}" -f
    test_gecode "${@}" "${formula_count}" "gecode" "free" -f
    test_choco "${@}" "${formula_count}" "choco" "free" -f
    test_izplus "${@}" "${formula_count}" "izplus" "free" -f
    test_chuffed "${@}" "${formula_count}" "chuffed" "free" -f
    test_jacop "${@}" "${formula_count}" "jacop" "free" -f
    test_ortools "${@}" "${formula_count}" "or_tools_cp" "free" -f
    # gurobi ???
    # hcsp: how to use free version?
    test_hcsp "${@}" "${formula_count}" "hcsp" "fixed"
    test_picat "${@}" "${formula_count}" "picat" "sat_free" "${PATH_PICAT_SAT}" -f
    test_ortools "${@}" "${formula_count}" "or_tools_sat" "free" -f
}

###############################################################################
###############################################################################
###############################################################################

function test_mzn2fzn()
{
    local mzn_file="${1}"
    local dzn_file="${2}"
    local fzn_file="${3}"
    local formula_count="${4}"
    local globals="${5}"
    local label="${6}"

	all_mzn2fzn "${1}" "${2}" "${5}" "${3}" "${OVERWRITE}" "${TIMEOUT}"
	local mzn2fzn_ret=$?
}

function test_choco()
{
    local mzn_file="${1}"
    local dzn_file="${2}"
    local fzn_file="${3}"
    local formula_count="${4}"
    local globals="${5}"
    local label="${6}"

	local dst_file=""
	local mzn2fzn_ret=1
	local tool_ret=1

	all_mzn2fzn "${mzn_file}" "${dzn_file}" "${globals}" "${fzn_file}" "${OVERWRITE}" "${TIMEOUT}"
	mzn2fzn_ret=$?

	if (( ! ${mzn2fzn_ret} )); then

		dst_file=$(echo ${all_mzn2fzn} | sed 's#'${FZN_DIR}'#'${DST_DIR}'#' | sed 's#'${globals}'\.fzn#choco_'${label}'\.out#')

		run_choco "${all_mzn2fzn}" "${dst_file}" "${OVERWRITE}" "${TIMEOUT}" ${@:7}
		tool_ret=$?
	fi

	print_statistics \
		"${mzn_file}" "${dzn_file}" "${TIMEOUT}" "${formula_count}" \
		"choco_${label}" "choco"   \
		"${mzn2fzn_ret}" "${all_mzn2fzn}" "${tool_ret}" "${dst_file}" >> "${INIT_DIR}/choco_${label}.out"

#	rm "${all_mzn2fzn}" 2>/dev/null # spare disk space
}

function test_chuffed()
{
    local mzn_file="${1}"
    local dzn_file="${2}"
    local fzn_file="${3}"
    local formula_count="${4}"
    local globals="${5}"
    local label="${6}"

	local dst_file=""
	local mzn2fzn_ret=1
	local tool_ret=1

	all_mzn2fzn "${mzn_file}" "${dzn_file}" "${globals}" "${fzn_file}" "${OVERWRITE}" "${TIMEOUT}"
	mzn2fzn_ret=$?

	if (( ! ${mzn2fzn_ret} )); then

		dst_file=$(echo ${all_mzn2fzn} | sed 's#'${FZN_DIR}'#'${DST_DIR}'#' | sed 's#'${globals}'\.fzn#chuffed_'${label}'\.out#')

		run_chuffed "${all_mzn2fzn}" "${dst_file}" "${OVERWRITE}" "${TIMEOUT}" ${@:7}
		tool_ret=$?
	fi

	print_statistics \
		"${mzn_file}" "${dzn_file}" "${TIMEOUT}" "${formula_count}" \
		"chuffed_${label}" "chuffed"   \
		"${mzn2fzn_ret}" "${all_mzn2fzn}" "${tool_ret}" "${dst_file}" >> "${INIT_DIR}/chuffed_${label}.out"

#	rm "${all_mzn2fzn}" 2>/dev/null # spare disk space
}

function test_g12()
{
    local mzn_file="${1}"
    local dzn_file="${2}"
    local fzn_file="${3}"
    local formula_count="${4}"
    local globals="${5}"
    local label="${6}"

	local dst_file=""
	local mzn2fzn_ret=1
	local tool_ret=1

	all_mzn2fzn "${mzn_file}" "${dzn_file}" "${globals}" "${fzn_file}" "${OVERWRITE}" "${TIMEOUT}"
	mzn2fzn_ret=$?

	if (( ! ${mzn2fzn_ret} )); then

		dst_file=$(echo ${all_mzn2fzn} | sed 's#'${FZN_DIR}'#'${DST_DIR}'#' | sed 's#'${globals}'\.fzn#g12_'${label}'\.out#')

		run_g12 "${all_mzn2fzn}" "${dst_file}" "${OVERWRITE}" "${TIMEOUT}" ${@:7}
		tool_ret=$?
	fi

	print_statistics \
		"${mzn_file}" "${dzn_file}" "${TIMEOUT}" "${formula_count}" \
		"g12_${label}" "g12"   \
		"${mzn2fzn_ret}" "${all_mzn2fzn}" "${tool_ret}" "${dst_file}" >> "${INIT_DIR}/g12_${label}.out"

#	rm "${all_mzn2fzn}" 2>/dev/null # spare disk space
}

function test_gecode()
{
    local mzn_file="${1}"
    local dzn_file="${2}"
    local fzn_file="${3}"
    local formula_count="${4}"
    local globals="${5}"
    local label="${6}"

	local dst_file=""
	local mzn2fzn_ret=1
	local tool_ret=1

	all_mzn2fzn "${mzn_file}" "${dzn_file}" "${globals}" "${fzn_file}" "${OVERWRITE}" "${TIMEOUT}"
	mzn2fzn_ret=$?

	if (( ! ${mzn2fzn_ret} )); then

		dst_file=$(echo ${all_mzn2fzn} | sed 's#'${FZN_DIR}'#'${DST_DIR}'#' | sed 's#'${globals}'\.fzn#gecode_'${label}'\.out#')

		run_gecode "${all_mzn2fzn}" "${dst_file}" "${OVERWRITE}" "${TIMEOUT}" ${@:7}
		tool_ret=$?
	fi

	print_statistics \
		"${mzn_file}" "${dzn_file}" "${TIMEOUT}" "${formula_count}" \
		"gecode_${label}" "gecode"   \
		"${mzn2fzn_ret}" "${all_mzn2fzn}" "${tool_ret}" "${dst_file}" >> "${INIT_DIR}/gecode_${label}.out"

#	rm "${all_mzn2fzn}" 2>/dev/null # spare disk space
}

function test_gurobi()
{
    local mzn_file="${1}"
    local dzn_file="${2}"
    local fzn_file="${3}"
    local formula_count="${4}"
    local globals="${5}"
    local label="${6}"

	local dst_file=""
	local mzn2fzn_ret=1
	local tool_ret=1

	all_mzn2fzn "${mzn_file}" "${dzn_file}" "${globals}" "${fzn_file}" "${OVERWRITE}" "${TIMEOUT}" --solver Gurobi
	mzn2fzn_ret=$?

	if (( ! ${mzn2fzn_ret} )); then

		dst_file=$(echo ${all_mzn2fzn} | sed 's#'${FZN_DIR}'#'${DST_DIR}'#' | sed 's#'${globals}'\.fzn#gurobi_'${label}'\.out#')

		run_gurobi "${all_mzn2fzn}" "${dst_file}" "${OVERWRITE}" "${TIMEOUT}" ${@:7}
		tool_ret=$?
	fi

	print_statistics \
		"${mzn_file}" "${dzn_file}" "${TIMEOUT}" "${formula_count}" \
		"gurobi_${label}" "gurobi"   \
		"${mzn2fzn_ret}" "${all_mzn2fzn}" "${tool_ret}" "${dst_file}" >> "${INIT_DIR}/gurobi_${label}.out"

#	rm "${all_mzn2fzn}" 2>/dev/null # spare disk space
}

function test_hcsp()
{
    local mzn_file="${1}"
    local dzn_file="${2}"
    local fzn_file="${3}"
    local formula_count="${4}"
    local globals="${5}"
    local label="${6}"

	local dst_file=""
	local mzn2fzn_ret=1
	local tool_ret=1

	all_mzn2fzn "${mzn_file}" "${dzn_file}" "${globals}" "${fzn_file}" "${OVERWRITE}" "${TIMEOUT}"
	mzn2fzn_ret=$?

	if (( ! ${mzn2fzn_ret} )); then

		dst_file=$(echo ${all_mzn2fzn} | sed 's#'${FZN_DIR}'#'${DST_DIR}'#' | sed 's#'${globals}'\.fzn#hcsp_'${label}'\.out#')

		run_hcsp "${all_mzn2fzn}" "${dst_file}" "${OVERWRITE}" "${TIMEOUT}" ${@:7}
		tool_ret=$?
	fi

	print_statistics \
		"${mzn_file}" "${dzn_file}" "${TIMEOUT}" "${formula_count}" \
		"hcsp_${label}" "hcsp"   \
		"${mzn2fzn_ret}" "${all_mzn2fzn}" "${tool_ret}" "${dst_file}" >> "${INIT_DIR}/hcsp_${label}.out"

#	rm "${all_mzn2fzn}" 2>/dev/null # spare disk space
}

function test_izplus()
{
    local mzn_file="${1}"
    local dzn_file="${2}"
    local fzn_file="${3}"
    local formula_count="${4}"
    local globals="${5}"
    local label="${6}"

	local dst_file=""
	local mzn2fzn_ret=1
	local tool_ret=1

	all_mzn2fzn "${mzn_file}" "${dzn_file}" "${globals}" "${fzn_file}" "${OVERWRITE}" "${TIMEOUT}"
	mzn2fzn_ret=$?

	if (( ! ${mzn2fzn_ret} )); then

		dst_file=$(echo ${all_mzn2fzn} | sed 's#'${FZN_DIR}'#'${DST_DIR}'#' | sed 's#'${globals}'\.fzn#izplus_'${label}'\.out#')

		run_izplus "${all_mzn2fzn}" "${dst_file}" "${OVERWRITE}" "${TIMEOUT}" ${@:7}
		tool_ret=$?
	fi

	print_statistics \
		"${mzn_file}" "${dzn_file}" "${TIMEOUT}" "${formula_count}" \
		"izplus_${label}" "izplus"   \
		"${mzn2fzn_ret}" "${all_mzn2fzn}" "${tool_ret}" "${dst_file}" >> "${INIT_DIR}/izplus_${label}.out"

#	rm "${all_mzn2fzn}" 2>/dev/null # spare disk space
}

function test_jacop()
{
    local mzn_file="${1}"
    local dzn_file="${2}"
    local fzn_file="${3}"
    local formula_count="${4}"
    local globals="${5}"
    local label="${6}"

	local dst_file=""
	local mzn2fzn_ret=1
	local tool_ret=1

	all_mzn2fzn "${mzn_file}" "${dzn_file}" "${globals}" "${fzn_file}" "${OVERWRITE}" "${TIMEOUT}"
	mzn2fzn_ret=$?

	if (( ! ${mzn2fzn_ret} )); then

		dst_file=$(echo ${all_mzn2fzn} | sed 's#'${FZN_DIR}'#'${DST_DIR}'#' | sed 's#'${globals}'\.fzn#jacop_'${label}'\.out#')

		run_jacop "${all_mzn2fzn}" "${dst_file}" "${OVERWRITE}" "${TIMEOUT}" ${@:7}
		tool_ret=$?
	fi

	print_statistics \
		"${mzn_file}" "${dzn_file}" "${TIMEOUT}" "${formula_count}" \
		"jacop_${label}" "jacop"   \
		"${mzn2fzn_ret}" "${all_mzn2fzn}" "${tool_ret}" "${dst_file}" >> "${INIT_DIR}/jacop_${label}.out"

#	rm "${all_mzn2fzn}" 2>/dev/null # spare disk space
}

function test_mistral()
{
    local mzn_file="${1}"
    local dzn_file="${2}"
    local fzn_file="${3}"
    local formula_count="${4}"
    local globals="${5}"
    local label="${6}"

	local dst_file=""
	local mzn2fzn_ret=1
	local tool_ret=1

	all_mzn2fzn "${mzn_file}" "${dzn_file}" "${globals}" "${fzn_file}" "${OVERWRITE}" "${TIMEOUT}"
	mzn2fzn_ret=$?

	if (( ! ${mzn2fzn_ret} )); then

		dst_file=$(echo ${all_mzn2fzn} | sed 's#'${FZN_DIR}'#'${DST_DIR}'#' | sed 's#'${globals}'\.fzn#mistral_'${label}'\.out#')

		run_mistral "${all_mzn2fzn}" "${dst_file}" "${OVERWRITE}" "${TIMEOUT}" ${@:7}
		tool_ret=$?
	fi

	print_statistics \
		"${mzn_file}" "${dzn_file}" "${TIMEOUT}" "${formula_count}" \
		"mistral_${label}" "mistral"   \
		"${mzn2fzn_ret}" "${all_mzn2fzn}" "${tool_ret}" "${dst_file}" >> "${INIT_DIR}/mistral_${label}.out"

#	rm "${all_mzn2fzn}" 2>/dev/null # spare disk space
}

function test_our_omt_tool()
{
    local mzn_file="${1}"
    local dzn_file="${2}"
    local fzn_file="${3}"
    local formula_count="${4}"
    local globals="${5}"
    local label="${6}"

	local dst_file=""
	local mzn2fzn_ret=1
	local tool_ret=1

	all_mzn2fzn "${mzn_file}" "${dzn_file}" "${globals}" "${fzn_file}" "${OVERWRITE}" "${TIMEOUT}"
	mzn2fzn_ret=$?

	if (( ! ${mzn2fzn_ret} )); then

		dst_file=$(echo ${all_mzn2fzn} | sed 's#'${FZN_DIR}'#'${DST_DIR}'#' | sed 's#'${globals}'\.fzn#our_omt_tool_'${label}'\.out#')

		run_our_omt_tool "${all_mzn2fzn}" "${dst_file}" "${OVERWRITE}" "${TIMEOUT}" ${@:7}
		tool_ret=$?
	fi

	print_statistics \
		"${mzn_file}" "${dzn_file}" "${TIMEOUT}" "${formula_count}" \
		"our_omt_tool_${label}" "our_omt_tool"   \
		"${mzn2fzn_ret}" "${all_mzn2fzn}" "${tool_ret}" "${dst_file}" >> "${INIT_DIR}/our_omt_tool_${label}.out"

#	rm "${all_mzn2fzn}" 2>/dev/null # spare disk space
}

function test_ortools()
{
    local mzn_file="${1}"
    local dzn_file="${2}"
    local fzn_file="${3}"
    local formula_count="${4}"
    local globals="${5}"
    local label="${6}"

	local dst_file=""
	local mzn2fzn_ret=1
	local tool_ret=1

	all_mzn2fzn "${mzn_file}" "${dzn_file}" "${globals}" "${fzn_file}" "${OVERWRITE}" "${TIMEOUT}"
	mzn2fzn_ret=$?

	if (( ! ${mzn2fzn_ret} )); then

		dst_file=$(echo ${all_mzn2fzn} | sed 's#'${FZN_DIR}'#'${DST_DIR}'#' | sed 's#'${globals}'\.fzn#ortools_'${label}'\.out#')

		run_ortools "${all_mzn2fzn}" "${dst_file}" "${OVERWRITE}" "${TIMEOUT}" ${@:7}
		tool_ret=$?
	fi

	print_statistics \
		"${mzn_file}" "${dzn_file}" "${TIMEOUT}" "${formula_count}" \
		"ortools_${label}" "ortools"   \
		"${mzn2fzn_ret}" "${all_mzn2fzn}" "${tool_ret}" "${dst_file}" >> "${INIT_DIR}/ortools_${label}.out"

#	rm "${all_mzn2fzn}" 2>/dev/null # spare disk space
}

function test_picat()
{
    local mzn_file="${1}"
    local dzn_file="${2}"
    local fzn_file="${3}"
    local formula_count="${4}"
    local globals="${5}"
    local label="${6}"

	local dst_file=""
	local mzn2fzn_ret=1
	local tool_ret=1

	all_mzn2fzn "${mzn_file}" "${dzn_file}" "${globals}" "${fzn_file}" "${OVERWRITE}" "${TIMEOUT}"
	mzn2fzn_ret=$?

	if (( ! ${mzn2fzn_ret} )); then

		dst_file=$(echo ${all_mzn2fzn} | sed 's#'${FZN_DIR}'#'${DST_DIR}'#' | sed 's#'${globals}'\.fzn#picat_'${label}'\.out#')

		run_picat "${all_mzn2fzn}" "${dst_file}" "${OVERWRITE}" "${TIMEOUT}" ${@:7}
		tool_ret=$?
	fi

	print_statistics \
		"${mzn_file}" "${dzn_file}" "${TIMEOUT}" "${formula_count}" \
		"picat_${label}" "picat"   \
		"${mzn2fzn_ret}" "${all_mzn2fzn}" "${tool_ret}" "${dst_file}" >> "${INIT_DIR}/picat_${label}.out"

#	rm "${all_mzn2fzn}" 2>/dev/null # spare disk space
}

function test_fzn2smt()
{
    local mzn_file="${1}"
    local dzn_file="${2}"
    local fzn_file="${3}"
    local formula_count="${4}"
    local globals="${5}"
    local label="${6}"

	local dst_file=""
	local mzn2fzn_ret=1
	local tool_ret=1

	all_mzn2fzn "${mzn_file}" "${dzn_file}" "${globals}" "${fzn_file}" "${OVERWRITE}" "${TIMEOUT}"
	mzn2fzn_ret=$?

	if (( ! ${mzn2fzn_ret} )); then

		dst_file=$(echo ${all_mzn2fzn} | sed 's#'${FZN_DIR}'#'${DST_DIR}'#' | sed 's#'${globals}'\.fzn#picat_'${label}'\.out#')

		run_fzn2smt "${all_mzn2fzn}" "${dst_file}" "${OVERWRITE}" "${TIMEOUT}" ${@:7}
		tool_ret=$?
	fi

	print_statistics \
		"${mzn_file}" "${dzn_file}" "${TIMEOUT}" "${formula_count}" \
		"fzn2smt_${label}" "fzn2smt"   \
		"${mzn2fzn_ret}" "${all_mzn2fzn}" "${tool_ret}" "${dst_file}" >> "${INIT_DIR}/fzn2smt_${label}.out"

#	rm "${all_mzn2fzn}" 2>/dev/null # spare disk space
}

###############################################################################
###############################################################################
###############################################################################

function reset_counters()
{
	formula_count=$((0))
}

function load_resources()
{
    source help_functions.sh
}

# ${1} : fzn file
#
function fzn_goal_type()
{
	goal_type=

	if grep -q "^solve.*satisfy" ${1}; then
		goal_type="satisfy";
		return 0;
	fi

	if grep -q "^solve.*minimize" ${1}; then
		goal_type="minimize";
		return 0;
	fi

	if grep -q "^solve.*maximize" ${1}; then
		goal_type="maximize";
		return 0;
	fi

	return 1;
}

## file containing result from time
#
function usr_time()
{
	usr_time="ERROR"

	grep -q "User time (seconds):" ${1} || return 1;

	usr_time=$(grep "User time (seconds):" ${1} | grep -oE "[[:digit:]]+\.[[:digit:]]+")
	return 0;
}

function sys_time()
{
	sys_time="ERROR"

	grep -q "System time (seconds):" ${1} || return 1;

	sys_time=$(grep "System time (seconds):" ${1} | grep -oE "[[:digit:]]+\.[[:digit:]]+")
	return 0;
}

function tot_time()
{
	tot_time="ERROR"

	usr_time ${1} || return 1;
	sys_time ${1} || return 1;

	tot_time=$(python -c "print ${usr_time} + ${sys_time}")
	return 0;
}

function result()
{
    result="ERROR"

    grep -q "=====UNSATISFIABLE=====" ${1} && result="UNSAT"
    grep -q "=====UNBOUNDED=====" ${1}     && result="UNBOUNDED"
    grep -q "=====UNKNOWN=====" ${1}       && result="UNKNOWN"
    grep -q -- "----------" ${1}           && result="SAT"

    [[ "${result}" =~ ERROR ]] && return 1

    return 0;
}

function opt_value()
{
    opt_value="ERROR"

    grep -q "=====UNBOUNDED=====" ${1} && { result="UNBOUNDED"; return 0; };

    opt_value=$(grep "my_optimum_result" ${1} | tail -n 1 | cut -d= -f2 | sed 's/ *//g;s/;//g')
    return 0;
}

## get statistics
# ${1}: mzn file
# ${2}: dzn file
# ${3}: timeout
# ${4}: formula number
# ${5}: configuration group
# ${6}: search tool
# ${7}: mzn2fzn exit status
# ${8}: fzn file
# ${9}: search tool exit status
# ${10}: out file
function print_statistics()
{
	echo -en "${4} : "
	echo -en "${5} : "         # configuration group
	echo -en "${6} : "         # search tool
	echo -en "${7} : "         # mzn2fzn exit status

	tot_time "${8}.err"
	echo -en "${tot_time} : "  # mzn2fzn time

	if (( ! ${7} )); then
		fzn_goal_type "${8}"
		echo -en "${goal_type} : " # goal type (satisfy, minimize, maximize)

		echo -en "${9} : "         # search tool exit status

		tot_time "${10}"
		echo -en "${tot_time} : "  # search tool time
		echo -en "${3} : "         # timeout

		if (( ! ${9} )); then
			result "${10}"
			echo -en "${result} : " # search result (SAT, UNSAT, UNKNOWN, UNBOUNDED)

			if [[ "${goal_type}" =~ (minimize|maximize) ]]; then
				if [[ "${result}" =~ ^SAT$ ]]; then
					opt_value "${10}"
					echo -en "${opt_value} : " # optimum value, if any
				else
					echo -en "na : "
				fi
			else
				echo -en "na : "
			fi
		else
			echo -en "na : na : "
		fi
	else
		echo -en "na : na : na : na : na : na : "
	fi

	echo -en "${1} : "                                        # mzn file
	[[ -n "${2}" ]] && echo -en "${2} : " || echo -en "na : " # dzn file
	echo -en "\n"                                             # newline
}

#
## MAIN
#

## run_main
#	- ${1}: src_dir
#	- ${2}: dst_dir
#	- ${3}: overwrite
#	- ${4}: timeout
#
function run_main ()
{
	reset_counters

	export INIT_DIR=$(pwd)
	export SRC_REG='\*.mzn'
	export SRC_DIR="${1}"
	export DST_DIR="${2}"
	export FZN_DIR="${3}"
	export OVERWRITE="${4}"
	export TIMEOUT="${5}"

	[ "${OVERWRITE}" ] || OVERWRITE="1" ;
	[ "${TIMEOUT}" ]   || TIMEOUT="0" ;

	[[ ! ( -d "${DST_DIR}" ) ]] && mkdir "${DST_DIR}"
	[[ ! ( -d "${FZN_DIR}" ) ]] && mkdir "${FZN_DIR}"

	load_resources

	dirs -c
	apply_rec ${SRC_DIR} cp_dirtree
	apply_rec ${SRC_DIR} apply_dir ${SRC_REG} apply_file
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
	run_main "${@}"
else
	:
fi
