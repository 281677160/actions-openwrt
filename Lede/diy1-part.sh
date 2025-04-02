#!/bin/bash
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>

git clone --depth 1 https://github.com/fw876/helloworld package/luci-app-ssr-plus
git clone --depth 1 https://github.com/xiaorouji/openwrt-passwall package/luci-app-passwall
git clone --single-branch --depth=1 --branch=main https://github.com/xiaorouji/openwrt-passwall-packages  package/passwall-packages
