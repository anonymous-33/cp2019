#!/bin/bash

###############################################################################
###############################################################################
###############################################################################

# ARGS:
#  - ${1} : input file
#  - ${2} : output file
#  - ${3} : 1 overwrite, 0 no overwrite
#  - ${4} : timeout (seconds)
#  - ...  : options for solver
#  returns ret

function run_choco ()
{
    local src_file=${1} ;
    local dst_file=${2} ;
    local overwrite=${3} ;
    local timeout=${4} ;

    local tool="choco"
    local msg=""
    local ret=$((0))

    local cmd_line="timeout --signal=SIGKILL \"${timeout}\" /usr/bin/time -v java -Xmx4G -cp \"${PATH_CHOCO}\" org.chocosolver.parser.flatzinc.ChocoFZN ${@:5} \"${src_file}\" 2>\"${dst_file}\" 1>&2"
    if [[ ${overwrite} -eq 1 || ! -f ${dst_file} ]]; then

        timeout --signal=SIGKILL "${timeout}" \
            /usr/bin/time -v \
                java -Xmx4G -cp "${JAR_CHOCO}" org.chocosolver.parser.flatzinc.ChocoFZN "${@:5}" "${src_file}" 2>"${dst_file}" 1>&2
        ret=$?

        get_search_result "${ret}" "${dst_file}"
        ret=$?
        msg="${get_search_result}"
    else
        msg="\t${tool}(${YELLOW}skipped${NORMAL}) ${dst_file}"
    fi

    echo -e "\nEXEC RESULT (status: ${ret}):\n${msg}\n\t~$ ${cmd_line}" >> "${dst_file}"
    echo -e "${msg}"

    run_choco="${dst_file}"
    return "${ret}"
}

function run_chuffed ()
{
    local src_file=${1} ;
    local dst_file=${2} ;
    local overwrite=${3} ;
    local timeout=${4} ;

    local tool="chuffed"
    local msg=""
    local ret=$((0))

    local cmd_line="timeout --signal=SIGKILL \"${timeout}\" /usr/bin/time -v fzn-chuffed ${@:5} \"${src_file}\" 2>\"${dst_file}\" 1>&2"
    if [[ ${overwrite} -eq 1 || ! -f ${dst_file} ]]; then

        timeout --signal=SIGKILL "${timeout}" \
            /usr/bin/time -v \
                fzn-chuffed "${@:5}" "${src_file}" 2>"${dst_file}" 1>&2
        ret=$?

        get_search_result "${ret}" "${dst_file}"
        ret=$?
        msg="${get_search_result}"
    else
        msg="\t${tool}(${YELLOW}skipped${NORMAL}) ${dst_file}"
    fi

    echo -e "\nEXEC RESULT (status: ${ret}):\n${msg}\n\t~$ ${cmd_line}" >> "${dst_file}"
    echo -e "${msg}"

    run_chuffed="${dst_file}"
    return "${ret}"
}

function run_fzn2smt ()
{
    # NOTE: works only with mzn2fzn 1.6.0
    local src_file=${1} ;
    local dst_file=${2} ;
    local overwrite=${3} ;
    local timeout=${4} ;

    local tool="fzn2smt"
    local msg=""
    local ret=$((0))

    local cmd_line="timeout --signal=SIGKILL \"${timeout}\" /usr/bin/time -v java -Xmx4G fzn2smt -ce \"${PATH_YICES}/yices-smt -f\" -i \"${src_file}\" 2>\"${dst_file}\" 1>&2"

    echo ${cmd_line}
    echo "#####"

    if [[ ${overwrite} -eq 1 || ! -f ${dst_file} ]]; then

        timeout --signal=SIGKILL "${timeout}" \
            /usr/bin/time -v \
                java -Xmx4G fzn2smt -ce "${PATH_YICES}/yices-smt -f" -i "${src_file}" 2>"${dst_file}" 1>&2
        ret=$?

        get_search_result "${ret}" "${dst_file}"
        ret=$?
        msg="${get_search_result}"
    else
        msg="\t${tool}(${YELLOW}skipped${NORMAL}) ${dst_file}"
    fi

    echo -e "\nEXEC RESULT (status: ${ret}):\n${msg}\n\t~$ ${cmd_line}" >> "${dst_file}"
    echo -e "${msg}"

    run_fzn2smt="${dst_file}"
    return "${ret}"
}

function run_g12 ()
{
    local src_file=${1} ;
    local dst_file=${2} ;
    local overwrite=${3} ;
    local timeout=${4} ;

    local tool="g12"
    local msg=""
    local ret=$((0))

    local cmd_line="timeout --signal=SIGKILL \"${timeout}\" /usr/bin/time -v flatzinc ${@:5} \"${src_file}\" 2>\"${dst_file}\" 1>&2"
    if [[ ${overwrite} -eq 1 || ! -f ${dst_file} ]]; then

        timeout --signal=SIGKILL "${timeout}" \
            /usr/bin/time -v \
                flatzinc "${@:5}" "${src_file}" 2>"${dst_file}" 1>&2
        ret=$?

        get_search_result "${ret}" "${dst_file}"
        ret=$?
        msg="${get_search_result}"
    else
        msg="\t${tool}(${YELLOW}skipped${NORMAL}) ${dst_file}"
    fi

    echo -e "\nEXEC RESULT (status: ${ret}):\n${msg}\n\t~$ ${cmd_line}" >> "${dst_file}"
    echo -e "${msg}"

    run_g12="${dst_file}"
    return "${ret}"
}

function run_gecode ()
{
    local src_file=${1} ;
    local dst_file=${2} ;
    local overwrite=${3} ;
    local timeout=${4} ;

    local tool="gecode"
    local msg=""
    local ret=$((0))

    local cmd_line="timeout --signal=SIGKILL \"${timeout}\" /usr/bin/time -v fzn-gecode ${@:5} \"${src_file}\" 2>\"${dst_file}\" 1>&2"
    if [[ ${overwrite} -eq 1 || ! -f ${dst_file} ]]; then

        timeout --signal=SIGKILL "${timeout}" \
            /usr/bin/time -v \
                fzn-gecode "${@:5}" "${src_file}" 2>"${dst_file}" 1>&2
        ret=$?

        get_search_result "${ret}" "${dst_file}"
        ret=$?
        msg="${get_search_result}"
    else
        msg="\t${tool}(${YELLOW}skipped${NORMAL}) ${dst_file}"
    fi

    echo -e "\nEXEC RESULT (status: ${ret}):\n${msg}\n\t~$ ${cmd_line}" >> "${dst_file}"
    echo -e "${msg}"

    run_gecode="${dst_file}"
    return "${ret}"
}

function run_gurobi ()
{
    local src_file=${1} ;
    local dst_file=${2} ;
    local overwrite=${3} ;
    local timeout=${4} ;

    local tool="gurobi"
    local msg=""
    local ret=$((0))

    local cmd_line="timeout --signal=SIGKILL \"${timeout}\" /usr/bin/time -v minizinc --solver Gurobi ${@:5} -s \"${src_file}\" 2>\"${dst_file}\" 1>&2"
    if [[ ${overwrite} -eq 1 || ! -f ${dst_file} ]]; then

        timeout --signal=SIGKILL "${timeout}" \
            /usr/bin/time -v \
                minizinc --solver Gurobi "${@:5}" -s "${src_file}" 2>"${dst_file}" 1>&2
        ret=$?

        get_search_result "${ret}" "${dst_file}"
        ret=$?
        msg="${get_search_result}"
    else
        msg="\t${tool}(${YELLOW}skipped${NORMAL}) ${dst_file}"
    fi

    echo -e "\nEXEC RESULT (status: ${ret}):\n${msg}\n\t~$ ${cmd_line}" >> "${dst_file}"
    echo -e "${msg}"

    run_choco="${dst_file}"
    return "${ret}"
}

function run_hcsp ()
{
    local src_file=${1} ;
    local dst_file=${2} ;
    local overwrite=${3} ;
    local timeout=${4} ;

    local tool="hcsp"
    local msg=""
    local ret=$((0))

    local cmd_line="timeout --signal=SIGKILL \"${timeout}\" /usr/bin/time -v hcsp.big -F fzn ${@:5} < \"${src_file}\" 2>\"${dst_file}\" 1>&2"
    if [[ ${overwrite} -eq 1 || ! -f ${dst_file} ]]; then

        timeout --signal=SIGKILL "${timeout}" \
            /usr/bin/time -v \
                hcsp.big -F fzn "${@:5}" < "${src_file}" 2>"${dst_file}" 1>&2
        ret=$?

        get_search_result "${ret}" "${dst_file}"
        ret=$?
        msg="${get_search_result}"
    else
        msg="\t${tool}(${YELLOW}skipped${NORMAL}) ${dst_file}"
    fi

    echo -e "\nEXEC RESULT (status: ${ret}):\n${msg}\n\t~$ ${cmd_line}" >> "${dst_file}"
    echo -e "${msg}"

    run_hcsp="${dst_file}"
    return "${ret}"
}

function run_izplus ()
{
    local src_file=${1} ;
    local dst_file=${2} ;
    local overwrite=${3} ;
    local timeout=${4} ;

    local tool="izplus"
    local msg=""
    local ret=$((0))

    local cmd_line="timeout --signal=SIGKILL \"${timeout}\" /usr/bin/time -v fzn_izplus ${@:5} \"${src_file}\" 2>\"${dst_file}\" 1>&2"
    if [[ ${overwrite} -eq 1 || ! -f ${dst_file} ]]; then

        timeout --signal=SIGKILL "${timeout}" \
            /usr/bin/time -v \
                fzn_izplus "${@:5}" "${src_file}" 2>"${dst_file}" 1>&2
        ret=$?

        get_search_result "${ret}" "${dst_file}"
        ret=$?
        msg="${get_search_result}"
    else
        msg="\t${tool}(${YELLOW}skipped${NORMAL}) ${dst_file}"
    fi

    echo -e "\nEXEC RESULT (status: ${ret}):\n${msg}\n\t~$ ${cmd_line}" >> "${dst_file}"
    echo -e "${msg}"

    run_izplus="${dst_file}"
    return "${ret}"
}

function run_jacop ()
{
    local src_file=${1} ;
    local dst_file=${2} ;
    local overwrite=${3} ;
    local timeout=${4} ;

    local tool="jacop"
    local msg=""
    local ret=$((0))

    local cmd_line="timeout --signal=SIGKILL \"${timeout}\" /usr/bin/time -v java -Xmx4G -cp ${JAR_JACOP} org.jacop.fz.Fz2jacop \"${src_file}\" 2>\"${dst_file}\" 1>&2"
    if [[ ${overwrite} -eq 1 || ! -f ${dst_file} ]]; then

        timeout --signal=SIGKILL "${timeout}" \
            /usr/bin/time -v \
                java -Xmx4G -cp "${JAR_JACOP}" org.jacop.fz.Fz2jacop "${src_file}" 2>"${dst_file}" 1>&2
        ret=$?

        get_search_result "${ret}" "${dst_file}"
        ret=$?
        msg="${get_search_result}"
    else
        msg="\t${tool}(${YELLOW}skipped${NORMAL}) ${dst_file}"
    fi

    echo -e "\nEXEC RESULT (status: ${ret}):\n${msg}\n\t~$ ${cmd_line}" >> "${dst_file}"
    echo -e "${msg}"

    run_jacop="${dst_file}"
    return "${ret}"
}

function run_mistral ()
{
    local src_file=${1} ;
    local dst_file=${2} ;
    local overwrite=${3} ;
    local timeout=${4} ;

    local tool="mistral"
    local msg=""
    local ret=$((0))

    local cmd_line="timeout --signal=SIGKILL \"${timeout}\" /usr/bin/time -v fzn-mistral ${@:5} \"${src_file}\" 2>\"${dst_file}\" 1>&2"
    if [[ ${overwrite} -eq 1 || ! -f ${dst_file} ]]; then

        timeout --signal=SIGKILL "${timeout}" \
            /usr/bin/time -v \
                fzn-mistral "${@:5}" "${src_file}" 2>"${dst_file}" 1>&2
        ret=$?

        get_search_result "${ret}" "${dst_file}"
        ret=$?
        msg="${get_search_result}"
    else
        msg="\t${tool}(${YELLOW}skipped${NORMAL}) ${dst_file}"
    fi

    echo -e "\nEXEC RESULT (status: ${ret}):\n${msg}\n\t~$ ${cmd_line}" >> "${dst_file}"
    echo -e "${msg}"

    run_mistral="${dst_file}"
    return "${ret}"
}

function run_our_omt_tool ()
{
    local src_file=${1} ;
    local dst_file=${2} ;
    local overwrite=${3} ;
    local timeout=${4} ;

    local tool="our_omt_tool"
    local msg=""
    local ret=$((0))

    local cmd_line="timeout --signal=SIGKILL \"${timeout}\" /usr/bin/time -v our_omt_tool ${@:5} < \"${src_file}\" 2>\"${dst_file}\" 1>&2"
    if [[ ${overwrite} -eq 1 || ! -f ${dst_file} ]]; then

        timeout --signal=SIGKILL "${timeout}" \
            /usr/bin/time -v \
                our_omt_tool "${@:5}" < "${src_file}" 2>"${dst_file}" 1>&2
        ret=$?

        get_search_result "${ret}" "${dst_file}"
        ret=$?
        msg="${get_search_result}"
    else
        msg="\t${tool}(${YELLOW}skipped${NORMAL}) ${dst_file}"
    fi

    echo -e "\nEXEC RESULT (status: ${ret}):\n${msg}\n\t~$ ${cmd_line}" >> "${dst_file}"
    echo -e "${msg}"

    run_our_omt_tool="${dst_file}"
    return "${ret}"
}

function run_ortools ()
{
    local src_file=${1} ;
    local dst_file=${2} ;
    local overwrite=${3} ;
    local timeout=${4} ;

    local tool="ortools"
    local msg=""
    local ret=$((0))

    local cmd_line="timeout --signal=SIGKILL \"${timeout}\" /usr/bin/time -v fzn-or-tools ${@:5} \"${src_file}\" 2>\"${dst_file}\" 1>&2"
    if [[ ${overwrite} -eq 1 || ! -f ${dst_file} ]]; then

        timeout --signal=SIGKILL "${timeout}" \
            /usr/bin/time -v \
                fzn-or-tools "${@:5}" "${src_file}" 2>"${dst_file}" 1>&2
        ret=$?

        get_search_result "${ret}" "${dst_file}"
        ret=$?
        msg="${get_search_result}"
    else
        msg="\t${tool}(${YELLOW}skipped${NORMAL}) ${dst_file}"
    fi

    echo -e "\nEXEC RESULT (status: ${ret}):\n${msg}\n\t~$ ${cmd_line}" >> "${dst_file}"
    echo -e "${msg}"

    run_ortools="${dst_file}"
    return "${ret}"
}

function run_picat ()
{
    local src_file=${1} ;
    local dst_file=${2} ;
    local overwrite=${3} ;
    local timeout=${4} ;

    local tool="picat"
    local msg=""
    local ret=$((0))

    local cmd_line="timeout --signal=SIGKILL \"${timeout}\" /usr/bin/time -v picat ${@:5} \"${src_file}\" 2>\"${dst_file}\" 1>&2"
    if [[ ${overwrite} -eq 1 || ! -f ${dst_file} ]]; then

        timeout --signal=SIGKILL "${timeout}" \
            /usr/bin/time -v \
                picat "${@:5}" "${src_file}" 2>"${dst_file}" 1>&2
        ret=$?

        get_search_result "${ret}" "${dst_file}"
        ret=$?
        msg="${get_search_result}"
    else
        msg="\t${tool}(${YELLOW}skipped${NORMAL}) ${dst_file}"
    fi

    echo -e "\nEXEC RESULT (status: ${ret}):\n${msg}\n\t~$ ${cmd_line}" >> "${dst_file}"
    echo -e "${msg}"

    run_picat="${dst_file}"
    return "${ret}"
}

###############################################################################
###############################################################################
###############################################################################

function get_search_result()
{
    local ret=$((${1}))
    local dst_file="${2}"

    # our_omt_tool
    if grep -q "msat error: sat, but with non-linear terms" "${dst_file}"; then
        ret=$((-101)) # force error - our_omt_tool
    elif grep -qi "error: division between two non-constant arguments unsupported" "${dst_file}"; then
        ret=$((-102)) # force error - our_omt_tool
    elif grep -qi "^line:" "${dst_file}"; then
        ret=$((-103)) # force error - catch all for our_omt_tool
    elif grep -qi "error \"unrecognized text" "${dst_file}"; then
        ret=$((-104)) # force error - unsupported formula
    # izplus
    elif grep -qi "error: type error: .* type mismatch in line" "${dst_file}"; then
        ret=$((-111)) # force error - izplus
    elif grep -qi "error: .* not supported" "${dst_file}"; then
        ret=$((-112)) # force error - izplus
    elif grep -qi "error: registry: .* not found in line" "${dst_file}"; then
        ret=$((-113)) # force error - izplus
    # hcsp
    elif grep -qi "<stdin>:.*: .* unsupported" "${dst_file}"; then
        ret=$((-121)) # force error -- hcsp
    elif grep -qi "<stdin>:.*: .* not supported" "${dst_file}"; then
        ret=$((-122)) # force error -- hcsp
    elif grep -qi "parsing failed" "${dst_file}"; then
        ret=$((-123)) # force error -- hcsp
    elif grep -qi "out of range" "${dst_file}"; then
        ret=$((-124)) # force error - hcsp
    # picat
    elif grep -qi "fzn_interpretation_error" "${dst_file}"; then
        ret=$((-131)) # force error - picat sat
    # generic
    elif grep "error" "${dst_file}" | grep -qi "% error:" --invert-match ; then
        ret=$((-151)) # force error
    elif grep -qi "exception" "${dst_file}"; then
        ret=$((-152)) # force error
    fi

    if [[ ${ret} -eq 1 ]] || (( ret < 0 )); then
        get_search_result="\t${tool}(${RED}error${NORMAL}): ${dst_file}"
    elif [[ ${ret} -eq 124 ]]; then
        get_search_result="\t${tool}(${PINK}timeout${NORMAL}): ${dst_file}"
    elif [[ ${ret} -eq 137 ]]; then
        get_search_result="\t${tool}(${CYAN}killed${NORMAL}): ${dst_file}"
    elif [[ ${ret} -eq 139 ]]; then
        get_search_result="\t${tool}(${CYAN}sigsev${NORMAL}): ${dst_file}"
    elif [[ ${ret} -eq 0 ]]; then
        get_search_result="\t${tool}(${GREEN}ok${NORMAL}): ${dst_file}"
    else
        get_search_result="\t${tool}(${BLUE}unknown${NORMAL}): ${dst_file}"
    fi
    return "${ret}"
}

###############################################################################
###############################################################################
###############################################################################

## all_mzn2fzn:
#  - ${1} : mzn file
#  - ${2} : dzn file (optional, "" if not needed)
#  - ${3} : globals directory (optional, "" if not needed)
#  - ${4} : output file
#  - ${5} : 1 overwrite, 0 no overwrite
#  - ${6} : timeout
#  - ...  : options for MZN2FZN
#  returns ret
#
# shellcheck disable=SC2034,SC2124
function all_mzn2fzn ()
{
    all_mzn2fzn=""
    ret=$((0))

    globals="${3}" ;
    dst_file="${4}" ;

    # 1. default globals to std if not provided
    [ "${globals}" ] || globals="std"

    tool="mzn2fzn[${globals}]"

    # 2. get output file for globals group
    get_fzn_plus_globals_output_file "${dst_file}" "${globals}"
    dst_file="${get_fzn_plus_globals_output_file}"

    if [ "${2}" ]; then
        cmd_line="timeout --signal=SIGKILL \"${6}\" /usr/bin/time -v mzn2fzn -O- -G \"${globals}\" --output-to-stdout ${@:7} \"${1}\" \"${2}\" 1>\"${dst_file}\" 2>\"${dst_file}.err\" "
    else
        cmd_line="timeout --signal=SIGKILL \"${6}\" /usr/bin/time -v mzn2fzn -O- -G \"${globals}\" --output-to-stdout ${@:7} \"${1}\" 1>\"${dst_file}\" 2>\"${dst_file}.err\" "
    fi

    if [[ "${5}" -eq 1 || ! -f "${dst_file}" ]]; then

        # 3. print header
        get_header "${1}" "${2}" "${globals}" > "${dst_file}"

        # 4. perform actual conversion
        if [ "${2}" ]; then
            timeout --signal=SIGKILL "${6}" \
                /usr/bin/time -v \
                    mzn2fzn -O- -G "${globals}" --output-to-stdout "${@:7}" "${1}" "${2}" 1>>"${dst_file}" 2>"${dst_file}.err"
        else
            timeout --signal=SIGKILL "${6}" \
                /usr/bin/time -v \
                    mzn2fzn -O- -G "${globals}" --output-to-stdout "${@:7}" "${1}"        1>>"${dst_file}" 2>"${dst_file}.err"
        fi

        ret=$?

        # 5. analyse exit status
        if [[ "${ret}" -eq 1 ]]; then
            msg="\t${tool}(${RED}error${NORMAL}): ${dst_file}"
        elif [[ "${ret}" -eq 124 ]]; then
            msg="\t${tool}(${PINK}timeout${NORMAL}): ${dst_file}"
        elif [[ "${ret}" -eq 137 ]]; then
            msg="\t${tool}(${CYAN}killed${NORMAL}): ${dst_file}"
        elif [[ "${ret}" -eq 139 ]]; then
            msg="\t${tool}(${CYAN}sigsev${NORMAL}): ${dst_file}"
        elif [[ "${ret}" -eq 0 ]]; then
            msg="\t${tool}(${GREEN}ok${NORMAL}): ${dst_file}"
        else
            msg="\t${tool}(${BLUE}unknown${NORMAL}): ${dst_file}"
        fi

        # 6. delete partial files if necessary
        if [[ "${ret}" -ne 0 ]]; then
            rm "${dst_file}" 2>/dev/null
        fi

        force_objective_print "${dst_file}"

    else
        msg="\t${tool}(${YELLOW}skipped${NORMAL}) ${dst_file}"
    fi

    # 7. log
    echo -e "\nEXEC RESULT (status: ${ret}):\n${msg}\n\t~$ ${cmd_line}" >> "${dst_file}.err"
    echo -e "${msg}"

    all_mzn2fzn="${dst_file}"
    return "${ret}"
}

## get_header
#   prints an on-screen message which states which mzn2fzn
#   global directory is being used for conversion
#   - ${1} : mzn file
#   - ${2} : dzn file
#   - ${3} : globals dir name
function get_header ()
{
    echo "% mzn_file: ${1}"
    if [ "${2}" ]; then
        echo "% dzn_file: ${2}"
    fi
    echo "% globals: ${3}"

    return 0;
}

## get_output_file
#   joins original fzn output file destination with
#   globals ID used for conversion
#   - ${1} : original output file
#   - ${2} : globals directory
function get_fzn_plus_globals_output_file ()
{
    get_fzn_plus_globals_output_file=
    fzn_file="${1}"

    if [[ "${1}" =~ ${2}.fzn ]]; then
        # already joined, nothing to do
        :
    else
        fzn_file="${1/.fzn/.${2}.fzn}"
    fi

    get_fzn_plus_globals_output_file="${fzn_file}"

    return 0
}

function force_objective_print()
{
    fzn_file="${1}"
    tmp_file="${1}.tmp"
    new_objective="my_optimum_result"

    grep -q "solve.*satisfy" "${fzn_file}" && return 1;
    grep -q "${new_objective}" "${fzn_file}" && return 0;

    # 1. get objective
    objective=$(grep -oE "(minimize|maximize) .*" "${fzn_file}" | cut -d\  -f2 | sed 's/;//')

    # 2. get line around which split file
    line=$(grep -En "^(constraint|solve)" "${fzn_file}" | cut -d: -f 1 | head -n 1)

    # 3. get type declaration
    if [[ "${objective}" =~ .*\[[[:digit:]]+\] ]]; then
        # array location
        obj="${objective/\[[[:digit:]]*\]/}"
        decl=$(grep -o "of .*[[:space:]]+${obj}[[:space:]]*(::|=|;)" "${fzn_file}" | cut -d: -f 1 | cut -d\  -f2-)
    else
        # normal variable/parameter
        decl=$(grep -E "[[:space:]]+${objective}[[:space:]]*(::|=|;)" "${fzn_file}" | head -n 1 | cut -d: -f 1)
    fi

    if [[ ! "${decl}" =~ var ]]; then
        decl="var ${decl}"
    fi

    # 4. build new file
    head -n $((line - 1)) "${fzn_file}" > "${tmp_file}"
    echo "${decl}: ${new_objective} :: output_var = ${objective};" >> "${tmp_file}"
    tail -n +"${line}" "${fzn_file}" | grep "constraint bool2int" >> "${tmp_file}"          # prioritize bool2int
    tail -n +"${line}" "${fzn_file}" | grep "constraint bool2int" --invert-match >> "${tmp_file}"

    # 5. replace original file
    mv "${tmp_file}" "${fzn_file}"
    return 0;
}

###############################################################################
###############################################################################
###############################################################################
