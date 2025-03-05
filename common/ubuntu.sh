#!/bin/bash
# SPDX-License-Identifier: GPL-3.0-only

function install_mustrelyon(){
# 安装依赖
# sudo bash -c 'bash <(curl -s https://build-scripts.immortalwrt.eu.org/init_build_environment.sh)'
sudo apt update -y
sudo apt full-upgrade -y
sudo apt install -y ack antlr3 asciidoc autoconf automake autopoint binutils bison build-essential \
bzip2 ccache clang cmake cpio curl device-tree-compiler flex gawk gcc-multilib g++-multilib gettext \
genisoimage git gperf haveged help2man intltool libc6-dev-i386 libelf-dev libfuse-dev libglib2.0-dev \
libgmp3-dev libltdl-dev libmpc-dev libmpfr-dev libncurses5-dev libncursesw5-dev libpython3-dev \
libreadline-dev libssl-dev libtool llvm lrzsz msmtp ninja-build p7zip p7zip-full patch pkgconf \
python3 python3-pyelftools python3-setuptools qemu-utils rsync scons squashfs-tools subversion \
swig texinfo uglifyjs upx-ucl unzip vim wget xmlto xxd zlib1g-dev
sudo apt-get install -y rename pigz libfuse-dev subversion
sudo apt-get install -y $(curl -fsSL https://is.gd/depend_ubuntu2204_openwrt)
}

function Delete_useless(){
# 删除一些不需要的东西
docker rmi `docker images -q`
sudo rm -rf /etc/apt/sources.list.d/* /usr/share/dotnet /usr/local/lib/android /usr/lib/jvm /opt/ghc /swapfile
#sudo -E apt-get -qq remove -y --purge azure-cli ghc* zulu* llvm* firefox google* powershell openjdk* msodbcsql17 mongodb* moby* snapd* mysql*
sudo apt-get autoremove -y --purge
sudo apt-get clean
}

function main(){
INS="sudo -E apt-get -qq"
install_mustrelyon
Delete_useless
}

main "$@"
