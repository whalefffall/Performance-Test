'''
Write shell run_all_sev_enable.sh to run with sev enable and run_all_sev_disable.sh to run with sev disable 
The two shell scripts are almost the same, except the output filename, and both in the root directory.
In the directory of each benchmark, there are two shell scripts, run_sev_enable.sh to run with sev enable and run_sev_disable.sh to run with sev disable  .

'''
# write shell run_all_sev_enable.sh to run with sev enable and run_all_sev_disable.sh to run with sev disable 

# The two shell scripts are almost the same, except the output filename
import os, sys
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



os.system("python3 remove_shell.py")


# get elf list
elf_list = []
with open("./elf_list", "r") as f:
    lines = f.readlines()
    for line in lines:
        elf = line.strip("\n").split(" ")
        elf_list.append(elf)

type = "SEV"

def generate_scripts(root_shell:str, shell:str, log:str, root=root, warmup=warmUp, execute=execute, elf_list=elf_list):
    '''
    generate scripts with given parameters
    '''
    with open(os.path.join(root, root_shell), "a") as f_all:
        f_all.write("#!/bin/bash \nlet warmUp=%d\nlet execute=%d\nwhile getopts \":w:e:\" opt\ndo\n    case $opt in\n        w)\n            warmUp=$OPTARG\n        ;;\n        e)\n            execute=$OPTARG\n        ;;\n        ?)\n        echo \"Unknown parameter\"\n        exit 1;;\nesac done\n" % (warmup, execute)) 
    
    for dir_path, elf_file in elf_list:
        cur_path = os.path.join(root, dir_path)
        print("Processing %s" % dir_path)
        
        exec_file = elf_file
        
        fout_path = os.path.join(cur_path, shell)
        with open(fout_path, "w") as f_out:
            f_out.write("#!/bin/bash \nlet warmUp=%d\nlet execute=%d\nwhile getopts \":w:e:\" opt\ndo\n    case $opt in\n        w)\n            warmUp=$OPTARG\n        ;;\n        e)\n            execute=$OPTARG\n        ;;\n        ?)\n        echo \"Unknown parameter\"\n        exit 1;;\nesac done\n" % (warmup, execute)) 
            f_out.write("echo start benchmark %s\n"%dir_path)
            command = "./" + exec_file + ">> " + log
            f_out.write("echo start warm up for %s\n"%elf_file)
            f_out.write("for((var=0; var<$warmUp; var++))\n    do\n")
            f_out.write("        " + command + "\ndone\n")
            f_out.write("echo finish one warm up!\n")
            f_out.write("echo start execute for %s\n"%elf_file)
            f_out.write("for((var=0; var<$execute; var++))\n    do\n")
            f_out.write("        " + command + "\ndone\n")
            f_out.write("echo finish one execute!\n")
            
            with open(os.path.join(root, root_shell), "a") as f_all:
                f_all.write("cd ./" + dir_path + "\n")
                f_all.write("./"+shell+" -w $warmUp -e $execute\n")
                f_all.write("cd ..\n")
                f_all.write("echo finish benchmark %s %s\n"%(dir_path, elf_file))
            
            command = "chmod +x " + fout_path
            os.system(command)




generate_scripts(root_shell=sev_enable_root_shell, shell=sev_enable_shell, log=sev_enable_log)
print(os.system("chmod +x %s"%sev_enable_root_shell))
generate_scripts(root_shell=sev_disable_root_shell, shell=sev_disable_shell, log=sev_disable_log)
print(os.system("chmod +x %s"%sev_disable_root_shell))
print("Finish writing shells!")

