'''
3 kinds of time: real, user, sys
2 kinds of execute: warm up, execute

We would abort warm up and calculate the average time of execute

For simplicity, we only consider the average time, neither the standard deviation, nor the maximal and minimal time


'''
import os
root = os.getcwd()
dir_list = os.listdir(root)
warmUp = 5
execute = 10
stride = 3



log_file = "1.out" # log file name
result_file = "result.txt" # result file name

with open(os.path.join(root, result_file), "w") as r:
    for dir in dir_list:
        cur_path = os.path.join(root, dir)
        if not os.path.isdir(cur_path):
            continue
        print("Processing %s" % dir)
        with open(os.path.join(cur_path, log_file), "r") as log:
            lines = log.readlines()
            c_cnt = 1 # command number
            w_cnt = 0 # warm up count
            e_cnt = 0 # execute count
            real_all = 0 # total real time
            usr_all = 0 # total user time
            sys_all = 0 # total sys time
            log.readline()
            for idx in range(0, len(lines)):
                if w_cnt < warmUp:
                    w_cnt = warmUp
                    idx += stride * w_cnt
                if e_cnt == execute:
                    r.write("Command %d: real %f, user %f, sys %f"% (c_cnt, real_all / execute, usr_all / execute, sys_all / execute))
                    e_cnt = 0
                    c_cnt += 1
                    w_cnt = 0
                if lines[idx].startswith("real"):
                    real_all += float(lines[idx].split(" ")[1])
                elif lines[idx].startswith("user"):
                    usr_all += float(lines[idx].split(" ")[1])
                elif lines[idx].startswith("sys"):
                    sys_all += float(lines[idx].split(" ")[1])
                    e_cnt += 1
                    