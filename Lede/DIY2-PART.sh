#!/bin/bash
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>

# 设置 IP
sed -i 's/192.168.1.1/192.168.2.2/g' package/base-files/files/bin/config_generate

# 设置主机名称
sed -i 's/OpenWrt/OpenWrt123/g' package/base-files/files/bin/config_generate

# 修改必选主题
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile
