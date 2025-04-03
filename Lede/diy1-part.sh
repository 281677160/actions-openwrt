#!/bin/bash
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>

git clone --depth 1 https://github.com/xiaorouji/openwrt-passwall package/luci-app-passwall
echo 'src-git helloworld https://github.com/fw876/helloworld;master' >> feeds.conf.default
echo 'src-git xiaorouji https://github.com/xiaorouji/openwrt-passwall-packages;main' >> feeds.conf.default
