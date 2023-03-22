'''
3 kinds of roles for time: real, user, sys
2 types of execute: warm up, execute

We would abort warm up and calculate the average time of execute

For simplicity, we only consider the average time, neither the standard deviation, nor the maximal and minimal time


'''
import os
root = os.getcwd()
dir_list = os.listdir(root)
warmUp = 50
execute = 100
# stride = 3

roles = ['real', 'user', 'sys']
sev_disable_log = "2.out" # sev disable log file name
sev_enable_log = "1.out" # drv enablelog file name

result_txt = "result.txt" 
result_csv = "result.csv" 

# get dir list
dirs = []
with open("./spec_dirs", "r") as f:
    lines = f.readlines()
    for line in lines:
        words = line.strip("\n").split(" ")
        dirs.append(words[8])
        # print(words[8])

sev_enable_execute_list = []
sev_enable_warmup_list = []
sev_disable_execute_list = []
sev_disable_warmup_list = []

with open(os.path.join(root, result_txt), "w") as r_txt, open(os.path.join(root, result_csv), "w") as  r_csv:
    r_csv.write("Benchmark, Command cnt, Type, Role, Times, SEV_ENABLE, SEV_DISABLE, Rate\n")
    for dir in dirs:
        cur_path = os.path.join(root, dir)

        sev_enable_warmup_list.clear()
        sev_disable_warmup_list.clear()
        sev_disable_execute_list.clear()
        sev_enable_execute_list.clear()
        
        
        print("Processing %s" % dir)
        r_txt.write("Processing %s\n" % dir)
        with open(os.path.join(cur_path, sev_enable_log), "r") as log:
            lines = log.readlines()
            c_cnt = 1 # command number
            w_cnt = 0 # warm up count
            e_cnt = 0 # execute count
            warmup_real_all = 0
            warmup_usr_all = 0
            warmup_sys_all = 0
            execute_real_all = 0 
            execute_usr_all = 0 
            execute_sys_all = 0 
            idx = 0
            while idx < len(lines) + 1:
                if e_cnt == execute:
                    sev_enable_warmup_list.append([warmup_real_all / warmUp, warmup_usr_all / warmUp, warmup_sys_all / warmUp])
                    sev_enable_execute_list.append([execute_real_all / execute, execute_usr_all / execute, execute_sys_all / execute])
                    r_txt.write("SEV ENABLE: WARM UP: Command %d: real %f, user %f, sys %f\n"% (c_cnt, warmup_real_all / warmUp, warmup_usr_all / warmUp, warmup_sys_all / warmUp))
                    print("SEV ENABLE: WARM UP: Command %d: real %f, user %f, sys %f"% (c_cnt, warmup_real_all / warmUp, warmup_usr_all / warmUp, warmup_sys_all / warmUp))
                    r_txt.write("SEV ENABLE: EXECUTE: Command %d: real %f, user %f, sys %f\n"% (c_cnt, execute_real_all / execute, execute_usr_all / execute, execute_sys_all / execute))
                    print("SEV ENABLE: EXECUTE: Command %d: real %f, user %f, sys %f"% (c_cnt, execute_real_all / execute, execute_usr_all / execute, execute_sys_all / execute))
                    e_cnt = 0
                    c_cnt += 1
                    w_cnt = 0
                    warmup_real_all = 0
                    warmup_sys_all = 0
                    warmup_sys_all = 0
                    execute_real_all = 0
                    execute_usr_all = 0 
                    execute_sys_all = 0 
                    idx += 1
                    continue
                if w_cnt < warmUp:
                    if lines[idx].startswith("real"):
                        warmup_real_all += float(lines[idx].split(" ")[1])
                    elif lines[idx].startswith("user"):
                        warmup_usr_all += float(lines[idx].split(" ")[1])
                    elif lines[idx].startswith("sys"):
                        warmup_sys_all += float(lines[idx].split(" ")[1])
                        w_cnt += 1
                else:
                    if lines[idx].startswith("real"):
                        execute_real_all += float(lines[idx].split(" ")[1])
                    elif lines[idx].startswith("user"):
                        execute_usr_all += float(lines[idx].split(" ")[1])
                    elif lines[idx].startswith("sys"):
                        execute_sys_all += float(lines[idx].split(" ")[1])
                        e_cnt += 1
                idx += 1
        
        with open(os.path.join(cur_path, sev_disable_log), "r") as log:
            lines = log.readlines()
            c_cnt = 1 # command number
            w_cnt = 0 # warm up count
            e_cnt = 0 # execute count
            warmup_real_all = 0
            warmup_usr_all = 0
            warmup_sys_all = 0
            execute_real_all = 0
            execute_usr_all = 0
            execute_sys_all = 0
            idx = 0
            while idx < len(lines) + 1:
                if e_cnt == execute:
                    sev_disable_warmup_list.append([warmup_real_all / warmUp, warmup_usr_all / warmUp, warmup_sys_all / warmUp])
                    sev_disable_execute_list.append([execute_real_all / execute, execute_usr_all / execute, execute_sys_all / execute])
                    r_txt.write("SEV DISABLE: WARM UP: Command %d: real %f, user %f, sys %f\n"% (c_cnt, warmup_real_all / warmUp, warmup_usr_all / warmUp, warmup_sys_all / warmUp))
                    print("SEV DISABLE: WARM UP: Command %d: real %f, user %f, sys %f"% (c_cnt, warmup_real_all / warmUp, warmup_usr_all / warmUp, warmup_sys_all / warmUp))
                    r_txt.write("SEV DISABLE: EXECUTE: Command %d: real %f, user %f, sys %f\n"% (c_cnt, execute_real_all / execute, execute_usr_all / execute, execute_sys_all / execute))
                    print("SEV DISABLE: EXECUTE: Command %d: real %f, user %f, sys %f"% (c_cnt, execute_real_all / execute, execute_usr_all / execute, execute_sys_all / execute))
                    e_cnt = 0
                    c_cnt += 1
                    w_cnt = 0
                    warmup_real_all = 0
                    warmup_sys_all = 0
                    warmup_sys_all = 0
                    execute_real_all = 0
                    execute_usr_all = 0 
                    execute_sys_all = 0 
                    idx += 1
                    continue
                if w_cnt < warmUp:
                    if lines[idx].startswith("real"):
                        warmup_real_all += float(lines[idx].split(" ")[1])
                    elif lines[idx].startswith("user"):
                        warmup_usr_all += float(lines[idx].split(" ")[1])
                    elif lines[idx].startswith("sys"):
                        warmup_sys_all += float(lines[idx].split(" ")[1])
                        w_cnt += 1
                else:
                    if lines[idx].startswith("real"):
                        execute_real_all += float(lines[idx].split(" ")[1])
                    elif lines[idx].startswith("user"):
                        execute_usr_all += float(lines[idx].split(" ")[1])
                    elif lines[idx].startswith("sys"):
                        execute_sys_all += float(lines[idx].split(" ")[1])
                        e_cnt += 1
                idx += 1


        for cnt in range(len(sev_disable_execute_list)):
            # for warm up
            r_csv.write("%s,%d,%s,%d,%s,%f,%f,%f,\n"%(dir, cnt+1, "warmup", warmUp, roles[0], sev_enable_warmup_list[cnt][0], sev_disable_warmup_list[cnt][0], sev_enable_warmup_list[cnt][0]/(sev_disable_warmup_list[cnt][0]+0.000001)))
            r_csv.write(",,,,%s,%f,%f,%f,\n"%(roles[1],sev_enable_warmup_list[cnt][1], sev_disable_warmup_list[cnt][1], sev_enable_warmup_list[cnt][1]/(sev_disable_warmup_list[cnt][1]+0.000001)))
            r_csv.write(",,,,%s,%f,%f,%f,\n"%(roles[2],sev_enable_warmup_list[cnt][2], sev_disable_warmup_list[cnt][2], sev_enable_warmup_list[cnt][2]/(sev_disable_warmup_list[cnt][2]+0.000001)))

            # for execute
            r_csv.write("%s,%d,%s,%d,%s,%f,%f,%f,\n"%(dir, cnt+1, "execute", execute, roles[0], sev_enable_execute_list[cnt][0], sev_disable_execute_list[cnt][0], sev_enable_execute_list[cnt][0]/(sev_disable_execute_list[cnt][0]+0.000001)))
            r_csv.write(",,,,%s,%f,%f,%f,\n"%(roles[1],sev_enable_execute_list[cnt][1], sev_disable_execute_list[cnt][1], sev_enable_execute_list[cnt][1]/(sev_disable_execute_list[cnt][1]+0.000001)))
            r_csv.write(",,,,%s,%f,%f,%f,\n"%(roles[2],sev_enable_execute_list[cnt][2], sev_disable_execute_list[cnt][2], sev_enable_execute_list[cnt][2]/(sev_disable_execute_list[cnt][2]+0.000001)))

                    