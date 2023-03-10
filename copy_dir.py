import shutil
dirs = []
with open("./spec_dirs", "r") as f:
    lines = f.readlines()
    for line in lines:
        words = line.strip("\n").split(" ")
        dirs.append(words[8])
        print(words[8])
# print(dir)
print(len(dirs))
dest = "/root/SPEC_SEV/"
for dir in dirs:
    src = "/root/speccpu2017/benchspec/CPU/" + dir + "/run/run_base_test_mytest-m64.0000"
    des = dest + dir
    shutil.copytree(src, des)
    print("Copy %s to %s" % (src, des))