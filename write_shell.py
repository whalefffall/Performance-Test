import os
root = os.getcwd()
# dir_list = os.listdir(root)
warmUp = 10
execute = 30
# print(dir_list)
# exit()
cmd_file = "speccmds.cmd"

# get dir list
dirs = []
with open("./spec_dirs", "r") as f:
    lines = f.readlines()
    for line in lines:
        words = line.strip("\n").split(" ")
        dirs.append(words[8])
        print(words[8])

type = "SEV"

# generate script
def generate(type:str):
    with open(os.path.join(root, "run_all.sh"), "a") as f_all:
        f_all.write("#!/bin/bash \nlet warmUp=%d\nlet execute=%d\nwhile getopt \":w:e:\" opt\ndo\n    case $opt in\n        w)\n            warmUp=$OPTARG\n        ;;\n\
        e)\n            execute=$OPTARG\n        ;;\n        ?)\n        echo \"Unknown parameter\"\n        exit 1;;\nesac done\n" % {warmUp, execute}) 
                    
    for dir in dirs:
        cur_path = os.path.join(root, dir)
        print("Processing %s" % dir)
        
        exec_file = ""
        

        fin_path = os.path.join(cur_path, cmd_file)
        fout_path = os.path.join(cur_path, "run.sh")
        with open(fin_path, "r") as f_in:
            with open(fout_path, "w") as f_out:
            
                f_out.write("#!/bin/bash \nlet warmUp=%d\nlet execute=%d\nwhile getopt \":w:e:\" opt\ndo\n    case $opt in\n        w)\n            warmUp=$OPTARG\n        ;;\n\
        e)\n            execute=$OPTARG\n        ;;\n        ?)\n        echo \"Unknown parameter\"\n        exit 1;;\nesac done\n" % {warmUp, execute}) 
            
                f_out.write("# Bare Ubuntu\n")
                cmds = f_in.readlines()
                for cmd in cmds:
                    if cmd.startswith("-o "):
                        words = cmd.split(" ")
                        exec_file = words[4].split("/")[2]
                        command = "{ time -p ./" + exec_file + " ".join(words[5:len(words)-5]) + " > /dev/null 2>&1;} >> 1.out 2>&1"
                        f_out.write("for((var=0; var<$warmUp; var++))\n")
                        f_out.write("    do\n")
              