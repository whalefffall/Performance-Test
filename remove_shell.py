import os
root = os.getcwd()


# get dir list
dirs = []
with open("./spec_dirs", "r") as f:
    lines = f.readlines()
    for line in lines:
        words = line.strip("\n").split(" ")
        dirs.append(words[8])


shell_file = "run.sh"
os.system("rm  %s" % os.path.join(root, "run_all.sh"))
for dir in dirs:
    cur_path = os.path.join(root, dir)
    print("Processing %s" % dir)
    os.system("rm  %s" % os.path.join(cur_path, shell_file))
print("Done")