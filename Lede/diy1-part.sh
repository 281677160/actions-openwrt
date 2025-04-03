#!/bin/bash
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>

echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall;main' >> feeds.conf.default
echo 'src-git helloworld https://github.com/fw876/helloworld;master' >> feeds.conf.default
echo 'src-git xiaorouji https://github.com/xiaorouji/openwrt-passwall-packages;main' >> feeds.conf.default
