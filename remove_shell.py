import os
root = os.getcwd()
dir_list = os.listdir(root)


log_file = "1.out"
os.system("rm  %s" % os.path.join(root, "run_all.sh"))
for dir in dir_list:
    cur_path = os.path.join(root, dir)
    if not os.path.isdir(cur_path):
        continue
    print("Processing %s" % dir)
    os.system("rm  %s" % os.path.join(cur_path, log_file))
print("Done")