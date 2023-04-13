
#!/bin/bash
#======================================================
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
# DIY扩展二合一了，在此处可以增加插件,可修改IP,修改源码
# diy-luci1.sh  LUCI1源码使用
#======================================================


#1. 修改固件后台IP,把'192.168.2.2'改成您想要的就行
export IPV4_IPADDR="192.168.2.2"

#2. 首次进入固件免密登录设置(填1为启用)
export DELETE_LOGIN_PASSWORD="1"

#3. 编译时改成默认中文LUCI(填1为启用)
export DEFAULT_CHINESE_LANGUAGE="0"

#4. 清理[X]天之前的Artifacts
export RETAIN_DAYS="7"

#5. 保留[X]个Releases不被删除
export KEEP_LATEST="10"

#6. 晶晨CPU系列打包固件设置(不懂请看说明)
export amlogic_model="s905d"
export amlogic_kernel="5.10.01_6.1.01"
export auto_kernel="true"
export rootfs_size="960"
export kernel_repo="https://github.com/ophub/kernel/tree/kernel_stable/pub"
