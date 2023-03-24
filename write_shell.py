'''
Write shell run_all_sev_enable.sh to run with sev enable and run_all_sev_disable.sh to run with sev disable 
The two shell scripts are almost the same, except the output filename, and both in the root directory.
In the directory of each benchmark, there are two shell scripts, run_sev_enable.sh to run with sev enable and run_sev_disable.sh to run with sev disable  .

'''
# write shell run_all_sev_enable.sh to run with sev enable and run_all_sev_disable.sh to run with sev disable 

# The two shell scripts are almost the same, except the output filename
import os, sys
import subprocess
root = os.getcwd()
# dir_list = os.listdir(root)
warmUp = 50
execute = 100
# print(dir_list)
# exit()
sev_enable_log = "1.out"
sev_disable_log = "2.out"
sev_enable_root_shell = "run_all_sev_enable.sh"
sev_disable_root_shell = "run_all_sev_disable.sh"
sev_enable_shell = "run_sev_enable.sh"
sev_disable_shell = "run_sev_disable.sh"
n_threads = 1
os.system
# choose the size of the benchmark: from small to large : test, small, medium, large, native (not available 
size = "medium"

# change the input file name and configuration file name according to the size of the benchmark
input_tar = "input_simmedium.tar"
cmd_conf = "simmedium.runconf"

# define the export LD_LIBRARY_PATH
export_ld_library_path = "export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:"+ os.path.join(os.getcwd(),"lib")

# remove the old shell scripts
os.system("python3 remove_shell.py")

# write a configuration file to loacate all direcories of benchmarks

# get dir list
dir_list = []
with open("./dir_list", "r") as f:
    lines = f.readlines()
    for line in lines:
        dir = line.strip("\n")
        dir_list.append(dir)

type = "SEV"

def generate_scripts(root_shell:str, shell:str, log:str, root=root, warmup=warmUp, execute=execute, dir_list=dir_list, cmd_conf:str=cmd_conf):
    '''
    generate scripts with given parameters
    '''
    with open(os.path.join(root, root_shell), "a") as f_all:
        f_all.write("#!/bin/bash \nlet warmUp=%d\nlet execute=%d\nwhile getopts \":w:e:\" opt\ndo\n    case $opt in\n        w)\n            warmUp=$OPTARG\n        ;;\n        e)\n            execute=$OPTARG\n        ;;\n        ?)\n        echo \"Unknown parameter\"\n        exit 1;;\nesac done\n" % (warmup, execute)) 
        f_all.write(export_ld_library_path + "\n")
    for dir in dir_list:
        cur_path = os.path.join(root, dir)
        print("Processing %s" % dir)
        
        exec_file = ""
        
        fin_path = os.path.join(cur_path, cmd_conf)
        fout_path = os.path.join(cur_path, shell)
        has_export = False
        has_input = True
        is_dir = False
        with open(fin_path, "r") as f_in, open(fout_path, "w") as f_out:
            cmds = f_in.readlines()
            for cmd in cmds:
                if cmd.startswith("run_exec"):
                    exec_file = cmd.strip("\n").split("=")[1].strip("\"").split("/")[1]
                    print(exec_file)
                elif cmd.startswith("run_args"):
                    parameters = cmd.strip("\n").split("=")[1].strip("\"").replace("${NTHREADS}", str(n_threads)).split(" ")
                    print(parameters)
                # handle environment variables
                elif cmd.startswith("export"):
                    has_export = True
                    export = cmd.strip("\n").replace("${NTHREADS}", str(n_threads)).split(" ")
                    print(export)
            if not os.path.exists(os.path.join(dir, input_tar)):
                has_input = False
                print("%s: No input file"%dir)
            if has_input:
                input = subprocess.getoutput("tar -xvf " + os.path.join(dir, input_tar) + " -C " + dir).split("\n")[0]
                if os.path.isdir(os.path.join(dir, input)):
                    is_dir = True
                    remove_input = "rm -r " + os.path.join(dir, input)
                else:
                    remove_input = "rm " + os.path.join(dir, input)
                print(remove_input)
                print(os.system(remove_input))
            f_out.write("#!/bin/bash \nlet warmUp=%d\nlet execute=%d\nwhile getopts \":w:e:\" opt\ndo\n    case $opt in\n        w)\n            warmUp=$OPTARG\n        ;;\n        e)\n            execute=$OPTARG\n        ;;\n        ?)\n        echo \"Unknown parameter\"\n        exit 1;;\nesac done\n" % (warmup, execute)) 
            f_out.write(export_ld_library_path + "\n")
            if has_export:
                f_out.write(" ".join(export[:]) + "\n")
            if has_input:
                f_out.write("tar -xvf " + input_tar + "\n")
            f_out.write("echo start benchmark %s\n"%dir)
            command = "./" + exec_file + " " + " ".join(parameters) + ">> " + log
            f_out.write("echo start warm up for %s\n"%exec_file)
            f_out.write("for((var=0; var<$warmUp; var++))\n    do\n")
            
            print(input)
            f_out.write("        " + command + "\ndone\n")
            f_out.write("echo finish one warm up!\n")
            f_out.write("echo start execute for %s\n"%exec_file)
            f_out.write("for((var=0; var<$execute; var++))\n    do\n")
            f_out.write("        " + command + "\ndone\n")
            if has_input:
                if is_dir:
                    f_out.write("rm -r " + input + "\n")
                else:
                    f_out.write("rm " + input + "\n")
            f_out.write("echo finish one execute!\n")
            
            with open(os.path.join(root, root_shell), "a") as f_all:
                f_all.write("cd " + os.path.join(os.getcwd(), dir) + "\n")
                f_all.write("./"+shell+" -w $warmUp -e $execute\n")
                f_all.write("cd " + os.getcwd() + "\n")
                f_all.write("echo finish benchmark %s %s\n"%(dir, exec_file))
            
            command = "chmod +x " + fout_path
            os.system(command)




generate_scripts(root_shell=sev_enable_root_shell, shell=sev_enable_shell, log=sev_enable_log)
print(os.system("chmod +x %s"%sev_enable_root_shell))
generate_scripts(root_shell=sev_disable_root_shell, shell=sev_disable_shell, log=sev_disable_log)
print(os.system("chmod +x %s"%sev_disable_root_shell))
print("Finish writing shells!")

'''
#!/bin/bash
#
# simmedium.runconf - file containing information necessary to run a specific
#                     program of the PARSEC benchmark suite
#
# Copyright (C) 2007 Princeton University
# Written by Christian Bienia

# This is the information which we need to run the program. Each package of the
# benchmark suite has such a file with information that will be added to the
# global configuration. All variables set in the global configuration files can
# be referenced here.


# Binary file to execute, relative to installation root
run_exec="bin/blackscholes"

# Arguments to use
run_args="${NTHREADS} in_16K.txt prices.txt"


'''