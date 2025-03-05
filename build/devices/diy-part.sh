#!/bin/bash
#======================================================
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
# 自定义文件2（diy-part2.sh）
# 在此处只能增加修改源码命令，不能使用增加插件的命令
#======================================================


# 晶晨CPU系列打包固件设置(不懂请看说明)
export amlogic_model="s905d"
export amlogic_kernel="5.10.01_6.1.01"
export auto_kernel="true"
export rootfs_size="2560"
export kernel_usage="stable"

# 整理固件包时候,删除您不想要的固件或者文件,让它不需要上传到Actions空间(根据编译机型变化,自行调整删除名称)
cat >"$CLEAR_PATH" <<-EOF
packages
profiles.json
config.buildinfo
feeds.buildinfo
sha256sums
version.buildinfo
openwrt-x86-64-generic-kernel.bin
openwrt-x86-64-generic.manifest
openwrt-x86-64-generic-squashfs-rootfs.img.gz
EOF

cat >>"feeds.conf.default" <<-EOF
src-git danshui1 https://github.com/281677160/openwrt-package.git;Lede
src-git helloworld https://github.com/fw876/helloworld.git
src-git passwall3 https://github.com/xiaorouji/openwrt-passwall-packages;main
src-git passwall1 https://github.com/xiaorouji/openwrt-passwall.git;main
src-git passwall2 https://github.com/xiaorouji/openwrt-passwall2.git;main
EOF

# 更换golang版本
rm -rf ${HOME_PATH}/feeds/packages/lang/golang
git clone https://github.com/sbwml/packages_lang_golang -b 21.x ${HOME_PATH}/feeds/packages/lang/golang

rm -rf ${HOME_PATH}/feeds/packages/mosdns
rm -rf ${HOME_PATH}/package/feeds/packages/mosdns
