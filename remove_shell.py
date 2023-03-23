'''
Remove shell scripts in the root directory and all benchmark directories.
'''
import os
root = os.getcwd()

# get elf list
elf_list = []
with open("./elf_list", "r") as f:
    lines = f.readlines()
    for line in lines:
        elf = line.strip("\n").split(" ")
        elf_list.append(elf)

root_shell_files = ['run_all_sev_enable.sh', 'run_all_sev_disable.sh']
shell_files = ['run_sev_enable.sh', 'run_sev_disable.sh']


for root_shell in root_shell_files:
    print("Processing %s" % root_shell)
    os.system("rm  %s" % os.path.join(root, root_shell))


for dir_path, file in elf_list:
    cur_path = os.path.join(root, dir_path)
    print("Processing %s" % dir_path)
    for shell in shell_files:
        os.system("rm  %s" % os.path.join(cur_path, shell))
print("Done")