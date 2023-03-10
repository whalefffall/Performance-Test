'''
Compress files larger than 100M into several smaller files.


remote: error: File 525.x264_r/BuckBunny.yuv is 205.66 MB; this exceeds GitHub's file size limit of 100.00 MB
remote: error: File 527.cam4_r/aero_1.9x2.5_L26_2000clim_c091112.nc is 214.54 MB; this exceeds GitHub's file size limit of 100.00 MB
remote: error: File 628.pop2_s/speed_pop2_base.mytest-m64 is 172.98 MB; this exceeds GitHub's file size limit of 100.00 MB
remote: error: File 510.parest_r/parest_r_base.mytest-m64 is 201.74 MB; this exceeds GitHub's file size limit of 100.00 MB
remote: error: File 526.blender_r/blender_r_base.mytest-m64 is 112.47 MB; this exceeds GitHub's file size limit of 100.00 MB
remote: error: File 628.pop2_s/nyf.ncep.T62.050923.nc is 102.80 MB; this exceeds GitHub's file size limit of 100.00 MB
remote: error: File 627.cam4_s/aero_1.9x2.5_L26_2000clim_c091112.nc is 214.54 MB; this exceeds GitHub's file size limit of 100.00 MB
remote: error: File 625.x264_s/BuckBunny.yuv is 205.66 MB; this exceeds GitHub's file size limit of 100.00 MB

remote: error: GH001: Large files detected. You may want to try Git Large File Storage - https://git-lfs.github.com.
'''
import os
files = ['525.x264_r/BuckBunny.yuv','628.pop2_s/speed_pop2_base.mytest-m64', '527.cam4_r/aero_1.9x2.5_L26_2000clim_c091112.nc', '510.parest_r/parest_r_base.mytest-m64','628.pop2_s/nyf.ncep.T62.050923.nc','526.blender_r/blender_r_base.mytest-m64','627.cam4_s/aero_1.9x2.5_L26_2000clim_c091112.nc','625.x264_s/BuckBunny.yuv']
files = ['627.cam4_s/aero_1.9x2.5_L26_2000clim_c091112.nc','625.x264_s/BuckBunny.yuv']
def compress():
    for file in files:
        command = 'tar czf - ./' + file + ' | split -b 80m - ./' + file + '.tar.gz'
        os.system(command)
        print("Process ", file)

def clean():
    for file in files:
        command = './'+file
        os.remove(command)
        print("Remove ", file)

def merge():
    for file in files:
        command = 'cat ./'+file+'.tar.gz* | tar -xzv'
        os.system(command)
        print("Merge ", file)
# compress()
# clean()
merge()