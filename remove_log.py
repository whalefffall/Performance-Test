import os, sys
root = os.getcwd()


# get elf list
elf_list = []
with open("./elf_list", "r") as f:
    lines = f.readlines()
    for line in lines:
        elf = line.strip("\n").split(" ")
        elf_list.append(elf)

log_file = "1.out"
c = sys.argv[1]
if c == '1':
    log_file = "1.out"
elif c == '2':
    log_file = "2.out"


for dir_path, file in elf_list:
    cur_path = os.path.join(root, dir_path)
    print("Processing %s" % dir_path)
    os.system("rm  %s" % os.path.join(cur_path, log_file))
print("Done")