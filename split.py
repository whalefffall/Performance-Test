'''
Split files larger than 100M into several smaller files.
Merge smaller files to origin.


remote: error: File kernels/dedup/input_simlarge.tar is 184.09 MB; this exceeds GitHub's file size limit of 100.00 MB
'''
import os
import sys
files = ['kernels/dedup/input_simlarge.tar']
def split():
    for file in files:
        command = "split -b 80M ./" + file + " ./" + file
        os.system(command)
        print("Process ", file)

def clean():
    for file in files:
        command = 'rm ./'+file
        os.system(command)
        print("Remove ", file)

def merge():
    for file in files:
        command = 'cat ./' + file + '* > ' + file
        print(command)
        os.system(command)
        print("Merge ", file)
c = sys.argv[1]
if c == '1':
    split()
elif c == '2':
    clean()
elif c == '3':
    merge()