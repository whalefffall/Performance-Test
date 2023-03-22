import os, sys
root = os.getcwd()
# dir_list = os.listdir(root)
warmUp = 50
execute = 100
# print(dir_list)
# exit()
cmd_file = "speccmds.cmd"
log_file = "1.out"
c = sys.argv[1]
if c == '1':
    log_file = "1.out"
elif c == '2':
    log_file = "2.out"


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

# generate script
def generate(type:str):
    with open(os.path.join(root, "run_all.sh"), "a") as f_all:
        f_all.write("#!/bin/bash \nlet warmUp=%d\nlet execute=%d\nwhile getopts \":w:e:\" opt\ndo\n    case $opt in\n        w)\n            warmUp=$OPTARG\n        ;;\n        e)\n            execute=$OPTARG\n        ;;\n        ?)\n        echo \"Unknown parameter\"\n        exit 1;;\nesac done\n" % (warmUp, execute)) 
        f_all.close()
                    
    for dir in dirs:
        cur_path = os.path.join(root, dir)
        print("Processing %s" % dir)
        
        exec_file = ""
        

        fin_path = os.path.join(cur_path, cmd_file)
        fout_path = os.path.join(cur_path, "run.sh")
        with open(fin_path, "r") as f_in:
            with open(fout_path, "w") as f_out:
            
                f_out.write("#!/bin/bash \nlet warmUp=%d\nlet execute=%d\nwhile getopts \":w:e:\" opt\ndo\n    case $opt in\n        w)\n            warmUp=$OPTARG\n        ;;\n        e)\n            execute=$OPTARG\n        ;;\n        ?)\n        echo \"Unknown parameter\"\n        exit 1;;\nesac done\n" % (warmUp, execute)) 

                f_out.write("echo start benchmark %s\n"%dir)
                f_out.write("# Bare Ubuntu\n")
                cmds = f_in.readlines()
                cmd_cnt = 0
                for cmd in cmds:
                    if cmd.startswith("-o "):
                        cmd_cnt += 1
                        words = cmd.strip("\n").split(" ")
                        exec_file = words[4].split("/")[2]
                        command = "{ time -p ./" + exec_file + " " + " ".join(words[5:]) + " ;} >> " + log_file + " 2>&1"
                        
                        f_out.write("echo start warm up for command %d\n"%cmd_cnt)
                        f_out.write("for((var=0; var<$warmUp; var++))\n")
                        f_out.write("    do\n")
                        f_out.write("        " + command + "\n")
                        f_out.write("done\n")
                        f_out.write("echo finish one warm up!\n")
                        
                        f_out.write("echo start execute command %d\n"%cmd_cnt)
                        f_out.write("for((var=0; var<$execute; var++))\n")
                        f_out.write("    do\n")
                        f_out.write("        " + command + "\n")
                        f_out.write("done\n\n")
                        f_out.write("echo finish one command!\n")

                    elif cmd.startswith("-i "):
                        cmd_cnt += 1
                        words = cmd.strip("\n").split(" ")
                        exec_file = words[6].split("/")[2]
                        command = "{ time -p ./" + exec_file + " " + " ".join(words[7:]) + " ;} >> " + log_file + " 2>&1"
                        
                        f_out.write("echo start warm up for command %d\n"%cmd_cnt)
                        f_out.write("for((var=0; var<$warmUp; var++))\n")
                        f_out.write("    do\n")
                        f_out.write("        " + command + "\n")
                        f_out.write("done\n")
                        f_out.write("echo finish one warm up!\n")
                        
                        f_out.write("echo start execute command %d\n"%cmd_cnt)
                        f_out.write("for((var=0; var<$execute; var++))\n")
                        f_out.write("    do\n")
                        f_out.write("        " + command + "\n")
                        f_out.write("done\n\n")
                        f_out.write("echo finish one command!\n")

                

                with open(os.path.join(root, "run_all.sh"), "a") as f_all:
                    f_all.write("cd ./" + dir + "\n")
                    f_all.write("./run.sh  -w $warmUp -e $execute\n")
                    f_all.write("cd ..\n")
                    f_all.write("echo finish one benchmark!\n")
                    f_all.close()
                
                f_out.close()
            f_in.close() 
        command = 'chmod +x ' + fout_path
        os.system(command)
generate(type)
print(os.system("chmod +x run_all.sh"))
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