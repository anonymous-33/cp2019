Date: May 2019

This file describes how to replicate the experiments.

# Directory Content
```
cp-2019-exp/
|-- bench          The benchmark-sets, it contains the smt2 files
|-- experiment.sh  The bash-script to launch the whole experiment
|-- README.md      This file
|-- results        The results presented in the paper (with their plots)
|-- src            The code of the script ot execute the experiment
`-- tools          The used tools
```


# Dependencies
Required dependencies

python2.7

python3

python3-tk

six -> python2.7 package

matplotlib -> python3 package

Gecode solver require ```libmpfr4.so``` library

# Launch the experiment
Run  ```source .bashrc``` in the main directory

run ```./experiment.sh NAME_DIR```


The script experiment.sh automatically creates a directory with the name provided as argument NAME_DIR. The NAME_DIR will
store all the results from the experiment done on the benchmark-set in the bench/ directory. The script will start also a
monitor_ram script to kill all the processe which will require more than 80% of memory during their execution.

The content of the NAME_DIR directory will be so structured:
```
-translation_times_EXPNAME.txt
-PLOT/
-EXPNAME_ris/
    -solver.txt
    -summary_ris.txt
    -table.txt
```

### Remark1
To use the Gurobi solvers it is necessary to obtain the solver and the license from the Gurobi website (http://www.gurobi.com/) and configure it.
The MiniZinc software presents in this folder is under the Mozilla Public License Version 2.0. It has been obtained by modifying (and then compiling) lib/parser.yxx and increase YYMAXDEPTH and YYINITDEPTH value. MiniZinc official repo (https://github.com/MiniZinc)
All the other tools are distributed as they have been found from their original sources

Can be necessary to change the quantity of memory for JaCop. In this case change the value of the  -Xss10g option in the int_bmc testing script in src/test_src/ dir

### Remark2
In order to replicate the summaries, the tables and plots for the results reported in the results/ dir is necessary to follow the following steps:

(This steps will ovveride the summaries already present in the result directory)

(**NB** In some tables are presents some lines containing ourtools_flat1/2/3/4. The extract_result.py script, to produce the plot and the Virtual Best
, considers only ourtool_flat3).

1. ```source .bashrc``` in the main directory

2. ```mkdir MY_DIR``` &   ```mkdir MY_DIR/PLOT```

3. ```export OUT_DIR="MY_DIR"```

4. Then generate the summaries, plots and tables
   1. summary: ```python3 src/other_src/extract_result.py 1 0 0 result/real_bmc/ 600```

   2. table and plots (the table are printed on the scree) : ```python3 src/other_src/extract_result.py 2 0 0 result/real_bmc/summary_ris.txt 600```
   3. ```python3 src/other_src/extract_result.py 1 0 1 result/combinatorial/ 600```

   4. ```python3 src/other_src/extract_result.py 2 0 1 result/combinatorial/summary_ris.txt 600```

   5. ```python3 src/other_src/extract_result.py 1 0 0 result/symba/ 600```

   6. ```python3 src/other_src/extract_result.py 2 0 0 result/symba/summary_ris.txt 600```

   7. ```python3 src/other_src/extract_result.py 1 0 1 result/ml/ 600```

   8. ```python3 src/other_src/extract_result.py 2 0 1 result/ml/summary_ris.txt 600```

   9. ```python3 src/other_src/extract_result.py 1 1 0 result/int_bmc/ 600```

   10. ```python3 src/other_src/extract_result.py 2 1 0 result/int_bmc/summary_ris.txt 600```