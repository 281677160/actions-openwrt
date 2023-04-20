#!/bin/bash
#======================================================
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
# DIY扩展二合一了，在此处可以增加插件,可修改IP,修改源码
# diy-luci2.sh  LUCI2源码使用
#======================================================

# 晶晨CPU系列打包固件设置(不懂请看说明)
export amlogic_model="s905d"
export amlogic_kernel="5.10.01_6.1.01"
export auto_kernel="true"
export rootfs_size="2560"
export kernel_usage="stable"


# 删除源码自带的，然后拉重新取luci-app-smartdns
find . -type d -name 'luci-app-smartdns' -o -name 'smartdns' | xargs -i rm -rf {}
git clone -b master https://github.com/pymumu/luci-app-smartdns package/luci-app-smartdns
git clone https://github.com/pymumu/openwrt-smartdns package/smartdns

# 删除源码自带的，然后拉重新取luci-theme-argon
find . -type d -name 'luci-theme-argon' -o -name 'luci-app-argon-config' | xargs -i rm -rf {}
git clone -b master https://github.com/jerrykuku/luci-theme-argon package/luci-theme-argon
git clone https://github.com/jerrykuku/luci-app-argon-config package/luci-app-argon-config

# 删除源码自带的，然后拉重新取luci-app-adguardhome
find . -type d -name 'luci-app-adguardhome' -o -name 'adguardhome' | xargs -i rm -rf {}
svn co https://github.com/281677160/AdGuardHome/trunk/luci-app-adguardhome package/luci-app-adguardhome
svn co https://github.com/281677160/AdGuardHome/trunk/adguardhome package/adguardhome
