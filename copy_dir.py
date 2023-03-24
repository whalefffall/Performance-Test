'''
Copy necessary files to run PARSEC in SEV
'''
import os
import shutil

# copy the hooks lib
hooks_dest = "./lib"
hooks_src = "/root/parsec-3.0/pkgs/libs/hooks/inst/amd64-linux.gcc-hooks/lib"
print("Copy %s to %s" % (hooks_src, hooks_dest))
shutil.copytree(hooks_src, hooks_dest)

pkgs_src = "/root/parsec-3.0/pkgs"
pkgs_dest = "./"

# dir_list = []
dir_list_log = "./dir_list"

types = ["apps", "kernels"]

def copy_pkgs(pkgs_src:str=pkgs_src, pkgs_dest:str=pkgs_dest, types:list=types):
    dir_list = []
    for t in types:
        type_dest = os.path.join(pkgs_dest, t)
        os.makedirs(type_dest)
        type_path = os.path.join(pkgs_src, t)
        for dir in os.listdir(type_path):
            dir_path = os.path.join(type_path, dir)
            dir_dest = os.path.join(type_dest, dir)
            os.makedirs(dir_dest)
            dir_list.append(dir_dest[2:])

            # copy the input files except native
            inputs = os.path.join(dir_path, "inputs")
            if os.path.exists(inputs):
                for input in os.listdir(inputs):
                    if input.startswith("input_n"):
                        continue
                    shutil.copy(os.path.join(inputs, input), os.path.join(dir_dest, input))
                    print("Copy %s to %s" % (os.path.join(inputs, input), os.path.join(dir_dest, input)))

            # copy binary files
            bins = os.path.join(dir_path, "inst", "amd64-linux.gcc-hooks", "bin")
            for bin in os.listdir(bins):
                shutil.copy(os.path.join(bins, bin), os.path.join(dir_dest, bin))
                print("Copy %s to %s" % (os.path.join(bins, bin), os.path.join(dir_dest, bin)))

            # copy the run scripts
            scripts = os.path.join(dir_path, "parsec")
            for script in os.listdir(scripts):
                if script.startswith("native") or script.endswith("bldconf"):
                    continue
                shutil.copy(os.path.join(scripts, script), os.path.join(dir_dest, script))
                print("Copy %s to %s" % (os.path.join(scripts, script), os.path.join(dir_dest, script)))
    print("Done")
    return dir_list

def write_dir_list(dir_list:list, dir_list_log:str=dir_list_log):
    with open(dir_list_log, "w") as f:
        for dir in dir_list:
            f.write(dir + "\n")
            print(dir)

dir_list = copy_pkgs()
write_dir_list(dir_list)