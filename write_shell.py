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
cmd_file = "speccmds.cmd"
sev_enable_log = "1.out"
sev_disable_log = "2.out"
sev_enable_root_shell = "run_all_sev_enable.sh"
sev_disable_root_shell = "run_all_sev_disable.sh"
sev_enable_shell = "run_sev_enable.sh"
sev_disable_shell = "run_sev_disable.sh"

log_file = "1.out"



os.system("python3 remove_shell.py")

# get dir list
dirs = []
with open("./spec_dirs", "r") as f:
    lines = f.readlines()
    for line in lines:
        words = line.strip("\n").split(" ")
        dirs.append(words[8])
        print(words[8])

type = "SEV"

def generate_scripts(root_shell:str, shell:str, log:str, root=root, warmup=warmUp, execute=execute, cmd_file=cmd_file, dirs=dirs):
    '''
    generate scripts with given parameters
    '''
    with open(os.path.join(root, root_shell), "a") as f_all:
        f_all.write("#!/bin/bash \nlet warmUp=%d\nlet execute=%d\nwhile getopts \":w:e:\" opt\ndo\n    case $opt in\n        w)\n            warmUp=$OPTARG\n        ;;\n        e)\n            execute=$OPTARG\n        ;;\n        ?)\n        echo \"Unknown parameter\"\n        exit 1;;\nesac done\n" % (warmup, execute)) 
    
    for dir in dirs:
        cur_path = os.path.join(root, dir)
        print("Processing %s" % dir)
        
        exec_file = ""
        

        fin_path = os.path.join(cur_path, cmd_file)
        fout_path = os.path.join(cur_path, shell)
        with open(fin_path, "r") as f_in, open(fout_path, "w") as f_out:
            f_out.write("#!/bin/bash \nlet warmUp=%d\nlet execute=%d\nwhile getopts \":w:e:\" opt\ndo\n    case $opt in\n        w)\n            warmUp=$OPTARG\n        ;;\n        e)\n            execute=$OPTARG\n        ;;\n        ?)\n        echo \"Unknown parameter\"\n        exit 1;;\nesac done\n" % (warmup, execute)) 
            f_out.write("echo start benchmark %s\n"%dir)
            f_out.write("# Bare Ubuntu\n")
            cmds = f_in.readlines()
            cmd_cnt = 0
            for cmd in cmds:
                if cmd.startswith("-o "):
                    cmd_cnt += 1
                    words = cmd.strip("\n").split(" ")
                    exec_file = words[4].split("/")[2]
                    command = "{ time -p ./" + exec_file + " " + " ".join(words[5:]) + " ;} >> " + log + " 2>&1"
                    
                    f_out.write("echo start warm up for command %d\n"%cmd_cnt)
                    f_out.write("for((var=0; var<$warmUp; var++))\n    do\n")
                    f_out.write("        " + command + "\ndone\n")
                    f_out.write("echo finish one warm up!\n")
                    f_out.write("echo start execute for command %d\n"%cmd_cnt)
                    f_out.write("for((var=0; var<$execute; var++))\n    do\n")
                    f_out.write("        " + command + "\ndone\n")
                    f_out.write("echo finish one execute!\n")
                
                elif cmd.startswith("-i "):
                    cmd_cnt += 1
                    words = cmd.strip("\n").split(" ")
                    exec_file = words[6].split("/")[2]
                    command = "{ time -p ./" + exec_file + " " + " ".join(words[7:]) + " ;} >> " + log + " 2>&1"
                    
                    f_out.write("echo start warm up for command %d\n"%cmd_cnt)
                    f_out.write("for((var=0; var<$warmUp; var++))\n    do\n")
                    f_out.write("        " + command + "\ndone\n")
                    f_out.write("echo finish one warm up!\n")
                    f_out.write("echo start execute for command %d\n"%cmd_cnt)
                    f_out.write("for((var=0; var<$execute; var++))\n    do\n")
                    f_out.write("        " + command + "\ndone\n")
                    f_out.write("echo finish one execute!\n")
            
            with open(os.path.join(root, root_shell), "a") as f_all:
                f_all.write("cd ./" + dir + "\n")
                f_all.write("./"+shell+" -w $warmUp -e $execute\n")
                f_all.write("cd ..\n")
                f_all.write("echo finish benchmark %s\n"%dir)
            
            command = "chmod +x " + fout_path
            os.system(command)




generate_scripts(root_shell=sev_enable_root_shell, shell=sev_enable_shell, log=sev_enable_log)
print(os.system("chmod +x %s"%sev_enable_root_shell))
generate_scripts(root_shell=sev_disable_root_shell, shell=sev_disable_shell, log=sev_disable_log)
print(os.system("chmod +x %s"%sev_disable_root_shell))
print("Finish writing shells!")

'''
#!/bin/bash
let warmUp=20      
let execute=100     

while getopts ":w:e:" opt
do
    case $opt in
        w)
            warmUp=$OPTARG
        ;;
        e)
            execute=$OPTARG
        ;;
        ?)
        echo "Unknown parameter"
        exit 1;;
esac done

# Warm Up
for((var=0; var<$warmUp; var++))
    do
        { time -p ./perlbench_r -I. -I./lib makerand.pl > makerand.out 2>> makerand.err 2>&1;} >> 1.output 2>&1
done
# Execute the first Command
for((var=0; var<$execute; var++))
    do
        { time -p ./perlbench_r -I. -I./lib makerand.pl > makerand.out 2>> makerand.err 2>&1;} >> 1.output 2>&1
done

# Warm Up
for((var=0; var<$warmUp; var++))
    do
        { time -p ./perlbench_r -I. -I./lib test.pl > test.out 2>> test.err 2>&1;} >> 1.output 2>&1
done
# Execute the second Command
for((var=0; var<$execute; var++))
    do
        { time -p ./perlbench_r -I. -I./lib test.pl > test.out 2>> test.err 2>&1;} >> 1.output 2>&1
done

'''

'''
-o spec_test.out -e spec_test.err ../run_base_test_mytest-m64.0000/cactusBSSN_r_base.mytest-m64 spec_test.par   > spec_test.out 2>> spec_test.err
'''