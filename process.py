'''
2 types of execute: warm up, execute
5 kinds of sizes: dev(test), small, medium, large, native (not available). Default is medium
Erorr: True when some error occurs

For simplicity, we only consider the average time, neither the standard deviation, nor the maximal and minimal time


'''
import os
root = os.getcwd()
dir_list = os.listdir(root)
warmUp = 50
execute = 100
# stride = 3

sev_disable_log = "2.out" # sev disable log file name
sev_enable_log = "1.out" # sev enable log file name

result_txt = "result.txt" 
result_csv = "result.csv" 
size = "medium"
cmd_conf = "simmedium.runconf"

# get dir list
dir_list = []
with open("./dir_list", "r") as f:
    lines = f.readlines()
    for line in lines:
        dir = line.strip("\n")
        dir_list.append(dir)

sev_enable_execute_list = []
sev_enable_warmup_list = []
sev_disable_execute_list = []
sev_disable_warmup_list = []

with open(os.path.join(root, result_txt), "w") as r_txt, open(os.path.join(root, result_csv), "w") as  r_csv:
    r_csv.write("Benchmark Direcory,ELF Name,Size,Type,Times,Error,SEV_ENABLE, SEV_DISABLE, Rate\n")
    for dir in dir_list:
        cur_path = os.path.join(root, dir)

        print("Processing %s" % dir)
        r_txt.write("Processing %s\n" % dir)

        exec_file = ""
        
        fin_path = os.path.join(cur_path, cmd_conf)
        has_export = False
        has_input = True
        is_dir = False
        with open(fin_path, "r") as f_in:
            cmds = f_in.readlines()
            for cmd in cmds:
                if cmd.startswith("run_exec"):
                    exec_file = cmd.strip("\n").split("=")[1].strip("\"").split("/")[1]
                    print(exec_file)
                    break

        with open(os.path.join(cur_path, sev_enable_log), "r") as log:
            lines = log.readlines()
            w_cnt = 0 # warm up count

            warmup_all = 0
            execute_all = 0 
            error = True
            for line in lines:
                if not line.startswith("[HOOKS]"):
                    continue
                error = False
                time = line.strip("\n")[:-1].split(" ")[-1]
                
                if w_cnt < warmUp:
                    warmup_all += float(time)
                    w_cnt += 1
                else:
                    execute_all += float(time)
            sev_enable_warmup_list.append([dir, exec_file, error, warmup_all / warmUp])
            r_txt.write("SEV ENABLE: WARM UP: Benchmark Directory: %s, ELF Name: %s, Error:%s, Average time: %fs\n"% (dir, exec_file, error, warmup_all / warmUp))
            print("SEV ENABLE: WARM UP: Benchmark Directory: %s, ELF Name: %s, Error:%s, Average time: %fs"% (dir, exec_file, error, warmup_all / warmUp))
                    
            sev_enable_execute_list.append([dir, exec_file, error, execute_all / execute])
            r_txt.write("SEV ENABLE: EXECUTE: Benchmark Directory: %s, ELF Name: %s, Error:%s, Average time: %fs\n"% (dir, exec_file, error, execute_all / execute))
            print("SEV ENABLE: EXECUTE: Benchmark Directory: %s, ELF Name: %s, Error:%s, Average time: %fs"% (dir, exec_file, error, execute_all / execute))
        with open(os.path.join(cur_path, sev_disable_log), "r") as log:
            lines = log.readlines()
            w_cnt = 0 # warm up count

            warmup_all = 0
            execute_all = 0
            
            error = True
            for line in lines:
                if not line.startswith("[HOOKS]"):
                    continue
                error = False
                time = line.strip("\n")[:-1].split(" ")[-1]
                
                if w_cnt < warmUp:
                    warmup_all += float(time)
                    w_cnt += 1
                else:
                    execute_all += float(time)
            sev_disable_warmup_list.append([dir, exec_file, error, warmup_all / warmUp])
            r_txt.write("SEV DISABLE: WARM UP: Benchmark Directory: %s, ELF Name: %s, Error:%s, Average time: %fs\n"% (dir, exec_file, error, warmup_all / warmUp))
            print("SEV DISABLE: WARM UP: Benchmark Directory: %s, ELF Name: %s, Error:%s, Average time: %fs"% (dir, exec_file, error, warmup_all / warmUp))
                    
            sev_disable_execute_list.append([dir, exec_file, error, execute_all / execute])
            r_txt.write("SEV DISABLE: EXECUTE: Benchmark Directory: %s, ELF Name: %s, Error:%s, Average time: %fs\n"% (dir, exec_file, error, execute_all / execute))
            print("SEV DISABLE: EXECUTE: Benchmark Directory: %s, ELF Name: %s, Error:%s, Average time: %fs"% (dir, exec_file, error, execute_all / execute))

    for cnt in range(len(sev_disable_execute_list)):
        # Benchmark Direcory,ELF Name,Size,Type,Times,Error,SEV_ENABLE, SEV_DISABLE, Rate
        r_csv.write("%s, %s, %s, %s, %d, %s,%f, %f, %f\n"%(sev_disable_warmup_list[cnt][0], sev_disable_warmup_list[cnt][1], size,"warmup", warmUp, sev_enable_warmup_list[cnt][2], sev_enable_warmup_list[cnt][3], sev_disable_warmup_list[cnt][3], sev_enable_warmup_list[cnt][3] / (sev_disable_warmup_list[cnt][3]+0.000001)))
        r_csv.write(" , , , %s,%d, %s,%f, %f, %f\n"%("execute", execute, sev_enable_execute_list[cnt][2], sev_enable_execute_list[cnt][3], sev_disable_execute_list[cnt][3], sev_enable_execute_list[cnt][3] / (sev_disable_execute_list[cnt][3]+0.000001)))