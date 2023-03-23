'''
2 types of execute: warm up, execute

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

# get elf list
elf_list = []
with open("./elf_list", "r") as f:
    lines = f.readlines()
    for line in lines:
        elf = line.strip("\n").split(" ")
        elf_list.append(elf)

sev_enable_execute_list = []
sev_enable_warmup_list = []
sev_disable_execute_list = []
sev_disable_warmup_list = []

with open(os.path.join(root, result_txt), "w") as r_txt, open(os.path.join(root, result_csv), "w") as  r_csv:
    r_csv.write("Benchmark Direcory, ELF Name, Type, Times, SEV_ENABLE, SEV_DISABLE, Rate\n")
    for dir, elf in elf_list:
        cur_path = os.path.join(root, dir)

        print("Processing %s" % dir)
        r_txt.write("Processing %s\n" % dir)
        with open(os.path.join(cur_path, sev_enable_log), "r") as log:
            lines = log.readlines()
            w_cnt = 0 # warm up count

            warmup_all = 0
            execute_all = 0 
            
            for line in lines:
                if w_cnt < warmUp:
                    warmup_all += float(line.strip("\n"))
                    w_cnt += 1
                else:
                    execute_all += float(line.strip("\n"))
            sev_enable_warmup_list.append([dir, elf, warmup_all / warmUp])
            r_txt.write("SEV ENABLE: WARM UP: Benchmark Directory %s: , ELF Name: %s, Average time: %fs\n"% (dir, elf,  warmup_all / warmUp))
            print("SEV ENABLE: WARM UP: Benchmark Directory %s: , ELF Name: %s, Average time: %fs"% (dir, elf,  warmup_all / warmUp))
                    
            sev_enable_execute_list.append([dir, elf, execute_all / execute])
            r_txt.write("SEV ENABLE: EXECUTE: Benchmark Directory %s: , ELF Name: %s, Average time: %fs\n"% (dir, elf,  execute_all / execute))
            print("SEV ENABLE: EXECUTE: Benchmark Directory %s: , ELF Name: %s, Average time: %fs"% (dir, elf,  execute_all / execute))
        with open(os.path.join(cur_path, sev_disable_log), "r") as log:
            lines = log.readlines()
            w_cnt = 0 # warm up count

            warmup_all = 0
            execute_all = 0

            for line in lines:
                if w_cnt < warmUp:
                    warmup_all += float(line.strip("\n"))
                    w_cnt += 1
                else:
                    execute_all += float(line.strip("\n"))
            sev_disable_warmup_list.append([dir, elf, warmup_all / warmUp])
            r_txt.write("SEV DISABLE: WARM UP: Benchmark Directory %s: , ELF Name: %s, Average time: %fs\n"% (dir, elf,  warmup_all / warmUp))
            print("SEV DISABLE: WARM UP: Benchmark Directory %s: , ELF Name: %s, Average time: %fs"% (dir, elf,  warmup_all / warmUp))

            sev_disable_execute_list.append([dir, elf, execute_all / execute])
            r_txt.write("SEV DISABLE: EXECUTE: Benchmark Directory %s: , ELF Name: %s, Average time: %fs\n"% (dir, elf,  execute_all / execute))
            print("SEV DISABLE: EXECUTE: Benchmark Directory %s: , ELF Name: %s, Average time: %fs"% (dir, elf,  execute_all / execute))

    for cnt in range(len(sev_disable_execute_list)):
        # Benchmark Direcory, ELF Name, Type, Times, SEV_ENABLE, SEV_DISABLE, Rate
        r_csv.write("%s, %s, %d, %f, %f, %f"%(sev_disable_warmup_list[cnt][0], sev_disable_warmup_list[cnt][1], "warmup", sev_enable_warmup_list[cnt][2], sev_disable_warmup_list[cnt][2], sev_enable_warmup_list[cnt][2] / sev_disable_warmup_list[cnt][2]))
        r_csv.write("%s, %s, %d, %f, %f, %f"%(sev_disable_execute_list[cnt][0], sev_disable_execute_list[cnt][1], "execute", sev_enable_execute_list[cnt][2], sev_disable_execute_list[cnt][2], sev_enable_execute_list[cnt][2] / sev_disable_execute_list[cnt][2]))