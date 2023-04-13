#!/bin/bash
#======================================================
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
# DIY扩展二合一了，在此处可以增加插件,可修改IP,修改源码
# diy-luci1.sh  LUCI1源码使用
#======================================================

#1. 首次进入固件免密登录设置(填1为启用,0为不启用)
export DELETE_LOGIN_PASSWORD="1"

#2. 清理[X]天之前的Artifacts
export RETAIN_DAYS="7"

#3. 保留[X]个Releases不被删除
export KEEP_LATEST="10"

#4. 晶晨CPU系列打包固件设置(不懂请看说明)
export amlogic_model="s905d"
export amlogic_kernel="5.10.01_6.1.01"
export auto_kernel="true"
export rootfs_size="960"
export kernel_usage="stable"

# 删除源码自带的，然后拉重新取luci-app-smartdns
find . -type d -name 'luci-app-smartdns' -o -name 'smartdns' | xargs -i rm -rf {}
git clone -b lede https://github.com/pymumu/luci-app-smartdns package/luci-app-smartdns
git clone https://github.com/pymumu/openwrt-smartdns package/smartdns

# 删除源码自带的，然后拉重新取luci-theme-argon
find . -type d -name 'luci-theme-argon' -o -name 'luci-app-argon-config' | xargs -i rm -rf {}
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon package/luci-theme-argon
git clone https://github.com/jerrykuku/luci-app-argon-config package/luci-app-argon-config
