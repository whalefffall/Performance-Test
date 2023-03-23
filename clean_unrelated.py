'''
Remove all unrelated files in the benchmark directories except the ELF files.
Remove run_all.sh in the root directory.
'''
import os
target = "Gramine"
elf_list = []
root = os.path.join(os.getcwd(), target)
# root = os.getcwd() # for local test
cur_sign = "" # sign of current directory
elf_list_name = "elf_list"

def is_elf(filepath):
    '''
    Check if the file is ELF file
    '''
    with open(filepath, 'rb') as f:
        header = (bytearray(f.read(4))[1:4]).decode(encoding="utf-8")
        # logger.info("header is {}".format(header))
        if header in ["ELF"]:
            return True

def remove_unrelated(target_dir:str=root, cur_sign:str=cur_sign):
    '''
    Remove all unrelated files in the directory except the ELF files.
    '''
    elf_list = []
    for root, dirs, files in os.walk(target_dir):
        for file in files:
            filepath = os.path.join(root, file)
            if not is_elf(filepath):
                os.remove(filepath)
                print("Remove %s" % filepath)
            else:
                dir_path = root.replace(os.getcwd(), cur_sign)[1:]
                elf_list.append([dir_path, file])
                print("Keep %s, dir_path=%s, file=%s" % (filepath, dir_path, file))
    return elf_list

def write_elf_list(elf_list:list, elf_list_name:str=elf_list_name):
    '''
    Write the elf list to file
    '''
    with open(elf_list_name, "w") as f:
        for dir_path, file in elf_list:
            f.write(dir_path + " " + file +"\n")

elf_list = remove_unrelated(root)
write_elf_list(elf_list)

print(os.system("rm run_all.sh"))