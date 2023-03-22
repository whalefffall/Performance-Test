import os
root = os.getcwd()

# get dir list
dirs = []
with open("./spec_dirs", "r") as f:
    lines = f.readlines()
    for line in lines:
        words = line.strip("\n").split(" ")
        dirs.append(words[8])
root_shell_files = ['run_all_sev_enable.sh', 'run_all_sev_disable.sh']
shell_files = ['run_sev_enable.sh', 'run_sev_disable.sh']
for root_shell in root_shell_files:
    print("Processing %s" % root_shell)
    os.system("rm  %s" % os.path.join(root, root_shell))
for dir in dirs:
    cur_path = os.path.join(root, dir)
    print("Processing %s" % dir)
    for shell in shell_files:
        os.system("rm  %s" % os.path.join(cur_path, shell))
print("Done")