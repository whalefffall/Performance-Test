# 检查文件

| 文件名               | 用处                                      |
| -------------------- | ----------------------------------------- |
| configAndDownload.sh | 配置gramine，下载对应软件包和parsec压缩包 |
| compile.sh           | 编译                                      |
| makeAndRun.sh        | 配置sgx环境，并且运行收集结果             |
| stForPARSEC.java     | 统计程序，生成结果表格                    |


# steps
请详细按照此教程步骤执行：

1. apt-get update
2. sudo apt-get install git
3. 下载对应脚本
4. 首先在根目录下运行configAndDownload.sh，运行完之后会出现parsec对应文件夹
5. 对gcc和g++进行降级：
6. 
```
sudo apt install software-properties-common -y
# 添加源
sudo add-apt-repository ppa:ubuntu-toolchain-r/test
# 如果上一步长时间无响应，可以尝试换用下面的方式
# sudo apt-add-repository "deb http://ppa.launchpad.net/ubuntu-toolchain-r/test/ubuntu focal main"
# 注意不同的Ubuntu版本的代号是不一样的，18.04 bionic，20.04 focal. 如果不确定的话，可以使用        # lsb_release -a查看
# 如果还不行，就采用以下方式
# sudo vim /etc/apt/sources.list
# 在文件末尾添加下面两行
# deb http://dk.archive.ubuntu.com/ubuntu/ xenial main
# deb http://dk.archive.ubuntu.com/ubuntu/ xenial universe
# 保存更新

# 进行更新
sudo apt-get update
# 安装较低版本的gcc/g++
sudo apt-get install gcc-4.8 g++-4.8 -y
# 降低旧版本的优先级
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-9 10
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-9 10
# 提高新版本的优先级
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.8 20
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.8 20
# 完成以后使用以下命令查看默认使用的gcc版本
update-alternatives --config gcc

# 可能需要的其他指令
# 重装证书
# sudo apt-get install --reinstall ca-certificates
# 绕过代理
# sudo -E add-apt-repository --update ppa:ubuntu-toolchain-r/test
```

7.  进入/parsec-3.0/pkgs/libs/uptcpip/src/include/sys目录下，将bsd_types.h的102至105行注释
8. sudo apt-get install locales -y（这些命令在脚本里好像有问题）
9. sudo locale-gen en_US.UTF-8
10. sudo update-locale LANG=en_US.UTF-8
11. cd /parsec-3.0/pkgs/libs/ssl/src/doc/apps
12. sed -i.bak 's/item \([0-9]\+\)/item C<\1>/g' *
13. cd /parsec-3.0/pkgs/libs/ssl/src/doc/ssl
14. sed -i.bak 's/item \([0-9]\+\)/item C<\1>/g' *
15. 运行compile脚本，这个脚本好像在编译的原因，不能后台运行，请耐心等待，大概二三十分钟。
16. 运行makeAndRun.sh该脚本需要两个参数，第一个是使用的数据集，第二个是线程数量。比如：
```
./makeAndRun.sh simmedium 1
```

表示使用simmedium数据集，线程数量为1.

17. 配置java运行环境，sudo apt-get install default-jre
18. sudo apt-get install default-jdk
19. 运行java程序
20. javac stForPARSEC.java
21. java stForPARSEC
22. 得到目标csv表格文件。
