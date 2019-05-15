# CONTENT: MiniZinc Challenge 2016

# 1. Experiment Setup:

Modify the value of variable BASE_DIR, contained in the .bashrc file, to point
at the ABSOLUTE DIRECTORY PATH in which this file is contained. E.g.,

    export BASE_DIR="/home/account_name/cp2019/minizinc_test/"

# 2. Launching the Experiment:

- Load the environment variables and scripts with

      ~$ source .bashrc

- [optional] Protect your computer from trashing, and run the script

      ~$ nohup ./monitor_ram.sh > ram.log 2>&1 &

  in a separate terminal

- Launch the experiment

      ~$ nohup run_experiment.sh bench2016 out fzn 1 1200 &
      
   **NB:** due to license reasons, `Gurobi` is not included
           in the package.

# 3. Collect the Data:

    ~$ python results/stats_plot.py *.out

# 4. Our Data:

   The experimental data we have collected in our experiment
   is available within the directory "results".

   The sub-directory 'plots' shows the Cactus-Plot comparison
   and the pairwise scatter-plot comparisons among all configurations
   wrt. to `Our_OMT_Tool`.
