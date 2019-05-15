import sys
import os
import re
import matplotlib.pyplot as plt
import numpy as np
from matplotlib import cm
import copy


def parse_gurobi(ifile,dict_res,flag_int,type,timeout_bound):
    dict_res[type]={}
    curr_dict=dict_res[type]
    curr_dict["time"]=[]
    curr_dict["ris"]=[]
    with open(ifile) as ffile:
        mzn2fzn_time=0
        solver_time=0
        result=None
        opt_value_regex = re.compile(r"^% opt_var_0") #GUROBI DIFFERENT
        elapsed_time = "Elapsed (wall clock) time (h:mm:ss or m:ss):"
        new_prob_regex = re.compile(r"^## ----")
        flag_mzn2fzn=False
        for line in ffile:
            line=line.strip()
            if new_prob_regex.match(line):
                if (solver_time+mzn2fzn_time)!=float(0):
                    resulting_time = mzn2fzn_time + solver_time
                    if resulting_time >= float(timeout_bound):
                        result="timeout"
                    if result==None:
                        result="error_or_killed"
                    curr_dict["ris"].append(result)
                    curr_dict["time"].append(resulting_time)
                mzn2fzn_time=0
                solver_time=0
                result=None
                flag_mzn2fzn=False
            elif line == "### ---- mzn2fzn-gurobi ---- ###":
                flag_mzn2fzn=True
            elif line == "### ---- gurobi ---- ###":
                flag_mzn2fzn=False
            elif elapsed_time in line:
                time_string = line.split("):")[1].strip()
                time_string_split = time_string.split(":")
                minutes = float(time_string_split[0])*float(60.0)
                seconds = float(time_string_split[1])
                if flag_mzn2fzn:
                    mzn2fzn_time = minutes+seconds
                else:
                    solver_time = minutes+seconds
            elif opt_value_regex.match(line):
                if flag_int:
                    result = int(line.replace(";","").split("=")[1].strip(" "))
                else:
                    tmp_string_ris = line.replace(";","").split("=")[1].strip(" ")
                    if "/" in tmp_string_ris:
                        result =float(eval(tmp_string_ris))
                    else:
                        result = float(tmp_string_ris)
                #print("gurobi",line,result)
            elif "% =====UNSATISFIABLE=====" == line:
                result = "unsat"
            elif "% =====UNSATorUNBOUNDED=====" == line:
                result = "unsat"

        if  (solver_time+mzn2fzn_time)!=float(0):
            resulting_time = mzn2fzn_time + solver_time
            if resulting_time >= float(timeout_bound):
                result="timeout"
            if result==None:
                result="error_or_killed"
            curr_dict["ris"].append(result)
            curr_dict["time"].append(resulting_time)



def parse_izplus(ifile,dict_res,flag_int,timeout_bound):
    dict_res["izplus"]={}
    curr_dict=dict_res["izplus"]
    curr_dict["ris"]=[]
    curr_dict["time"]=[]
    with open(ifile) as ffile:
        mzn2fzn_time=0
        solver_time=0
        result=None
        opt_value_regex = re.compile(r"^opt_var_0")
        elapsed_time = "Elapsed (wall clock) time (h:mm:ss or m:ss):"
        new_prob_regex = re.compile(r"^## ----")
        flag_mzn2fzn=False
        for line in ffile:
            line=line.strip()
            if new_prob_regex.match(line):
                if (solver_time+mzn2fzn_time)!=float(0):
                    resulting_time = mzn2fzn_time + solver_time
                    if resulting_time >= float(timeout_bound):
                        result="timeout"
                    if result==None:
                        result="error_or_killed"
                    curr_dict["ris"].append(result)
                    curr_dict["time"].append(resulting_time)
                mzn2fzn_time=0
                solver_time=0
                result=None
                flag_mzn2fzn=False
            elif line == "### ---- mzn2fzn-izplus ---- ###":
                flag_mzn2fzn=True
            elif line == "### ---- izplus---- ###":
                flag_mzn2fzn=False
            elif elapsed_time in line:
                time_string = line.split("):")[1].strip()
                time_string_split = time_string.split(":")
                minutes = float(time_string_split[0])*float(60.0)
                seconds = float(time_string_split[1])
                if flag_mzn2fzn:
                    mzn2fzn_time = minutes+seconds
                else:
                    solver_time = minutes+seconds
            elif opt_value_regex.match(line):
                if flag_int:
                    result = int(line.replace(";","").split("=")[1].strip(" "))
                else:
                    tmp_string_ris = line.replace(";","").split("=")[1].strip(" ")
                    if "/" in tmp_string_ris:
                        result =float(eval(tmp_string_ris))
                    else:
                        result = float(tmp_string_ris)
                #print("izplus",line,result)
            elif "=====UNSATISFIABLE=====" == line:
                result = "unsat"

        if  (solver_time+mzn2fzn_time)!=float(0):
                resulting_time = mzn2fzn_time + solver_time
                if resulting_time >= float(timeout_bound):
                    result="timeout"
                if result==None:
                    result="error_or_killed"
                curr_dict["ris"].append(result)
                curr_dict["time"].append(resulting_time)

def parse_picat(ifile,dict_res,flag_int,vers,timeout_bound):
    if vers=="sat":
        dict_res["picat-sat"]={}
        curr_dict=dict_res["picat-sat"]
    else:
        dict_res["picat-cp"]={}
        curr_dict=dict_res["picat-cp"]
    curr_dict["ris"]=[]
    curr_dict["time"]=[]
    with open(ifile) as ffile:
        mzn2fzn_time=0
        solver_time=0
        result=None
        opt_value_regex = re.compile(r"^opt_var_0")
        elapsed_time = "Elapsed (wall clock) time (h:mm:ss or m:ss):"
        new_prob_regex = re.compile(r"^## ----")
        flag_mzn2fzn=False
        for line in ffile:
            line=line.strip()
            if new_prob_regex.match(line):
                if (solver_time+mzn2fzn_time)!=float(0):
                    resulting_time = mzn2fzn_time + solver_time
                    if resulting_time >= float(timeout_bound):
                        result="timeout"
                    if result==None:
                        result="error_or_killed"
                    curr_dict["ris"].append(result)
                    curr_dict["time"].append(resulting_time)
                mzn2fzn_time=0
                solver_time=0
                result=None
                flag_mzn2fzn=False
            elif line == "### ---- mzn2fzn-picat-sat ---- ###":
                flag_mzn2fzn=True
            elif line == "### ---- picat-sat ---- ###":
                flag_mzn2fzn=False
            elif elapsed_time in line:
                time_string = line.split("):")[1].strip()
                time_string_split = time_string.split(":")
                minutes = float(time_string_split[0])*float(60.0)
                seconds = float(time_string_split[1])
                if flag_mzn2fzn:
                    mzn2fzn_time = minutes+seconds
                else:
                    solver_time = minutes+seconds
            elif opt_value_regex.match(line):
                if flag_int:
                    result = int(line.replace(";","").split("=")[1].strip(" "))
                else:
                    tmp_string_ris = line.replace(";","").split("=")[1].strip(" ")
                    if "/" in tmp_string_ris:
                        result =float(eval(tmp_string_ris))
                    else:
                        result = float(tmp_string_ris)
                    #print("picat",line,result)
            elif "=====UNSATISFIABLE=====" == line:
                result = "unsat"
        if  (solver_time+mzn2fzn_time)!=float(0):
                resulting_time = mzn2fzn_time + solver_time
                if resulting_time >= float(timeout_bound):
                        result="timeout"
                if result==None:
                    result="error_or_killed"
                curr_dict["ris"].append(result)
                curr_dict["time"].append(resulting_time)

def parse_hcsp(ifile,dict_res,flag_int,timeout_bound):
    dict_res["hcsp"]={}
    curr_dict=dict_res["hcsp"]
    curr_dict["ris"]=[]
    curr_dict["time"]=[]
    with open(ifile) as ffile:
        mzn2fzn_time=0
        solver_time=0
        result=None
        opt_value_regex = re.compile(r"^opt_var_0")
        elapsed_time = "Elapsed (wall clock) time (h:mm:ss or m:ss):"
        new_prob_regex = re.compile(r"^## ----")
        flag_mzn2fzn=False
        for line in ffile:
            line=line.strip()
            if new_prob_regex.match(line):
                if (solver_time+mzn2fzn_time)!=float(0):
                    resulting_time = mzn2fzn_time + solver_time
                    if resulting_time >= float(timeout_bound):
                        result="timeout"
                    if result==None:
                        result="error_or_killed"
                    curr_dict["ris"].append(result)
                    curr_dict["time"].append(resulting_time)
                mzn2fzn_time=0
                solver_time=0
                result=None
                flag_mzn2fzn=False
            elif line == "### ---- mzn2fzn-hcsp ---- ###":
                flag_mzn2fzn=True
            elif line == "### ---- hcsp ---- ###":
                flag_mzn2fzn=False
            elif elapsed_time in line:
                time_string = line.split("):")[1].strip()
                time_string_split = time_string.split(":")
                minutes = float(time_string_split[0])*float(60.0)
                seconds = float(time_string_split[1])
                if flag_mzn2fzn:
                    mzn2fzn_time = minutes+seconds
                else:
                    solver_time = minutes+seconds
            elif opt_value_regex.match(line):
                if flag_int:
                    result = int(line.replace(";","").split("=")[1].strip(" "))
                else:
                    tmp_string_ris = line.replace(";","").split("=")[1].strip(" ")
                    if "/" in tmp_string_ris:
                        result =float(eval(tmp_string_ris))
                    else:
                        result = float(tmp_string_ris)
                #print("jacop",line,result)
            elif "=====UNSATISFIABLE=====" == line:
                result = "unsat"
        if  (solver_time+mzn2fzn_time)!=float(0):
            resulting_time = mzn2fzn_time + solver_time
            if resulting_time >= float(timeout_bound):
                    result="timeout"
            if result==None:
                result="error_or_killed"
            curr_dict["ris"].append(result)
            curr_dict["time"].append(resulting_time)

def parse_choco(ifile,dict_res,flag_int,timeout_bound):
    dict_res["choco"]={}
    curr_dict=dict_res["choco"]
    curr_dict["ris"]=[]
    curr_dict["time"]=[]
    with open(ifile) as ffile:
        mzn2fzn_time=0
        solver_time=0
        result=None
        opt_value_regex = re.compile(r"^opt_var_0")
        elapsed_time = "Elapsed (wall clock) time (h:mm:ss or m:ss):"
        new_prob_regex = re.compile(r"^## ----")
        flag_mzn2fzn=False
        for line in ffile:
            line=line.strip()
            if new_prob_regex.match(line):
                if (solver_time+mzn2fzn_time)!=float(0):
                    resulting_time = mzn2fzn_time + solver_time
                    if resulting_time >= float(timeout_bound):
                        result="timeout"
                    if result==None:
                        result="error_or_killed"
                    curr_dict["ris"].append(result)
                    curr_dict["time"].append(resulting_time)
                mzn2fzn_time=0
                solver_time=0
                result=None
                flag_mzn2fzn=False
            elif line == "### ---- mzn2fzn-choco ---- ###":
                flag_mzn2fzn=True
            elif line == "### ---- choco ---- ###":
                flag_mzn2fzn=False
            elif elapsed_time in line:
                time_string = line.split("):")[1].strip()
                time_string_split = time_string.split(":")
                minutes = float(time_string_split[0])*float(60.0)
                seconds = float(time_string_split[1])
                if flag_mzn2fzn:
                    mzn2fzn_time = minutes+seconds
                else:
                    solver_time = minutes+seconds
            elif opt_value_regex.match(line):
                if flag_int:
                    result = int(line.replace(";","").split("=")[1].strip(" "))
                else:
                    tmp_string_ris = line.replace(";","").split("=")[1].strip(" ")
                    if "/" in tmp_string_ris:
                        result =float(eval(tmp_string_ris))
                    else:
                        result = float(tmp_string_ris)
                #print("jacop",line,result)
            elif "=====UNSATISFIABLE=====" == line:
                result = "unsat"
        if  (solver_time+mzn2fzn_time)!=float(0):
            resulting_time = mzn2fzn_time + solver_time
            if resulting_time >= float(timeout_bound):
                    result="timeout"
            if result==None:
                result="error_or_killed"
            curr_dict["ris"].append(result)
            curr_dict["time"].append(resulting_time)

def parse_chuffed(ifile,dict_res,flag_int,timeout_bound):
    dict_res["chuffed"]={}
    curr_dict=dict_res["chuffed"]
    curr_dict["ris"]=[]
    curr_dict["time"]=[]
    with open(ifile) as ffile:
        mzn2fzn_time=0
        solver_time=0
        result=None
        opt_value_regex = re.compile(r"^opt_var_0")
        elapsed_time = "Elapsed (wall clock) time (h:mm:ss or m:ss):"
        new_prob_regex = re.compile(r"^## ----")
        flag_mzn2fzn=False
        for line in ffile:
            line=line.strip()
            if new_prob_regex.match(line):
                if (solver_time+mzn2fzn_time)!=float(0):
                    resulting_time = mzn2fzn_time + solver_time
                    if resulting_time >= float(timeout_bound):
                        result="timeout"
                    if result==None:
                        result="error_or_killed"
                    curr_dict["ris"].append(result)
                    curr_dict["time"].append(resulting_time)
                mzn2fzn_time=0
                solver_time=0
                result=None
                flag_mzn2fzn=False
            elif line == "### ---- mzn2fzn-chuffed ---- ###":
                flag_mzn2fzn=True
            elif line == "### ---- chuffed ---- ###":
                flag_mzn2fzn=False
            elif elapsed_time in line:
                time_string = line.split("):")[1].strip()
                time_string_split = time_string.split(":")
                minutes = float(time_string_split[0])*float(60.0)
                seconds = float(time_string_split[1])
                if flag_mzn2fzn:
                    mzn2fzn_time = minutes+seconds
                else:
                    solver_time = minutes+seconds
            elif opt_value_regex.match(line):
                if flag_int:
                    result = int(line.replace(";","").split("=")[1].strip(" "))
                else:
                    tmp_string_ris = line.replace(";","").split("=")[1].strip(" ")
                    if "/" in tmp_string_ris:
                        result =float(eval(tmp_string_ris))
                    else:
                        result = float(tmp_string_ris)
                #print("jacop",line,result)
            elif "=====UNSATISFIABLE=====" == line:
                result = "unsat"
        if  (solver_time+mzn2fzn_time)!=float(0):
            resulting_time = mzn2fzn_time + solver_time
            if resulting_time >= float(timeout_bound):
                    result="timeout"
            if result==None:
                result="error_or_killed"
            curr_dict["ris"].append(result)
            curr_dict["time"].append(resulting_time)

def parse_jacop(ifile,dict_res,flag_int,timeout_bound):
    dict_res["jacop"]={}
    curr_dict=dict_res["jacop"]
    curr_dict["ris"]=[]
    curr_dict["time"]=[]
    with open(ifile) as ffile:
        mzn2fzn_time=0
        solver_time=0
        result=None
        opt_value_regex = re.compile(r"^opt_var_0")
        elapsed_time = "Elapsed (wall clock) time (h:mm:ss or m:ss):"
        new_prob_regex = re.compile(r"^## ----")
        flag_mzn2fzn=False
        for line in ffile:
            line=line.strip()
            if new_prob_regex.match(line):
                if (solver_time+mzn2fzn_time)!=float(0):
                    resulting_time = mzn2fzn_time + solver_time
                    if resulting_time >= float(timeout_bound):
                        result="timeout"
                    if result==None:
                        result="error_or_killed"
                    curr_dict["ris"].append(result)
                    curr_dict["time"].append(resulting_time)
                mzn2fzn_time=0
                solver_time=0
                result=None
                flag_mzn2fzn=False
            elif line == "### ---- mzn2fzn-jacop ---- ###":
                flag_mzn2fzn=True
            elif line == "### ---- jacop ---- ###":
                flag_mzn2fzn=False
            elif elapsed_time in line:
                time_string = line.split("):")[1].strip()
                time_string_split = time_string.split(":")
                minutes = float(time_string_split[0])*float(60.0)
                seconds = float(time_string_split[1])
                if flag_mzn2fzn:
                    mzn2fzn_time = minutes+seconds
                else:
                    solver_time = minutes+seconds
            elif opt_value_regex.match(line):
                if flag_int:
                    result = int(line.replace(";","").split("=")[1].strip(" "))
                else:
                    tmp_string_ris = line.replace(";","").split("=")[1].strip(" ")
                    if "/" in tmp_string_ris:
                        result =float(eval(tmp_string_ris))
                    else:
                        result = float(tmp_string_ris)
                #print("jacop",line,result)
            elif "=====UNSATISFIABLE=====" == line:
                result = "unsat"
        if  (solver_time+mzn2fzn_time)!=float(0):
                resulting_time = mzn2fzn_time + solver_time
                if resulting_time >= float(timeout_bound):
                        result="timeout"
                if result==None:
                    result="error_or_killed"
                curr_dict["ris"].append(result)
                curr_dict["time"].append(resulting_time)


def parse_or_tools(ifile,dict_res,flag_int,timeout_bound):
    dict_res["or-tools-cp"]={}
    dict_res["or-tools-sat"]={}
    dict_res["or-tools-sat"]["ris"]=[]
    dict_res["or-tools-sat"]["time"]=[]
    dict_res["or-tools-cp"]["ris"]=[]
    dict_res["or-tools-cp"]["time"]=[]
    dict_list=[dict_res["or-tools-sat"],dict_res["or-tools-cp"]]
    with open(ifile) as ffile:
        mzn2fzn_time=[0]*2
        solver_times=[0]*2
        results=[None]*2
        index=-1
        opt_value_regex = re.compile(r"^opt_var_0")
        elapsed_time = "Elapsed (wall clock) time (h:mm:ss or m:ss):"
        new_prob_regex = re.compile(r"^## ----")
        flag_mzn2fzn=False
        for line in ffile:
            line=line.strip()
            if new_prob_regex.match(line):
                if index==1:
                    for ind in range(len(dict_list)):
                        curr_dict = dict_list[ind]
                        resulting_time = mzn2fzn_time[ind] + solver_times[ind]
                        if resulting_time >= float(timeout_bound):
                            results[ind]="timeout"
                        if results[ind]==None:
                            results[ind] = "error_or_killed"
                        curr_dict["ris"].append(results[ind])
                        curr_dict["time"].append(resulting_time)
                mzn2fzn_time=[0]*2
                solver_times=[0]*2
                results=[None]*2
                index=-1
                flag_mzn2fzn=False
            elif line == "### ---- mzn2fzn-or-tools-sat ---- ###":
                index=0
                flag_mzn2fzn=True
            elif line == "### ---- mzn2fzn-or-tools-cp ---- ###":
                index=1
                flag_mzn2fzn=True
            elif line == "### ---- or-tools-sat ---- ###" or line == "### ---- or-tools-cp ---- ###":
                flag_mzn2fzn=False
            elif elapsed_time in line:
                time_string = line.split("):")[1].strip()
                time_string_split = time_string.split(":")
                minutes = float(time_string_split[0])*float(60.0)
                seconds = float(time_string_split[1])
                if flag_mzn2fzn:
                    mzn2fzn_time[index] = minutes+seconds
                else:
                    solver_times[index] = minutes+seconds
            elif opt_value_regex.match(line):
                if flag_int:
                    result = int(line.replace(";","").split("=")[1].strip(" "))
                else:
                    tmp_string_ris = line.replace(";","").split("=")[1].strip(" ")
                    if "/" in tmp_string_ris:
                        result =float(eval(tmp_string_ris))
                    else:
                        result = float(tmp_string_ris)
                results[index]=result
                #print("or-tools",line,result)
            elif "=====UNSATISFIABLE=====" == line:
                results[index] = "unsat"
        if index==1:
            for ind in range(len(dict_list)):
                curr_dict = dict_list[ind]
                resulting_time = mzn2fzn_time[ind] + solver_times[ind]
                if resulting_time >= float(timeout_bound):
                    results[ind]="timeout"
                if results[ind]==None:
                    results[ind]="error_or_killed"
                curr_dict["ris"].append(results[ind])
                curr_dict["time"].append(resulting_time)



def parse_gecode(ifile,dict_res,flag_int,timeout_bound):
    dict_res["gecode"]={}
    curr_dict=dict_res["gecode"]
    curr_dict["ris"]=[]
    curr_dict["time"]=[]
    with open(ifile) as ffile:
        mzn2fzn_time=0
        solver_time=0
        result = None
        new_prob_regex = re.compile(r"^## ----")
        opt_value_regex = re.compile(r"^opt_var_0")
        flag_mzn2fzn = False
        elapsed_time = "Elapsed (wall clock) time (h:mm:ss or m:ss):"
        for line in ffile:
            line=line.strip()
            if new_prob_regex.match(line):
                #if solver_time!=float(0) and mzn2fzn_time!=float(0): #changing condition
                if (solver_time+mzn2fzn_time)!=float(0):
                    resulting_time = mzn2fzn_time + solver_time
                    if resulting_time >= float(timeout_bound):
                        result="timeout"
                    if result==None:
                        result="error_or_killed"
                    curr_dict["ris"].append(result)
                    curr_dict["time"].append(resulting_time)
                mzn2fzn_time=0
                solver_time=0
                result=None
                flag_mzn2fzn=False
            elif line == "### ---- mzn2fzn-gecode ---- ###":
                flag_mzn2fzn=True
            elif line == "### ---- gecode ---- ###":
                flag_mzn2fzn=False
            elif elapsed_time in line:
                time_string = line.split("):")[1].strip()
                time_string_split = time_string.split(":")
                minutes = float(time_string_split[0])*float(60.0)
                seconds = float(time_string_split[1])
                if flag_mzn2fzn:
                    mzn2fzn_time = minutes+seconds
                else:
                    solver_time = minutes+seconds
            elif opt_value_regex.match(line):
                if flag_int:
                    result = int(line.replace(";","").split("=")[1].strip(" "))
                else:
                    tmp_string_ris = line.replace(";","").split("=")[1].strip(" ")
                    if "/" in tmp_string_ris:
                        result =float(eval(tmp_string_ris))
                    else:
                        result = float(tmp_string_ris)
                #print("gecode",line,result)

            elif "=====UNSATISFIABLE=====" == line:
                result = "unsat"
        #last problem
        if (solver_time+mzn2fzn_time)!=float(0): #changing condition
            resulting_time = mzn2fzn_time + solver_time
            if resulting_time >= float(timeout_bound):
                result="timeout"
            if result==None:
                result="error_or_killed"
            curr_dict["ris"].append(result)
            curr_dict["time"].append(resulting_time)

def parse_g12(ifile,dict_res,version,flag_int,timeout_bound):
    dict_res["g12%s"%version]={}
    curr_dict=dict_res["g12%s"%version]
    curr_dict["ris"]=[]
    curr_dict["time"]=[]
    with open(ifile) as ffile:
        mzn2fzn_time=0
        solver_time=0
        result = None
        opt_value_regex = re.compile(r"^opt_var_0")
        new_prob_regex = re.compile(r"^## ----")
        flag_mzn2fzn = False
        elapsed_time = "Elapsed (wall clock) time (h:mm:ss or m:ss):"
        for line in ffile:
            line=line.strip()
            if new_prob_regex.match(line):
                if (solver_time+mzn2fzn_time)!=float(0):
                    resulting_time = mzn2fzn_time + solver_time
                    if resulting_time >= float(timeout_bound):
                        result="timeout"
                    if result==None:
                        result="error_or_killed"
                    curr_dict["ris"].append(result)
                    curr_dict["time"].append(resulting_time)
                mzn2fzn_time=0
                solver_time=0
                result=None
                flag_mzn2fzn=False
            elif line == "### ---- mzn2fzn-g12-%s ---- ###"%version:
                flag_mzn2fzn=True
            elif line == "### ---- g12-%s ---- ###"%version:
                flag_mzn2fzn=False
            elif elapsed_time in line:
                time_string = line.split("):")[1].strip()
                time_string_split = time_string.split(":")
                minutes = float(time_string_split[0])*float(60.0)
                seconds = float(time_string_split[1])
                if flag_mzn2fzn:
                    mzn2fzn_time = minutes+seconds
                else:
                    solver_time = minutes+seconds
            elif opt_value_regex.match(line):
                if flag_int:
                    result = int(line.replace(";","").split("=")[1].strip(" "))
                else:
                    tmp_string_ris = line.replace(";","").split("=")[1].strip(" ")
                    if "/" in tmp_string_ris:
                        result =float(eval(tmp_string_ris))
                    else:
                        result = float(tmp_string_ris)
                #print("g12",line,result)
            elif "=====UNSATISFIABLE=====" == line:
                result = "unsat"
        #last problem
        if (solver_time+mzn2fzn_time)!=float(0):
            resulting_time = mzn2fzn_time + solver_time
            if resulting_time >= float(timeout_bound):
                result="timeout"
            if result==None:
                result="error_or_killed"
            curr_dict["ris"].append(result)
            curr_dict["time"].append(resulting_time)

#aggiungere infinite symbol
#aggiungere unsat
def parse_ourtool_smt2(ifile,dict_res,flag_int,timeout_bound):
    dict_res["ourtool_smt2"]={}
    curr_dict=dict_res["ourtool_smt2"]
    curr_dict["ris"]=[]
    curr_dict["time"]=[]
    with open(ifile) as ffile:
        new_prob_regex = re.compile(r"^## ----")
        objectives_regex = re.compile(r"^\(objectives")
        neg_division = re.compile(r"\(- \(/ ([0-9]+) ([0-9]+)")
        pos_division = re.compile(r"\(/ ([0-9]+) ([0-9]+)")
        negative_result = re.compile(r"\(- ([0-9]+)")
        positive_result = re.compile(r"([0-9]+)\)")
        bitvector_result = re.compile(r"\(max_val \(_ bv([0-9]+) [0-9]+\)\)")
        solve_time=0
        result=None
        elapsed_time = "Elapsed (wall clock) time (h:mm:ss or m:ss):"
        for line in ffile:
            line=line.strip()
            if new_prob_regex.match(line):
                if solve_time!=float(0):
                    if solve_time>=float(timeout_bound):
                        result="timeout"
                    if result==None:
                        result="error_or_killed"
                    curr_dict["ris"].append(result)
                    curr_dict["time"].append(solve_time)
                result=None
                solve_time=0
                flag_objectives=False
            elif objectives_regex.match(line):
                flag_objectives=True
            elif "(" in line and ")" in line and flag_objectives:
                #parse also (- 40) (- 150)
                #parse also (- (/ ))
                #parse also (())
                neg_match_div = neg_division.search(line)
                pos_match_div = pos_division.search(line)
                neg_res = negative_result.search(line)
                pos_res = positive_result.search(line)
                bv_res = bitvector_result.search(line)
                if "- oo" in line or "oo" in line:
                    result="unbounded"
                elif bv_res:
                    result=int(bv_res.groups(0)[0])
                elif neg_match_div:
                    result = -float(neg_match_div.groups(0)[0])/float(neg_match_div.groups(0)[1])
                elif pos_match_div:
                    result = float(pos_match_div.groups(0)[0])/float(pos_match_div.groups(0)[1])
                elif neg_res:
                    if flag_int:
                        result=-int(neg_res.groups(0)[0])
                    else:
                        result=-float(neg_res.groups(0)[0])
                    #print(line,result)
                elif pos_res:
                    if flag_int:
                        result=int(pos_res.groups(0)[0])
                    else:
                        result=float(pos_res.groups(0)[0])
                    #print("smt2",line,result)
                elif "(cost (+ 0 epsilon))" in line:
                    result= float(0)
                flag_objectives=False
            elif elapsed_time in line:
                time_string = line.split("):")[1].strip()
                time_string_split = time_string.split(":")
                minutes = float(time_string_split[0])*float(60.0)
                seconds = float(time_string_split[1])
                solve_time=minutes+seconds

        #last problem
        if solve_time!=0:
            if solve_time>=float(timeout_bound):
                result="timeout"
            if result==None:
                result="error_or_killed"
            curr_dict["ris"].append(result)
            curr_dict["time"].append(solve_time)


def parse_ourtool_flat(ifile,dict_res,flag_int,flag_opz,timeout_bound,type="default"):
    if type!="default":
        dict_res["ourtool_flat_"+type]={}
        flag_opz=1
    else:
        dict_res["ourtool_flat_opz3"]={}
    list_dict = []
    if flag_opz==0:
        dict_res["ourtool_flat_opz1"]={}
        dict_res["ourtool_flat_opz2"]={}
        dict_res["ourtool_flat_opz4"]={}
        list_dict.append(dict_res["ourtool_flat_opz1"])
        list_dict.append(dict_res["ourtool_flat_opz2"])
        list_dict.append(dict_res["ourtool_flat_opz3"])
        list_dict.append(dict_res["ourtool_flat_opz4"])
    else:
        if type!="default":
            list_dict.append(dict_res["ourtool_flat_"+type])
        else:
            list_dict.append(dict_res["ourtool_flat_opz3"])
    for el in list_dict:
        el["ris"]=[]
        el["time"]=[]
    with open(ifile) as ffile:
        mzn2fzn_time=0
        solver_times=[0]*4
        results=[None]*4
        new_prob_regex = re.compile(r"^## ----")
        opt_value_regex = re.compile(r"^opt_var_0")
        omt_fzn_option = re.compile(r"^### ---- ourtool-fzn-opz[1-4] ---- ###")
        flag_mzn2fzn = False
        elapsed_time = "Elapsed (wall clock) time (h:mm:ss or m:ss):"
        option_index=-1
        flag_epsilon_0 = False
        for line in ffile:
            line=line.strip()
            if new_prob_regex.match(line):
                if option_index==3 and flag_opz==0:
                    for ind in range(4):
                        resulting_time = mzn2fzn_time + solver_times[ind]
                        if resulting_time >= float(timeout_bound):
                            results[ind]="timeout"
                        if results[ind]==None:
                            results[ind]="error_or_killed"
                        list_dict[ind]["ris"].append(results[ind])
                        list_dict[ind]["time"].append(resulting_time)
                elif option_index==-1 and flag_opz==1 and mzn2fzn_time+solver_times[0]!=0:
                    resulting_time = mzn2fzn_time + solver_times[0]
                    if resulting_time >= float(timeout_bound):
                        results[0]="timeout"
                    if results[0]==None:
                        results[0]="error_or_killed"
                    list_dict[0]["ris"].append(results[0])
                    list_dict[0]["time"].append(resulting_time)
                mzn2fzn_time=0
                solver_times=[0]*4
                results=[None]*4
                flag_mzn2fzn=False
                option_index=-1
                flag_epsilon_0=False
            elif line == "### ---- mzn2fzn ---- ###":
                flag_mzn2fzn=True
            elif omt_fzn_option.match(line):
                flag_mzn2fzn=False
                if flag_opz==0:
                    option_index+=1
            elif elapsed_time in line:
                time_string = line.split("):")[1].strip()
                time_string_split = time_string.split(":")
                minutes = float(time_string_split[0])*float(60.0)
                seconds = float(time_string_split[1])
                if flag_mzn2fzn:
                    mzn2fzn_time = minutes+seconds
                else:
                    if flag_opz==0:
                        solver_times[option_index] = minutes+seconds
                    elif flag_opz==1:
                        solver_times[0] = minutes+seconds

            elif "=====UNSATISFIABLE=====" == line:
                result = "unsat"
                if flag_opz==0:
                    results[option_index]=result
                elif flag_opz==1:
                    results[0]=result
            elif "(+ 0 epsilon)" in line:
                flag_epsilon_0=True
            elif opt_value_regex.match(line):
                if flag_int:
                    result = int(line.replace(";","").split("=")[1].strip(" "))
                else:
                    tmp_string_ris = line.replace(";","").split("=")[1].strip(" ")
                    if "/" in tmp_string_ris:
                        result =float(eval(tmp_string_ris))
                    else:
                        result = float(tmp_string_ris)
                if flag_opz==0:
                    if flag_epsilon_0:
                        results[option_index]=float(0)
                    else:
                        results[option_index]=result
                elif flag_opz==1:
                    if flag_epsilon_0:
                        results[0]=float(0)
                    else:
                        results[0]=result


        #last problem
        if option_index==3:
            for ind in range(4):
                resulting_time = mzn2fzn_time + solver_times[ind]
                if resulting_time >= float(timeout_bound):
                    results[ind]="timeout"
                if results[ind]==None:
                    results[ind]="error_or_killed"
                list_dict[ind]["ris"].append(results[ind])
                list_dict[ind]["time"].append(resulting_time)
        elif option_index==-1 and flag_opz==1 and mzn2fzn_time+solver_times[0]!=0:
            resulting_time = mzn2fzn_time + solver_times[0]
            if resulting_time >= float(timeout_bound):
                results[0]="timeout"
            if results[0]==None:
                results[0]="error_or_killed"
            list_dict[0]["ris"].append(results[0])
            list_dict[0]["time"].append(resulting_time)



def create_reduced_file(ris_dir,dict_res,timeout_bound):
    path_ris_file =  os.path.join(str(ris_dir),"","summary_ris.txt")
    file_out = open(path_ris_file,"w")
    #number_problems = len(dict_res["ourtool_smt2"]["ris"])#certified from the
    number_problems = len(dict_res["ourtool_smt2"]["ris"])
    #number_problems = len(dict_res["ourtool_flat_opz1"]["ris"])
    bench_names = ris_dir.strip().split("/")[-2]
    bench_names = bench_names.replace("_ris","")
    print(bench_names)
    file_out.write(bench_names+"\n")
    for ind in range(number_problems):
        make_line=["p"+str(ind)]
        for solver_name in dict_res.keys():
            make_line_solver=[]
            make_line_solver.append(solver_name)
            make_line_solver.append(str(dict_res[solver_name]["ris"][ind]))
            make_line_solver.append(str(dict_res[solver_name]["time"][ind]))
            solver_line=":".join(make_line_solver)
            make_line.append(solver_line)
        file_out.write("#".join(make_line))
        file_out.write("\n")
    file_out.close()

def virtual_best_int(dict_res,fzn_solvers,type):
    vb_timedout=0
    vb_error=0
    vb_cum_times=0
    vb_terminated=0
    for problem_ins in range(len(dict_res["ourtool_smt2"]["time"])): #index for all the problem
        tmp_times=[]
        tmp_timedout=set() #1 se timeout
        tmp_error=set() #1 se error
        for solver in fzn_solvers:
            if solver in dict_res:
                if dict_res[solver]["ris"][problem_ins]=="timeout":
                    tmp_timedout.add(1)
                elif isinstance(dict_res[solver]["ris"][problem_ins],str) and "error" in dict_res[solver]["ris"][problem_ins]:
                    tmp_error.add(1)
                else:
                    tmp_times.append(dict_res[solver]["time"][problem_ins])
                    tmp_error.add(0)
                    tmp_timedout.add(0)
        if len(tmp_timedout)==1 and list(tmp_timedout)[0]==1: #all timedout
            vb_timedout+=1
        elif len(tmp_error)==1 and list(tmp_error)[0]==1: #all error
            vb_error+=1
        elif len(tmp_times)>0:
            vb_terminated+=1
            vb_cum_times+=min(tmp_times)

    print("VB ",type," nprob: ",len(dict_res["ourtool_smt2"]["time"]),"\tnterminated: ",vb_terminated, "\ttimeout: ",vb_timedout, "\terror: ",vb_error, "\tcum times: ",vb_cum_times)

def virtual_best_float(dict_res,fzn_solvers,type):
        vb_timedout=0
        vb_error=0
        vb_terminated=0
        vb_correct=0
        vb_unverified=0
        vb_incorrect=0
        vb_cum_times=0
        for problem_ins in range(len(dict_res["ourtool_smt2"]["time"])): #index for all the problem
            tmp_correct_times=[]
            tmp_unverified_times=[]
            tmp_timedout=set() #1 se timeout
            tmp_error=set() #1 se error
            for solver in fzn_solvers:
                if solver in dict_res:
                    if dict_res[solver]["ris"][problem_ins]=="timeout":
                        tmp_timedout.add(1)
                    elif isinstance(dict_res[solver]["ris"][problem_ins],str) and "error" in dict_res[solver]["ris"][problem_ins]:
                        tmp_error.add(1)
                    else:
                        if solver!="ourtool_smt2":
                            if isinstance(dict_res["ourtool_smt2"]["ris"][problem_ins],float) and isinstance(dict_res[solver]["ris"][problem_ins],float):
                                o_smt2 = dict_res["ourtool_smt2"]["ris"][problem_ins]
                                o_fzn = dict_res[solver]["ris"][problem_ins]
                                if o_smt2==float(0.0):
                                    denominator=float(1)
                                else:
                                    denominator=abs(o_smt2)
                                fraction = abs(o_smt2-o_fzn)/denominator
                                if fraction<pow(10,-6):
                                    tmp_correct_times.append(dict_res[solver]["time"][problem_ins])
                            elif isinstance(dict_res["ourtool_smt2"]["ris"][problem_ins],str) and (dict_res["ourtool_smt2"]["ris"][problem_ins]=="timeout" or "error" in dict_res["ourtool_smt2"]["ris"][problem_ins]):
                                tmp_unverified_times.append(dict_res[solver]["time"][problem_ins])
                        else:
                            tmp_correct_times.append(dict_res[solver]["time"][problem_ins])
                        tmp_error.add(0)
                        tmp_timedout.add(0)
            if len(tmp_timedout)==1 and list(tmp_timedout)[0]==1: #all timedout
                vb_timedout+=1
            elif len(tmp_error)==1 and list(tmp_error)[0]==1: #all error
                vb_error+=1
            elif len(tmp_correct_times)>0:
                vb_terminated+=1
                vb_correct+=1
                vb_cum_times+=min(tmp_correct_times)
            elif len(tmp_unverified_times)>0:
                vb_terminated+=1
                vb_unverified+=1
                vb_cum_times+=min(tmp_unverified_times)
            else:
                vb_terminated+1
                vb_incorrect+=1

        print("VB ",type," nprob:",len(dict_res["ourtool_smt2"]["time"]),"\tterminated: ",vb_terminated, "\ttimeout: ",vb_timedout, "\ttool-error: ",vb_error,"\tcorrect: ",vb_correct,"\tunverified: ",vb_unverified,"\tresult-err: ",vb_incorrect,"\tcum times: ",vb_cum_times)

def create_simple_table(dict_res,flag_int,timeout_bound,bench_name,cact_time):
    print("Results table")
    print("#"*50)
    for solver in dict_res:
        if solver!="ourtool_flat_opz1" and solver!="ourtool_flat_opz2" and solver!="ourtool_flat_opz4":
            number_instances = len(dict_res[solver]["time"])
            number_terminated = len(list(filter(lambda x: isinstance(x, float) or (x=="unsat") or isinstance(x, int) or (x=="unbounded"), dict_res[solver]["ris"])))
            number_timedout = len(list(filter(lambda x: isinstance(x,str) and  x=="timeout", dict_res[solver]["ris"])))
            number_error = len(list(filter(lambda x: isinstance(x,str) and "error" in x, dict_res[solver]["ris"])))

            cum_times=cact_time[solver]
            print(solver,"\t","numb of prob: ",str(number_instances),"\t","terminated: ",str(number_terminated),"\t","timeout: ",str(number_timedout),"\t","tool-errors :",str(number_error),"\t","cum_times: ",cum_times)

    if flag_int==1:
        fzn_solvers=["g12fd","gecode","or-tools-sat","or-tools-cp","choco","chuffed","mistral","picat-sat","picat-cp","izplus","haifa","jacop","gurobi","gurobi_lim"]
        virtual_best_int(dict_res,fzn_solvers,"fzn - no our tool")
        fzn_solvers = fzn_solvers + ["ourtool_flat_opz3"]
        virtual_best_int(dict_res,fzn_solvers,"all fzn")
        fzn_solvers = fzn_solvers + ["ourtool_smt2"]
        virtual_best_int(dict_res,fzn_solvers,"all")
    elif "machine_learning" not in bench_name:
        fzn_solvers=["g12mip","gecode","gurobi"]
        virtual_best_float(dict_res,fzn_solvers,"fzn - no our tool")
        fzn_solvers = fzn_solvers + ["ourtool_flat_opz3"]
        virtual_best_float(dict_res,fzn_solvers,"all fzn")
        fzn_solvers = fzn_solvers + ["ourtool_smt2"]
        virtual_best_float(dict_res,fzn_solvers,"all")
    else:
        fzn_solvers=["g12mip","gecode","gurobi"]
        virtual_best_float(dict_res,fzn_solvers,"fzn - no our tool")
        fzn_solvers = fzn_solvers + ["ourtool_flat_def","ourtool_flat_opz3"]
        virtual_best_float(dict_res,fzn_solvers,"all fzn")
        fzn_solvers = fzn_solvers + ["ourtool_smt2"]
        virtual_best_float(dict_res,fzn_solvers,"all")



def create_error_table(dict_res):
    print("Error Table")
    print("#"*50)
    for el in dict_res:
        if el!="ourtool_smt2" and el!="ourtool_flat_opz1" and el!="ourtool_flat_opz2" and el!="ourtool_flat_opz4":
            count_6,count_3,count_1,count_less,count_eq,count_0,count_p1,count_uns=0,0,0,0,0,0,0,0
            unverified = 0
            for ind in range(len(dict_res["ourtool_smt2"]["ris"])):
                if isinstance(dict_res["ourtool_smt2"]["ris"][ind],float) and isinstance(dict_res[el]["ris"][ind],float):
                    o_smt2 = dict_res["ourtool_smt2"]["ris"][ind]
                    o_fzn = dict_res[el]["ris"][ind]
                    if o_smt2==float(0.0):
                        denominator=float(1)
                    else:
                        denominator=abs(o_smt2)
                    fraction = abs(o_smt2-o_fzn)/denominator
                    if fraction>=pow(10,-6):
                        count_6+=1
                    if fraction>=pow(10,-3):
                        count_3+=1
                    if fraction>=pow(10,-1):
                        count_1+=1
                    if fraction>=pow(10,0):
                        count_0+=1
                    if fraction>=pow(10,1):
                        count_p1+=1
                    if fraction<pow(10,-6):
                        if el!="ourtool_flat_opz3" and el!="ourtool_flat_opz4" and el!="ourtool_flat_opz1" and el!="ourtool_flat_opz2":

                            pass
                        count_less+=1
                    if fraction==float(0.0):
                        count_eq+=1

                if dict_res[el]["ris"][ind]=="unsat" and isinstance(dict_res["ourtool_smt2"]["ris"][ind],float):
                    if el=="ourtool_flat_opz3":

                            pass
                    count_uns+=1
                if (dict_res[el]["ris"][ind]=="unsat" or isinstance(dict_res[el]["ris"][ind],float)) and dict_res["ourtool_smt2"]["ris"][ind]=="timeout":
                    unverified+=1
            print(el,"10^-6 :",count_6,"\t10^-3 :",count_3,"\t10^-1 :",count_1,"\t10^0 :",count_0,"\t10^1 :",count_p1,"\tunsat :",count_uns,"\tless:",count_less,"\teq",count_eq,"\tunve: ",unverified)

def generate_scatter_plots(dict_res,bench_name,flag_int,timeout_bound):

    for el in dict_res:
        if el!="ourtool_smt2"  and el!="ourtool_flat_opz1" and el!="ourtool_flat_opz2" and el!="ourtool_flat_opz4":
            args={}
            len_data = len(dict_res[el]["ris"])
            y_axis=copy.copy(dict_res["ourtool_smt2"]["time"])
            x_axis=copy.copy(dict_res[el]["time"])
            z_color=[0.0]*len_data
            if flag_int==False:
                for index in range(len_data): #TODO:
                    if isinstance(dict_res["ourtool_smt2"]["ris"][index],float) and isinstance(dict_res[el]["ris"][index],float):
                        o_smt2 = dict_res["ourtool_smt2"]["ris"][index]
                        o_fzn = dict_res[el]["ris"][index]
                        if o_smt2==float(0.0):
                            denominator=float(1)
                        else:
                            denominator=abs(o_smt2)
                        fraction = abs(o_smt2-o_fzn)/denominator
                        if fraction>=pow(10,-6):
                            z_color[index]=0.5
                    #if (dict_res["ourtool_smt2"]["ris"][index]=="unbounded" and dict_res[el]["ris"][index]!="unbounded") or \
                    #    (dict_res["ourtool_smt2"]["ris"][index]!="unbounded" and dict_res[el]["ris"][index]=="unbounded"):
                    #    z_color[index]=0.5
                    if dict_res["ourtool_smt2"]["ris"][index]=="unsat" and dict_res[el]["ris"][index]=="unsat":
                        z_color[index]=0.65
                    elif (dict_res["ourtool_smt2"]["ris"][index]=="unsat" and dict_res[el]["ris"][index]!="unsat") or \
                        (dict_res["ourtool_smt2"]["ris"][index]!="unsat" and dict_res[el]["ris"][index]=="unsat"):
                        z_color[index]=0.5
                    if isinstance(dict_res["ourtool_smt2"]["ris"][index],str) and "error" in dict_res["ourtool_smt2"]["ris"][index]:
                        y_axis[index]=1000.0
                    if isinstance(dict_res[el]["ris"][index],str) and "error" in dict_res[el]["ris"][index]:
                        x_axis[index]=1000.0
            else:
                for index in range(len_data):
                    if isinstance(dict_res["ourtool_smt2"]["ris"][index],int) and isinstance(dict_res[el]["ris"][index],int):
                        o_smt2 = dict_res["ourtool_smt2"]["ris"][index]
                        o_fzn = dict_res[el]["ris"][index]
                        if o_smt2 != o_fzn:
                            z_color[index]=0.5
                    if dict_res["ourtool_smt2"]["ris"][index]=="unsat" and dict_res[el]["ris"][index]=="unsat":
                        z_color[index]=0.65
                    elif (dict_res["ourtool_smt2"]["ris"][index]=="unsat" and dict_res[el]["ris"][index]!="unsat") or \
                        (dict_res["ourtool_smt2"]["ris"][index]!="unsat" and dict_res[el]["ris"][index]=="unsat"):
                        z_color[index]=0.5
                    if isinstance(dict_res["ourtool_smt2"]["ris"][index],str) and "error" in dict_res["ourtool_smt2"]["ris"][index]:
                        y_axis[index]=1000.0
                    if isinstance(dict_res[el]["ris"][index],str)  and "error" in dict_res[el]["ris"][index]:
                        x_axis[index]=1000.0
            args["z"]=z_color
            args["y"]=y_axis
            args["x"]=x_axis
            args["y_label"]=pretty_labels("ourtool_smt2")+" (s)"
            args["x_label"]=pretty_labels(el)+" (s)"
            args["file_name"]="ourtool_smt2_"+el+"_"+bench_name
            plots_dir=os.environ['BASE_DIR']+"/"+os.environ['OUT_DIR']+"/PLOT"
            plot_xyz(plots_dir,args,timeout_bound)

    #FZN vs FZN

    if flag_int==False:
        for el in dict_res:
            if el!="ourtool_smt2" and el!="ourtool_flat_opz3" and el!="ourtool_flat_opz1" and el!="ourtool_flat_opz2" and el!="ourtool_flat_opz4":
                args={}
                len_data = len(dict_res[el]["ris"])
                y_axis=copy.copy(dict_res["ourtool_flat_opz3"]["time"])
                x_axis=copy.copy(dict_res[el]["time"])
                z_color=[0.0]*len_data

                for index in range(len_data):
                    if isinstance(dict_res["ourtool_smt2"]["ris"][index],float):
                        if isinstance(dict_res[el]["ris"][index],float):
                            o_smt2 = dict_res["ourtool_smt2"]["ris"][index]
                            o_fzn = dict_res[el]["ris"][index]
                            if o_smt2==float(0.0):
                                denominator=float(1)
                            else:
                                denominator=abs(o_smt2)
                            fraction1= abs(o_smt2-o_fzn)/denominator
                        if isinstance(dict_res["ourtool_flat_opz3"]["ris"][index],float):
                            o_smt2 = dict_res["ourtool_smt2"]["ris"][index]
                            o_fzn = dict_res["ourtool_flat_opz3"]["ris"][index]
                            if o_smt2==float(0.0):
                                denominator=float(1)
                            else:
                                denominator=abs(o_smt2)
                            fraction2= abs(o_smt2-o_fzn)/denominator
                        if isinstance(dict_res["ourtool_flat_opz3"]["ris"][index],float) and isinstance(dict_res[el]["ris"][index],float):
                            if fraction1>=pow(10,-6) and fraction2>=pow(10,-6):
                                z_color[index]=0.5
                            elif fraction1>=pow(10,-6):
                                z_color[index]=0.75
                            elif fraction2>=pow(10,-6):
                                z_color[index]=0.40
                        elif dict_res["ourtool_flat_opz3"]["ris"][index]=="unsat" and dict_res[el]["ris"][index]=="unsat":
                            z_color[index]=0.5
                        elif isinstance(dict_res["ourtool_flat_opz3"]["ris"][index],float)  and dict_res[el]["ris"][index]=="unsat":
                            if fraction2>=pow(10,-6):
                                z_color[index]=0.5
                            else:
                                z_color[index]=0.75
                        elif dict_res["ourtool_flat_opz3"]["ris"][index]=="unsat"  and isinstance(dict_res[el]["ris"][index],float):
                            if fraction1>=pow(10,-6):
                                z_color[index]=0.5
                            else:
                                z_color[index]=0.40
                    elif dict_res["ourtool_smt2"]["ris"][index]=="unsat":
                        if dict_res["ourtool_flat_opz3"]["ris"][index]!="unsat" and dict_res[el]["ris"][index]=="unsat":
                            z_color[index]=0.40
                        elif  dict_res["ourtool_flat_opz3"]["ris"][index]=="unsat" and dict_res[el]["ris"][index]!="unsat":
                            z_color[index]=0.75
                    elif dict_res["ourtool_smt2"]["ris"][index]=="timeout":
                        z_color[index]=0.25
                    if isinstance(dict_res["ourtool_flat_opz3"]["ris"][index],str) and "error" in dict_res["ourtool_flat_opz3"]["ris"][index]:
                        y_axis[index]=1000.0
                    if isinstance(dict_res[el]["ris"][index],str) and "error" in dict_res[el]["ris"][index]:
                        x_axis[index]=1000.0


                args["z"]=z_color
                args["y"]=y_axis
                args["x"]=x_axis
                args["y_label"]=pretty_labels("ourtool_flat_opz3")+" (s)"
                args["x_label"]=pretty_labels(el)+" (s)"
                args["file_name"]="ourtool_flat_"+el+"_"+bench_name
                plots_dir=os.environ['BASE_DIR']+"/"+os.environ['OUT_DIR']+"/PLOT"
                plot_xyz(plots_dir, args,timeout_bound)

    else:
        for el in dict_res:
            if el!="ourtool_smt2" and el!="ourtool_flat_opz3" and el!="ourtool_flat_opz1" and el!="ourtool_flat_opz2" and el!="ourtool_flat_opz4":
                for candidate in ["ourtool_flat_opz3"]:
                    args={}
                    len_data = len(dict_res[el]["ris"])
                    y_axis=copy.copy(dict_res[candidate]["time"])
                    x_axis=copy.copy(dict_res[el]["time"])
                    z_color=[0.0]*len_data
                    for index in range(len_data):
                        if isinstance(dict_res[candidate]["ris"][index],int) and isinstance(dict_res[el]["ris"][index],int):
                            o_smt2 = dict_res[candidate]["ris"][index]
                            o_fzn = dict_res[el]["ris"][index]
                            if o_smt2 != o_fzn:
                                z_color[index]=0.5
                        elif isinstance(dict_res[candidate]["ris"][index],str) and "error" in dict_res[candidate]["ris"][index]:
                            y_axis[index]=1000.0
                        elif isinstance(dict_res[el]["ris"][index],str)  and "error" in dict_res[el]["ris"][index]:
                            x_axis[index]=1000.0
                        elif dict_res[candidate]["ris"][index]=="unsat" and dict_res[el]["ris"][index]=="unsat":
                            z_color[index]=0.65
                        elif (dict_res[candidate]["ris"][index]=="unsat" and dict_res[el]["ris"][index]!="unsat") or \
                            (dict_res[candidate]["ris"][index]!="unsat" and dict_res[el]["ris"][index]=="unsat"):
                            z_color[index]=0.5
                    args["z"]=z_color
                    args["y"]=y_axis
                    args["x"]=x_axis
                    args["y_label"]=pretty_labels(candidate)+" (s)"
                    args["x_label"]=pretty_labels(el)+" (s)"
                    args["file_name"]=candidate+"_"+el+"_"+bench_name
                    plots_dir=os.environ['BASE_DIR']+"/"+os.environ['OUT_DIR']+"/PLOT"
                    plot_xyz(plots_dir,args,timeout_bound)



def generate_cactus_plots_float(dict_res,bench_name,timeout_bound):
    data_cactus=[]
    cact_time={}
    len_data = len(dict_res["ourtool_smt2"]["ris"])
    for el in dict_res:
        data_cactus.append({})
        data_cactus[-1]["config"]=pretty_labels(el)
        tmp_list=[]
        if el=="ourtool_smt2":
            tmp_list=sorted([dict_res["ourtool_smt2"]["time"][index] for index in range(len_data) if dict_res["ourtool_smt2"]["time"][index] < timeout_bound])
        elif el!="ourtool_flat_opz1" and el!="ourtool_flat_opz2" and el!="ourtool_flat_opz4":
            tmp_list=[]
            for index in range(len_data):
                if isinstance(dict_res["ourtool_smt2"]["ris"][index],float) and isinstance(dict_res[el]["ris"][index],float):
                    o_smt2 = dict_res["ourtool_smt2"]["ris"][index]
                    o_fzn = dict_res[el]["ris"][index]
                    if o_smt2==float(0.0):
                        denominator=float(1)
                    else:
                        denominator=abs(o_smt2)
                    fraction = abs(o_smt2-o_fzn)/denominator
                    if fraction<pow(10,-6):
                        tmp_list.append(dict_res[el]["time"][index])
                elif dict_res["ourtool_smt2"]["ris"]=="unsat" and dict_res[el]["ris"]=="unsat":
                    tmp_list.append(dict_res[el]["time"][index])
                elif (dict_res[el]["ris"][index]=="unsat" or isinstance(dict_res[el]["ris"][index],float)) and dict_res["ourtool_smt2"]["ris"][index]=="timeout":
                    tmp_list.append(dict_res[el]["time"][index])
        if tmp_list:
            tmp_list.sort()
            tmp_list_cum=[tmp_list[0]]
            for c_el in tmp_list[1:]:
                tmp_list_cum.append(tmp_list_cum[-1]+c_el)
            data_cactus[-1]["cum_times"]=tmp_list_cum
            data_cactus[-1]["max"]=max(data_cactus[-1]["cum_times"])
            cact_time[el]=data_cactus[-1]["cum_times"][-1]

        else:
            del data_cactus[-1]
            cact_time[el]=0
    #virtual_best
    data_cactus.append({})
    data_cactus[-1]["config"]="Virtual Best"
    tmp_list=[]
    for index in range(len_data):
        t_list=[]
        for el in dict_res:
            if el!="ourtool_smt2" and el!="ourtool_flat_opz1" and el!="ourtool_flat_opz2" and el!="ourtool_flat_opz4":
                if isinstance(dict_res["ourtool_smt2"]["ris"][index],float) and isinstance(dict_res[el]["ris"][index],float):
                    o_smt2 = dict_res["ourtool_smt2"]["ris"][index]
                    o_fzn = dict_res[el]["ris"][index]
                    if o_smt2==float(0.0):
                        denominator=float(1)
                    else:
                        denominator=abs(o_smt2)
                    fraction = abs(o_smt2-o_fzn)/denominator
                    if fraction<pow(10,-6):
                        t_list.append(dict_res[el]["time"][index])
                elif dict_res["ourtool_smt2"]["ris"]=="unsat" and dict_res[el]["ris"]=="unsat":
                    t_list.append(dict_res[el]["time"][index])
                elif (dict_res[el]["ris"][index]=="unsat" or isinstance(dict_res[el]["ris"][index],float)) and dict_res["ourtool_smt2"]["ris"][index]=="timeout":
                    t_list.append(dict_res[el]["time"][index])
            elif el=="ourtool_smt2":
                if dict_res["ourtool_smt2"]["time"][index] < timeout_bound:
                    t_list.append(dict_res["ourtool_smt2"]["time"][index])
        if t_list:
            tmp_list.append(min(t_list))
    if tmp_list:
        tmp_list.sort()
        tmp_list_cum=[tmp_list[0]]
        for c_el in tmp_list[1:]:
            tmp_list_cum.append(tmp_list_cum[-1]+c_el)
        data_cactus[-1]["cum_times"]=tmp_list_cum
        data_cactus[-1]["max"]=max(data_cactus[-1]["cum_times"])

    else:
        del data_cactus[-1]
    data_cactus=sorted(data_cactus,key=lambda k:(-len(k["cum_times"]),max(k["cum_times"])))
    #special case:
    if len(data_cactus)>1 and data_cactus[1]["config"]=="Virtual Best":
        data_cactus[1],data_cactus[0]=data_cactus[0],data_cactus[1]
    plot_cactus_plot("","solved instances","times (s)",data_cactus,timeout_bound,"cactus_plot_"+bench_name)
    return cact_time

def generate_cactus_plots_int(dict_res,bench_name,timeout_bound):
    data_cactus=[]
    cact_time={}
    for el in dict_res:
        data_cactus.append({})
        data_cactus[-1]["config"]=pretty_labels(el)
        tmp_list=[]
        if el=="ourtool_smt2":
            tmp_list=sorted([x for x in dict_res[el]["time"] if x<timeout_bound])
        elif el!="ourtool_flat_opz1" and el!="ourtool_flat_opz2" and el!="ourtool_flat_opz4":
            #tmp_list=sorted([dict_res[el]["time"][index] for index in range(len(dict_res[el]["time"])) if dict_res[el]["time"][index]<timeout_bound and dict_res[el]["ris"][index]!="error_or_killed"])
            for index in range(len(dict_res["ourtool_smt2"]["time"])):
                if dict_res["ourtool_smt2"]["ris"][index]!="timeout" and  dict_res[el]["ris"][index]!="error_or_killed" and dict_res["ourtool_smt2"]["ris"][index]==dict_res[el]["ris"][index]:
                    tmp_list.append(dict_res[el]["time"][index])
                elif dict_res["ourtool_smt2"]["ris"][index]=="timeout" and dict_res[el]["ris"][index]!="error_or_killed" and dict_res[el]["ris"][index]!="timeout":
                    tmp_list.append(dict_res[el]["time"][index])
                elif dict_res["ourtool_smt2"]["ris"][index]!="timeout" and dict_res[el]["ris"][index]!="error_or_killed" and dict_res[el]["ris"][index]!="timeout" and dict_res["ourtool_smt2"]["ris"][index]!=dict_res[el]["ris"][index]:
                    pass
        if tmp_list:
            tmp_list_cum=[tmp_list[0]]
            for c_el in tmp_list[1:]:
                tmp_list_cum.append(tmp_list_cum[-1]+c_el)
            #tmp_list_cum=[tmp_list[0]]+[tmp_list[i-1]+tmp_list[i] for i in range(1,len(tmp_list))]
            data_cactus[-1]["cum_times"]=tmp_list_cum
            data_cactus[-1]["max"]=max(data_cactus[-1]["cum_times"])
            cact_time[el]=data_cactus[-1]["cum_times"][-1]
            #print("Cactus plot data cum_times ",el," time ",int(data_cactus[-1]["cum_times"][-1])," number prob ",len(data_cactus[-1]["cum_times"]))
        else:
            cact_time[el]=0
            del data_cactus[-1]
    #virtual_best
    data_cactus.append({})
    data_cactus[-1]["config"]="Virtual Best"
    tmp_list=[]
    maximum_length=len(dict_res["ourtool_smt2"]["time"])
    for i in range(0,maximum_length):
        t_list=[dict_res[el]["time"][i] for el in dict_res if dict_res[el]["time"][i]<timeout_bound and dict_res[el]["ris"][i]!="error_or_killed" and el!="ourtool_flat_opz1" and el!="ourtool_flat_opz2" and el!="ourtool_flat_opz4"]
        if t_list:
            tmp_list.append(min(t_list))
    if tmp_list:
        tmp_list.sort()
        tmp_list_cum=[tmp_list[0]]
        for c_el in tmp_list[1:]:
            tmp_list_cum.append(tmp_list_cum[-1]+c_el)
        data_cactus[-1]["cum_times"]=tmp_list_cum
        data_cactus[-1]["max"]=max(data_cactus[-1]["cum_times"])
        #print("Cactus plot data cum_times VB"," time ",int(data_cactus[-1]["cum_times"][-1])," number prob ",len(data_cactus[-1]["cum_times"]))
    else:
        del data_cactus[-1]
    data_cactus=sorted(data_cactus,key=lambda k:(-len(k["cum_times"]),max(k["cum_times"])))
    if  len(data_cactus)>1 and data_cactus[1]["config"]=="Virtual Best" :
        data_cactus[1],data_cactus[0]=data_cactus[0],data_cactus[1]

    plot_cactus_plot("","solved instances","times (s)",data_cactus,timeout_bound,"cactus_plot_"+bench_name)
    return cact_time

def parse_ris_file(ris_dir,flag_int,flag_opz,timeout_bound):
    dict_res={}
    path_ris =  os.path.join(str(ris_dir),"")
    for subdir, dirs, files in os.walk(path_ris):
        for file in files:
            os.path.join(subdir, file)
            if file=="gecode.txt":
                parse_gecode(os.path.join(subdir, file),dict_res,flag_int,timeout_bound)
            if file=="g12_mip.txt":
                parse_g12(os.path.join(subdir, file),dict_res,"mip",False,timeout_bound)
            if file=="g12_fd.txt":
                parse_g12(os.path.join(subdir, file),dict_res,"fd",flag_int,timeout_bound)
            if file=="ourtool_smt2.txt":
                parse_ourtool_smt2(os.path.join(subdir, file),dict_res,flag_int,timeout_bound)
            if file=="ourtool_flat.txt":
                parse_ourtool_flat(os.path.join(subdir, file),dict_res,flag_int,flag_opz,timeout_bound)
            if file=="ourtool_flat_sort.txt":
                parse_ourtool_flat(os.path.join(subdir, file),dict_res,flag_int,flag_opz,timeout_bound,type="sort")
            if file=="ourtool_flat_def.txt":
                parse_ourtool_flat(os.path.join(subdir, file),dict_res,flag_int,flag_opz,timeout_bound,type="def")
            if file=="or_tools.txt":
                parse_or_tools(os.path.join(subdir, file),dict_res,flag_int,timeout_bound)
            if file=="jacop.txt":
                parse_jacop(os.path.join(subdir, file),dict_res,flag_int,timeout_bound)
            if file=="izplus.txt":
                parse_izplus(os.path.join(subdir, file),dict_res,flag_int,timeout_bound)
            if file=="picat_sat.txt":
                parse_picat(os.path.join(subdir, file),dict_res,flag_int,"sat",timeout_bound)
            if file=="picat_cp.txt":
                parse_picat(os.path.join(subdir, file),dict_res,flag_int,"cp",timeout_bound)
            if file=="gurobi.txt":
                parse_gurobi(os.path.join(subdir, file),dict_res,flag_int,"gurobi",timeout_bound)
            if file=="chuffed.txt":
                parse_chuffed(os.path.join(subdir, file),dict_res,flag_int,timeout_bound)
            if file=="gurobi_lim.txt":
                parse_gurobi(os.path.join(subdir, file),dict_res,flag_int,"gurobi_lim",timeout_bound)
            if file=="hcsp.txt":
                parse_hcsp(os.path.join(subdir, file),dict_res,flag_int,timeout_bound)
            if file=="choco.txt":
                parse_choco(os.path.join(subdir, file),dict_res,flag_int,timeout_bound)


    #assert_property of the read files
    lengths=[len(dict_res[x]["time"]) for x in dict_res]
    assert(len(set(lengths))==1)
    for el in dict_res:
        assert(len(dict_res[el]["ris"])==len(dict_res[el]["time"]))
        assert(len([dict_res[el]["ris"][ind] for ind in range(len(dict_res[el]["ris"])) if dict_res[el]["ris"][ind]==None])==0)
        for ind in range(len(dict_res[el]["ris"])):
            assert(((dict_res[el]["ris"][ind]=="timeout") and (dict_res[el]["time"][ind]>=float(timeout_bound))\
                    or ((dict_res[el]["ris"][ind]!="timeout") and (dict_res[el]["time"][ind]<float(timeout_bound)))))
    create_reduced_file(ris_dir,dict_res,timeout_bound)


def parse_time_translation(ifile):
    with open(ifile,'r') as ffile:
        timings=[]
        real_regex = re.compile(r"[0-9]+m[0-9]+\.[0-9]+s")
        for line in ffile:
            line=line.strip()
            if "real" in line and real_regex.findall(line):
                time=0
                tmp_time=line.split("\t")[1]
                tmp_time1=tmp_time.split("m")
                time+=(int(tmp_time1[0])*60)+(float(tmp_time1[1].strip("s")))
                timings.append(time)
    print("n inst :",len(timings),"min :",min(timings),"max :",max(timings),"sum :",sum(timings),"avg :",sum(timings)/len(timings))

def create_plot_table(ifile,flag_int,timeout_bound):
    bench_name=""
    dict_res={}
    with open(ifile) as ffile:
        bench_name = ffile.readline().strip()
        for line in ffile:
            line=line.strip()
            solvers_ris=line.split("#")[1:]
            skipline=False
            for solv in solvers_ris:
                solvers_ris_in = solv.split(":")
                if solvers_ris_in[0] not in dict_res:
                    dict_res[solvers_ris_in[0]]={}
                    dict_res[solvers_ris_in[0]]["ris"]=[]
                    dict_res[solvers_ris_in[0]]["time"]=[]

                dict_res[solvers_ris_in[0]]["time"].append(float(solvers_ris_in[2]))
                if solvers_ris_in[1]!="timeout" and solvers_ris_in[1]!="unsat" and "error" not in solvers_ris_in[1] and solvers_ris_in[1]!="unbounded":
                    if flag_int:
                        dict_res[solvers_ris_in[0]]["ris"].append(int(solvers_ris_in[1]))
                    else:
                        dict_res[solvers_ris_in[0]]["ris"].append(float(solvers_ris_in[1]))
                else:
                    dict_res[solvers_ris_in[0]]["ris"].append(solvers_ris_in[1])
                if solvers_ris_in[0]=="ourtool_smt2" and solvers_ris_in[1]=="unbounded":
                    skipline=True
            if skipline:
                for solv in dict_res:
                    del dict_res[solv]["ris"][-1]
                    del dict_res[solv]["time"][-1]



    if flag_int==False:
        create_error_table(dict_res)
    #generate_plots
    generate_scatter_plots(dict_res,bench_name,flag_int,timeout_bound)

    if flag_int:
        cact_time=generate_cactus_plots_int(dict_res,bench_name,timeout_bound)
    else:
        cact_time=generate_cactus_plots_float(dict_res,bench_name,timeout_bound)

    create_simple_table(dict_res,flag_int,timeout_bound,bench_name,cact_time)


def plot_xyz(plots_dir, args,timeout_bound):

    TIMEOUT_TIME=timeout_bound
    ERROR_TIME=1000.0
    axis_font = {'fontname' : 'Arial', 'size':'16', 'weight':'bold'}
    #colors    = ('b', 'g', 'r', 'c', 'm', 'y', 'k', 'w')

    fig = plt.figure()
    plot = fig.add_subplot(111)

    plot.tick_params(axis='both', which='minor', labelsize=14)
    plot.tick_params(axis='both', which='major', labelsize=14)

    plot.axvline(x=TIMEOUT_TIME, color='r', zorder=3, linestyle='--')
    plot.axhline(y=TIMEOUT_TIME, color='r', zorder=3, linestyle='--')
    plot.axvline(x=ERROR_TIME, color='b', zorder=3, linestyle='--')
    plot.axhline(y=ERROR_TIME, color='b', zorder=3, linestyle='--')

    c = np.arange(0, TIMEOUT_TIME, 0.1)
    plot.plot(c, c, c='r', zorder=3, linestyle='--')
    for i in range(0, len(args["z"])):
        if args["x"][i] >= TIMEOUT_TIME or args["y"][i] >= TIMEOUT_TIME:
            args["z"][i] = 1.0


    '''
    if args["x_label"]=="g12mip" + " (s)" and args["y_label"]=="ourtool_flat (s)":

    '''


    scat = plot.scatter(args["x"], args["y"], c=args["z"],cmap=plt.get_cmap("brg"), marker='x', linewidth=1, s=150, zorder=2,vmin=0.0,vmax=1.0)
    cb=fig.colorbar(scat, orientation='vertical') # unbounded density bar
    cb.remove()


    plot.grid(True)
    plt.xlim([0.01, ERROR_TIME*1.2])
    plt.ylim([0.01, ERROR_TIME*1.2])

    plot.set_title("", **axis_font)
    plot.set_ylabel(args["y_label"], **axis_font)
    plot.set_yscale('log')
    plot.set_xlabel(args["x_label"], **axis_font)
    plot.set_xscale('log')
    plot.set_aspect('equal')

    plt.tight_layout()
    file_name="%s/%s.pdf" % (plots_dir, args["file_name"])
    plt.savefig(file_name, bbox_inches='tight')
    file_name="%s/%s.png" % (plots_dir, args["file_name"])
    plt.savefig(file_name, bbox_inches='tight')
    plt.close(fig)

def plot_cactus_plot(title, x_label, y_label, data, timeout, file_name):
    axis_font = {'fontname' : 'Arial', 'size':'12', 'weight':'bold'}
    #colors    = ('b', 'g', 'r', 'c', 'm', 'y', 'k', 'w')
    num_keys  = len(data)
    cmap      = plt.get_cmap('brg')
    #cmap = plt.cm.get_cmap('nipy_spectral',10)
    #cmap = plt.cm.nipy_spectral
    colors    = [cmap(i) for i in np.linspace(0, 1, num_keys)]
    #styles    = ('--', '-.', '-', ':')
    styles    = ('--', '-.', ':',)

    fig = plt.figure()
    ax = fig.add_subplot(1, 1, 1)

    idx = 0
    max_y = 0
    for config_data in data:
        y = config_data["cum_times"]
        x = np.arange(1, len(y) + 1)
        if "ofpbs" in config_data["config"]:
            pass
        if "omt" in config_data["config"]:
            pass
        if "Virtual Best" in config_data["config"]:
            ax.plot(x, y,'-.',marker=None,label=config_data["config"],color='b', linewidth=1.1)
        elif "ourtool(SMT)" in config_data["config"]:
            ax.plot(x, y,'--',marker=None,label=config_data["config"],color='r', linewidth=1.1)

        else:
            ax.plot(x, y, styles[idx % len(styles)],marker=None,label=config_data["config"],color=colors[idx], linewidth=1.1)
        idx += 1
        if config_data["max"] > max_y:
            max_y = config_data["max"]

    ax.grid(True)
    ax.set_title(title, **axis_font)
    ax.set_ylabel(y_label, **axis_font)
    ax.set_xlabel(x_label, **axis_font)
    ax.set_yscale('log', nonposy='clip')
    #ax.set_xscale('log',nonposx='clip')
    plt.ylim([0, max_y * 1.5])

    #lgd = plt.legend(loc=5,ncol=1, bbox_to_anchor=(1.34, 0.41), prop={'size' : 9})
    lgd = plt.legend(loc=5,ncol=1, bbox_to_anchor=(1.0, 0.35), prop={'size' : 9})
#    lgd = plt.legend(loc=5,ncol=2, bbox_to_anchor=(1.0, 0.2))
#    lgd = plt.legend(loc=5,ncol=2, bbox_to_anchor=(0.99, -0.4))

    plt.savefig(os.environ['BASE_DIR']+"/"+os.environ['OUT_DIR']+"/PLOT/"+file_name+".pdf", bbox_extra_artists=(lgd,), bbox_inches='tight')#, bbox_inches=0)
    plt.savefig(os.environ['BASE_DIR']+"/"+os.environ['OUT_DIR']+"/PLOT/"+file_name+".png", bbox_extra_artists=(lgd,), bbox_inches='tight')
    plt.close(fig)


def pretty_labels(inp):
    if inp=="gurobi":
        return "Gurobi()"
    elif inp=="gurobi_lim":
        return "Gurobi(L)"
    elif inp=="g12mip":
        return "G12(MIP)"
    elif inp=="ourtool_flat_opz1":
        return "ourtool(FZN-o1)"
    elif inp=="ourtool_flat_opz2":
        return "ourtool(FZN-o2)"
    elif inp=="ourtool_flat_opz3":
        return "ourtool(FZN-o3)"
    elif inp=="ourtool_flat_opz4":
        return "ourtool(FZN-o4)"
    elif inp=="ourtool_flat_sort":
        return "ourtool(FZN + sort)"
    elif inp=="ourtool_flat_def":
        return "ourtool(FZN+def)"
    elif inp=="gecode":
        return "Gecode()"
    elif inp=="ourtool_smt2":
        return "ourtool(SMT)"
    elif inp=="g12fd":
        return "G12(FD)"
    elif inp=="or-tools-sat":
        return "OR-Tools(SAT)"
    elif inp=="or-tools-cp":
        return "OR-Tools(CP)"
    elif inp=="izplus":
        return "iZplus()"
    elif inp=="haifa":
        return "HaifaCSP()"
    elif inp=="hcsp":
        return "HaifaCSP()"
    elif inp=="picat-cp":
        return "Picat(CP)"
    elif inp=="picat-sat":
        return "Picat(SAT)"
    elif inp=="mistral":
        return "Mistral()"
    elif inp=="choco":
        return "Choco()"
    elif inp=="chuffed":
        return "Chuffed()"
    elif inp=="jacop":
        return "JaCoP()"


def start_extraction(flag,flag_int,flag_opz,inputs,timeout_bound): #flag to select the operation to do, ris_dir the path of that directory
    if flag==1:                                      #parse the ris files and create one unique small compact file
        parse_ris_file(inputs,flag_int,flag_opz,timeout_bound)     #directory
    elif flag==2:
        create_plot_table(inputs,flag_int,timeout_bound)           #summary
    elif flag==3:
        parse_time_translation(inputs)




if __name__=="__main__":
    if len(sys.argv)!=6:
        print("Error in the number of the argument")
    else:
        start_extraction(int(sys.argv[1]),bool(int(sys.argv[2])),int(sys.argv[3]),sys.argv[4],int(sys.argv[5]))