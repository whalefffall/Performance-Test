import os, sys
root = os.getcwd()


# get dir list
dirs = []
with open("./spec_dirs", "r") as f:
    lines = f.readlines()
    for line in lines:
        words = line.strip("\n").split(" ")
        dirs.append(words[8])


log_file = "1.out"
c = sys.argv[1]
if c == '1':
    log_file = "1.out"
elif c == '2':
    log_file = "2.out"


for dir in dirs:
    cur_path = os.path.join(root, dir)
    print("Processing %s" % dir)
    os.system("rm  %s" % os.path.join(cur_path, log_file))
print("Done")