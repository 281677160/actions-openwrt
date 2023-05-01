#!/bin/bash
## https://github.com/281677160/AutoBuild-OpenWrt
## common Module by 28677160


## sbwml 插件
svn co https://github.com/sbwml/luci-app-alist/trunk/alist alist
svn co https://github.com/sbwml/luci-app-alist/trunk/luci-app-alist luci-app-alist
git clone https://github.com/sbwml/luci-app-mosdns mosdnszz
mv mosdnszz/* ./
git clone https://github.com/sbwml/v2ray-geodata v2ray-geodata

## istore
git clone https://github.com/linkease/nas-packages
mv nas-packages/* ./
git clone https://github.com/linkease/nas-packages-luci
mv nas-packages-luci/luci/* ./
rm -rf luci-app-unishare
rm -rf network/services/unishare
git clone https://github.com/linkease/istore luci-app-store

## sirpdboy 插件
svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-wifidog luci-app-wifidog
svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-switch-lan-play luci-app-switch-lan-play
svn co https://github.com/sirpdboy/sirpdboy-package/trunk/switch-lan-play switch-lan-play
svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-advanced luci-app-advanced
svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-timecontrol luci-app-timecontrol
svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-ddns-go luci-app-ddns-go
git clone https://github.com/sirpdboy/luci-app-partexp.git luci-app-partexp
svn co https://github.com/281677160/AdGuardHome/trunk/luci-app-adguardhome luci-app-adguardhome
svn co https://github.com/281677160/AdGuardHome/trunk/adguardhome adguardhome
git clone https://github.com/sirpdboy/luci-app-lucky app-lucky && mv app-lucky/* ./
git clone https://github.com/sirpdboy/luci-app-autotimeset luci-app-autotimeset
svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-wizard luci-app-wizard

## kenzok8 插件
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-aliyundrive-webdav luci-app-aliyundrive-webdav
svn co https://github.com/kenzok8/openwrt-packages/trunk/aliyundrive-webdav aliyundrive-webdav

## 天灵 插件
svn co https://github.com/immortalwrt/Rclone-OpenWrt/trunk ./
svn co https://github.com/project-openwrt/openwrt-tmate/trunk openwrt-tmate
svn co https://github.com/tindy2013/openwrt-subconverter/trunk openwrt-subconverter
svn co https://github.com/immortalwrt/luci/branches/openwrt-18.06/applications/luci-app-aliddns luci-app-aliddns
svn co https://github.com/quintus-lab/openwrt-package/trunk/luci-app-gost luci-app-gost
svn co https://github.com/quintus-lab/openwrt-package/trunk/gost gost
svn co https://github.com/immortalwrt-collections/openwrt-gowebdav/trunk/luci-app-gowebdav luci-app-gowebdav
svn co https://github.com/immortalwrt-collections/openwrt-gowebdav/trunk/gowebdav gowebdav
svn co https://github.com/immortalwrt/packages/branches/openwrt-18.06/net/oscam oscam
svn co https://github.com/immortalwrt/luci/branches/openwrt-18.06/applications/luci-app-oscam luci-app-oscam
svn co https://github.com/immortalwrt-collections/luci-app-unblockneteasemusic/trunk luci-app-unblockneteasemusic
svn co https://github.com/immortalwrt/luci/branches/openwrt-18.06/applications/luci-app-udp2raw luci-app-udp2raw
svn co https://github.com/immortalwrt/packages/branches/openwrt-18.06/net/udp2raw udp2raw
svn co https://github.com/immortalwrt/luci/branches/openwrt-18.06/applications/luci-app-cpulimit luci-app-cpulimit
svn co https://github.com/immortalwrt/packages/branches/openwrt-18.06/utils/cpulimit-ng cpulimit-ng
svn co https://github.com/immortalwrt/packages/branches/openwrt-18.06/utils/cpulimit cpulimit
svn co https://github.com/immortalwrt/luci/branches/openwrt-18.06/applications/luci-app-iptvhelper luci-app-iptvhelper
svn co https://github.com/immortalwrt/packages/branches/openwrt-18.06/net/iptvhelper iptvhelper
svn co https://github.com/KFERMercer/OpenWrt/trunk/package/kferm/luci-app-smartinfo luci-app-smartinfo
svn co https://github.com/immortalwrt/packages/branches/openwrt-18.06/utils/smartmontools smartmontools
svn co https://github.com/immortalwrt/luci/branches/openwrt-18.06/applications/luci-app-mentohust luci-app-mentohust
svn co https://github.com/immortalwrt/packages/branches/openwrt-18.06/net/mentohust mentohust

## Hyy2001X插件
svn co https://github.com/Hyy2001X/AutoBuild-Packages/trunk/luci-app-natter luci-app-natter
svn co https://github.com/Hyy2001X/AutoBuild-Packages/trunk/natter natter
svn co https://github.com/Hyy2001X/AutoBuild-Packages/trunk/luci-app-onliner luci-app-onliner
svn co https://github.com/Hyy2001X/AutoBuild-Packages/trunk/luci-app-shutdown luci-app-shutdown
svn co https://github.com/Hyy2001X/AutoBuild-Packages/trunk/luci-app-webd luci-app-webd
svn co https://github.com/Hyy2001X/AutoBuild-Packages/trunk/webd webd

## 零碎拉取的插件
svn co https://github.com/sundaqiang/openwrt-packages/trunk/luci-app-wolplus luci-app-wolplus
svn co  https://github.com/tty228/luci-app-serverchan/trunk luci-app-serverchan
svn co https://github.com/rufengsuixing/luci-app-autoipsetadder/trunk luci-app-autoipsetadder
svn co https://github.com/msylgj/luci-app-tencentddns/trunk luci-app-tencentddns
svn co https://github.com/NateLol/luci-app-oled/trunk luci-app-oled
svn co https://github.com/esirplayground/luci-app-poweroff/trunk luci-app-poweroff
svn co https://github.com/OpenWrt-Actions/OpenAppFilter/trunk luci-app-oaf
svn co https://github.com/coolsnowwolf/luci/trunk/applications/luci-app-pushbot luci-app-pushbot
svn co https://github.com/jerrykuku/luci-app-ttnode/trunk luci-app-ttnode
svn co https://github.com/lisaac/luci-app-dockerman/trunk/applications/luci-app-dockerman luci-app-dockerman
svn co https://github.com/sundaqiang/openwrt-packages/trunk/luci-app-supervisord luci-app-supervisord
svn co https://github.com/281677160/feed-netkeeper/branches/LUCI-LUA-UCITRACK feed-netkeeper && mv feed-netkeeper/* ./
git clone https://github.com/ximiTech/msd_lite.git msd_lite
git clone https://github.com/ximiTech/luci-app-msd_lite.git luci-app-msd_lite

## vssr,openclash,clash三个梯子
svn co https://github.com/jerrykuku/luci-app-vssr/trunk luci-app-vssr
svn co https://github.com/jerrykuku/lua-maxminddb/trunk lua-maxminddb
svn co https://github.com/frainzy1477/luci-app-clash/trunk luci-app-clash
svn co https://github.com/immortalwrt/packages/trunk/net/kcptun kcptun

## N1和晶晨系列盒子专用的安装和升级固件工具
svn co https://github.com/ophub/luci-app-amlogic/trunk/luci-app-amlogic luci-app-amlogic

## CF优先IP
svn co https://github.com/mingxiaoyu/luci-app-cloudflarespeedtest/trunk/applications/luci-app-cloudflarespeedtest luci-app-cloudflarespeedtest
svn co https://github.com/immortalwrt-collections/openwrt-cdnspeedtest/trunk/cdnspeedtest cdnspeedtest

## 拼拼WiFi，选择以下项目（必选）
## Wiwiz/PinPinWiFi -> Portal  --->
git clone https://github.com/wiwizcom/WiFiPortal Wiwiz-PinPinWiFi



## 生成完整目录清单
cat > Update.txt <<EOF
Wiwiz-PinPinWiFi
adguardhome
alist
aliyundrive-webdav
app-lucky
assets
cdnspeedtest
cpulimit
cpulimit-ng
feed-netkeeper
gost
gowebdav
install.sh
iptvhelper
kcptun
lua-maxminddb
luci-app-adguardhome
luci-app-advanced
luci-app-aliddns
luci-app-alist
luci-app-aliyundrive-webdav
luci-app-amlogic
luci-app-autoipsetadder
luci-app-autotimeset
luci-app-clash
luci-app-cloudflarespeedtest
luci-app-cpulimit
luci-app-ddns-go
luci-app-ddnsto
luci-app-dockerman
luci-app-gost
luci-app-gowebdav
luci-app-iptvhelper
luci-app-istorex
luci-app-linkease
luci-app-lucky
luci-app-mentohust
luci-app-mosdns
luci-app-msd_lite
luci-app-natter
luci-app-netkeeper-interception
luci-app-oaf
luci-app-oled
luci-app-onliner
luci-app-oscam
luci-app-partexp
luci-app-poweroff
luci-app-pushbot
luci-app-quickstart
luci-app-rclone
luci-app-serverchan
luci-app-shutdown
luci-app-smartinfo
luci-app-store
luci-app-supervisord
luci-app-switch-lan-play
luci-app-tencentddns
luci-app-timecontrol
luci-app-ttnode
luci-app-udp2raw
luci-app-unblockneteasemusic
luci-app-vssr
luci-app-webd
luci-app-wifidog
luci-app-wizard
luci-app-wolplus
luci-lib-iform
luci-proto-netkeeper
lucky
mentohust
mosdns
mosdnszz
msd_lite
multimedia
nas-packages
nas-packages-luci
natter
netkeeper
netkeeper-interception
network
openwrt-subconverter
openwrt-tmate
oscam
rclone
rclone-ng
rclone-webui-react
smartmontools
switch-lan-play
udp2raw
v2dat
v2ray-geodata
webd
EOF
exit 0
