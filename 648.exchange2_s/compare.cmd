-E BROWSER /root/.vscode-server/bin/441438abd1ac652551dbe4d408dfcec8a499b8bf/bin/helpers/browser.sh
-E COLORTERM truecolor
-E DBUS_SESSION_BUS_ADDRESS 'unix:path=/run/user/0/bus'
-E GIT_ASKPASS /root/.vscode-server/bin/441438abd1ac652551dbe4d408dfcec8a499b8bf/extensions/git/dist/askpass.sh
-E HOME /root
-E LANG en_US.UTF-8
-E LC_ALL C
-E LC_LANG C
-E LD_LIBRARY_PATH /usr/lib64/:/usr/lib/:/lib64
-E LESSCLOSE '/usr/bin/lesspipe %s %s'
-E LESSOPEN '| /usr/bin/lesspipe %s'
-E LIBC_FATAL_STDERR_ 1
-E LIBVIRT_DEFAULT_URI qemu:///system
-E LOGNAME root
-E LS_COLORS 'rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:'
-E MOTD_SHOWN pam
-E OLDPWD /usr/bin
-E OMP_NUM_THREADS 4
-E PATH /root/speccpu2017/bin:/root/.vscode-server/bin/441438abd1ac652551dbe4d408dfcec8a499b8bf/bin/remote-cli:/root/.cargo/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin
-E SHELL /bin/bash
-E SPEC /root/speccpu2017
-E SPECDB_PWD /root/speccpu2017
-E SPECPERLLIB /root/speccpu2017/bin/lib:/root/speccpu2017/bin
-E SSH_CLIENT '10.26.170.188 53645 22'
-E SSH_CONNECTION '10.26.170.188 53645 172.18.36.170 22'
-E TERM xterm-256color
-E TERM_PROGRAM vscode
-E TERM_PROGRAM_VERSION 1.75.1
-E USER root
-E VSCODE_GIT_ASKPASS_EXTRA_ARGS ''
-E VSCODE_GIT_ASKPASS_MAIN /root/.vscode-server/bin/441438abd1ac652551dbe4d408dfcec8a499b8bf/extensions/git/dist/askpass-main.js
-E VSCODE_GIT_ASKPASS_NODE /root/.vscode-server/bin/441438abd1ac652551dbe4d408dfcec8a499b8bf/node
-E VSCODE_GIT_IPC_HANDLE /run/user/0/vscode-git-ea5b304dac.sock
-E VSCODE_IPC_HOOK_CLI /run/user/0/vscode-ipc-08b18903-e0a7-48a2-9b1b-a63b2f8af88d.sock
-E XDG_DATA_DIRS /usr/local/share:/usr/share:/var/lib/snapd/desktop
-E XDG_RUNTIME_DIR /run/user/0
-E XDG_SESSION_CLASS user
-E XDG_SESSION_ID 374
-E XDG_SESSION_TYPE tty
-r
-N C
-C /root/speccpu2017/benchspec/CPU/648.exchange2_s/run/run_base_test_mytest-m64.0000
-k -o s.txt.cmp /root/speccpu2017/bin/specperl /root/speccpu2017/bin/harness/specdiff -m -l 10 /root/speccpu2017/benchspec/CPU/548.exchange2_r/data/test/output/s.txt s.txt > s.txt.cmp
