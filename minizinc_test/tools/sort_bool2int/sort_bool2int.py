#!/usr/bin/env python3
#!python

"""This module compiles a MiniZinc model into a FlatZinc model."""

import argparse
import fileinput
import io
import os.path
import re
import shutil
import subprocess
import sys
import tempfile

###
### MAIN
###

def main():
    """The main executable."""
    args = get_cmdline_options()
    sort_bool2int_in_fzn_file(args.model)

###
### COMMAND-LINE PARSING
###

def get_cmdline_options():
    """parses and returns input parameters."""
    parser = argparse.ArgumentParser(description="Sorts bool2int constraint in a FlatZinc modelA.")
    parser.add_argument("model", metavar="<model>.fzn", type=str,
                        help="The MiniZinc model", action=check_ext(['fzn']))
    return parser.parse_args()

def check_ext(choices):
    """Checks that the argument extension matches the given list of choices."""
    class Act(argparse.Action): # pylint: disable=too-few-public-methods
        """Act."""
        def __call__(self, parser, namespace, fname, option_string=None):
            """Check that the argument extension matches the given list of choices"""
            ext = os.path.splitext(fname)[1][1:]
            if ext not in choices:
                option_string = '({})'.format(option_string) if option_string else ''
                parser.error("file doesn't end with one of {}{}".format(choices, option_string))
            else:
                setattr(namespace, self.dest, fname)
    return Act

###
### MINIZINC MODEL MANGLING
###

def create_temporary_file(in_file, ext):
    """Creates a temporary file of type 'ext' in the same
    directory as the input argument."""
    dir_name = os.path.dirname(in_file)
    suf = ".{}".format(ext)
    file_desc, tmp_file = tempfile.mkstemp(suffix=suf, dir=dir_name)
    os.close(file_desc)
    return tmp_file

def delete_temporary_file(tmp_file):
    """Deletes a temporary file."""
    os.remove(tmp_file)
    return

###
### FLATZINC MODEL MANGLING
###

def mangle_fzn_file(fzn_file, var_name, name2fval):
    """Associates each fresh floating-point variable with the
    corresponding floating-point division among constant
    numbers [i.e. (NUM / DEN)]."""
    reg_exp = "var .*: ({}_[0-9]+);".format(var_name)
    decls = []
    cs_section = False
    with fileinput.FileInput(fzn_file, inplace=True) as fd_fzn:
        for line in fd_fzn:
            match = re.search(reg_exp, line)
            if match is not None:
                decls.append(match.group(1))
            if not cs_section and line.startswith("constraint"):
                cs_section = True
                for key in decls:
                    values = name2fval[key]
                    print("constraint float_div({}, {}, {});".format(values[0], values[1], key))
            print(line, end='')

def sort_bool2int_in_fzn_file(fzn_file):
    """Reorders bool2int constraints to appear at the beginning of the
    constraints section."""
    tmp_file = create_temporary_file(fzn_file, "fzn")

    with open(tmp_file, "w") as fd_out:
        with open(fzn_file, "r") as fd_in:
            for line in fd_in:
                if line.startswith("constraint"):
                    if "bool2int" in line:
                        fd_out.write(line)
                    else:
                        continue
                elif line.startswith("solve"):
                    continue
                else:
                    fd_out.write(line)
            fd_in.seek(0)
            for line in fd_in:
                if line.startswith("constraint"):
                    if "bool2int" in line:
                        continue
                    else:
                        fd_out.write(line)
                elif line.startswith("solve"):
                    fd_out.write(line)
                else:
                    continue

    shutil.move(tmp_file, fzn_file)

###
###
###

if __name__ == "__main__":
    MIN_PYTHON = (3, 5)
    if sys.version_info < MIN_PYTHON:
        sys.exit("Python %s.%s or later is required.\n" % MIN_PYTHON)

    main()
