#!/bin/bash
# SPDX-License-Identifier: GPL-3.0-only

function Delete_useless(){
# 删除一些不需要的东西
docker rmi `docker images -q`
sudo -E apt-get -qq remove -y --purge azure-cli ghc* zulu* llvm* firefox google* powershell openjdk* msodbcsql17 mongodb* moby* snapd* mysql*
sudo rm -rf /etc/apt/sources.list.d/* /usr/share/dotnet /usr/local/lib/android /usr/lib/jvm /opt/ghc /swapfile
}

function install_mustrelyon(){
# 安装依赖
systemctl daemon-reload
sudo bash -c 'bash <(curl -s https://build-scripts.immortalwrt.eu.org/init_build_environment.sh)'
systemctl daemon-reload
sudo apt-get install -y rename pigz libfuse-dev
sudo apt-get install -y $(curl -fsSL https://is.gd/depend_ubuntu2204_openwrt)
}

function update_apt_source(){
# 清理下载包
node --version
yarn --version
sudo apt-get autoremove -y --purge
sudo apt-get clean
}

function main(){
INS="sudo -E apt-get -qq"
Delete_useless
install_mustrelyon
update_apt_source
}

main "$@"
