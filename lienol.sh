#!/bin/bash
## https://github.com/281677160/AutoBuild-OpenWrt
## common Module by 28677160


## sbwml 插件
git clone https://github.com/sbwml/luci-app-alist alist2
mv alist2/* ./
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
git clone https://github.com/sirpdboy/sirpdboy-package
cp -Rf sirpdboy-package/luci-app-wifidog ./luci-app-wifidog
cp -Rf sirpdboy-package/luci-app-switch-lan-play ./luci-app-switch-lan-play
cp -Rf sirpdboy-package/switch-lan-play ./switch-lan-play
cp -Rf sirpdboy-package/luci-app-advanced ./luci-app-advanced
cp -Rf sirpdboy-package/luci-app-timecontrol ./luci-app-timecontrol
cp -Rf sirpdboy-package/luci-app-ddns-go ./luci-app-ddns-go
cp -Rf sirpdboy-package/luci-app-wolplus ./luci-app-wolplus
cp -Rf sirpdboy-package/luci-app-cupsd ./luci-app-cupsd
rm -rf sirpdboy-package
git clone https://github.com/sirpdboy/luci-app-partexp.git luci-app-partexp
git clone https://github.com/sirpdboy/luci-app-lucky app-lucky && mv app-lucky/* ./
git clone https://github.com/sirpdboy/luci-app-autotimeset luci-app-autotimeset
git clone https://github.com/sirpdboy/luci-app-netwizard luci-app-netwizard

## coolsnowwolf 插件
git clone https://github.com/coolsnowwolf/luci ddluci
cp -Rf ddluci/applications/luci-app-pushbot ./luci-app-pushbot
cp -Rf ddluci/applications/luci-app-aliyundrive-webdav ./luci-app-aliyundrive-webdav
cp -Rf ddluci/applications/luci-app-serverchan ./luci-app-serverchan
rm -rf ddluci
git clone https://github.com/coolsnowwolf/packages ddpackages
cp -Rf ddpackages/multimedia/aliyundrive-webdav ./aliyundrive-webdav
cp -Rf ddpackages/multimedia/aliyundrive-fuse ./aliyundrive-fuse
rm -rf ddpackages

## 天灵 插件
git clone https://github.com/immortalwrt/Rclone-OpenWrt && mv -f Rclone-OpenWrt/* ./
git clone https://github.com/project-openwrt/openwrt-tmate openwrt-tmate
git clone https://github.com/tindy2013/openwrt-subconverter openwrt-subconverter
git clone https://github.com/destan19/OpenAppFilter && mv -f OpenAppFilter/* ./
git clone -b openwrt-18.06 https://github.com/immortalwrt/luci tlluci
cp -Rf tlluci/applications/luci-app-aliddns ./luci-app-aliddns
cp -Rf tlluci/applications/luci-app-gowebdav ./luci-app-gowebdav
cp -Rf tlluci/applications/luci-app-unblockneteasemusic ./luci-app-unblockneteasemusic
cp -Rf tlluci/applications/luci-app-mentohust ./luci-app-mentohust
cp -Rf tlluci/applications/luci-app-oscam ./luci-app-oscam
cp -Rf tlluci/applications/luci-app-filebrowser ./luci-app-filebrowser
cp -Rf tlluci/applications/luci-app-udp2raw ./luci-app-udp2raw
cp -Rf tlluci/applications/luci-app-cpulimit ./luci-app-cpulimit
cp -Rf tlluci/applications/luci-app-iptvhelper ./luci-app-iptvhelper
cp -Rf tlluci/applications/luci-app-smartinfo ./luci-app-smartinfo
cp -Rf tlluci/applications/luci-app-gost ./luci-app-gost
cp -Rf tlluci/applications/luci-app-syncthing ./luci-app-syncthing
rm -rf tlluci
git clone -b openwrt-18.06 https://github.com/immortalwrt/packages tlpackages
cp -Rf tlpackages/net/gost ./gost
cp -Rf tlpackages/net/gowebdav ./gowebdav
cp -Rf tlpackages/net/udp2raw ./udp2raw
cp -Rf tlpackages/net/oscam ./oscam
cp -Rf tlpackages/net/socat ./socat
cp -Rf tlpackages/net/mentohust ./mentohust
cp -Rf tlpackages/net/kcptun ./kcptun
cp -Rf tlpackages/net/iptvhelper ./iptvhelper
cp -Rf tlpackages/utils/cpulimit-ng ./cpulimit-ng
cp -Rf tlpackages/utils/cpulimit ./cpulimit
cp -Rf tlpackages/utils/filebrowser ./filebrowser
cp -Rf tlpackages/utils/smartmontools ./smartmontools
cp -Rf tlpackages/utils/syncthing ./syncthing
rm -rf tlpackages

## Hyy2001X插件
git clone https://github.com/Hyy2001X/AutoBuild-Packages
cp -Rf AutoBuild-Packages/luci-app-natter ./luci-app-natter
cp -Rf AutoBuild-Packages/natter ./natter
cp -Rf AutoBuild-Packages/upx-static ./upx-static
cp -Rf AutoBuild-Packages/luci-app-onliner ./luci-app-onliner
cp -Rf AutoBuild-Packages/luci-app-shutdown ./luci-app-shutdown
cp -Rf AutoBuild-Packages/luci-app-webd ./luci-app-webd
cp -Rf AutoBuild-Packages/webd ./webd
rm -rf AutoBuild-Packages

## 零碎拉取的插件
git clone https://github.com/281677160/AdGuardHome ardhome && mv -f ardhome/* ./
git clone https://github.com/msylgj/luci-app-tencentddns luci-app-tencentddns
git clone https://github.com/jerrykuku/luci-app-ttnode luci-app-ttnode
git clone https://github.com/iwrt/luci-app-ikoolproxy luci-app-ikoolproxy
git clone https://github.com/ximiTech/msd_lite.git msd_lite
git clone https://github.com/ximiTech/luci-app-msd_lite.git luci-app-msd_lite
git clone https://github.com/esirplayground/luci-app-poweroff luci-app-poweroff
git clone https://github.com/NateLol/luci-app-oled luci-app-oled
git clone https://github.com/lisaac/luci-app-dockerman kerman && mv -f kerman/applications/luci-app-dockerman ./luci-app-dockerman
git clone https://github.com/rufengsuixing/luci-app-autoipsetadder luci-app-autoipsetadder

# sundaqiang
git clone https://github.com/sundaqiang/openwrt-packages sdpackages
cp -Rf sdpackages/luci-app-supervisord ./luci-app-supervisord
cp -Rf sdpackages/luci-app-nginx-manager ./luci-app-nginx-manager
rm -rf sdpackages

## luci-app-gost
git clone https://github.com/quintus-lab/openwrt-package appgost
cp -Rf appgost/luci-app-gost ./luci-app-gost
cp -Rf appgost/gost ./gost
rm -rf appgost

## N1和晶晨系列盒子专用的安装和升级固件工具
git clone https://github.com/ophub/luci-app-amlogic amlogi && cp -Rf amlogi/luci-app-amlogic ./luci-app-amlogic && rm -rf amlogi

## vssr,openclash,clash三个梯子
git clone https://github.com/jerrykuku/luci-app-vssr luci-app-vssr
git clone https://github.com/jerrykuku/lua-maxminddb lua-maxminddb
git clone https://github.com/frainzy1477/luci-app-clash luci-app-clash

## CF优先IP
git clone https://github.com/mingxiaoyu/luci-app-cloudflarespeedtest clud && cp -Rf clud/applications/luci-app-cloudflarespeedtest .//luci-app-cloudflarespeedtest
git clone https://github.com/immortalwrt-collections/openwrt-cdnspeedtest cdnspeedtest

## 拼拼WiFi，选择以下项目（必选）
## Wiwiz/PinPinWiFi -> Portal  --->
git clone https://github.com/wiwizcom/WiFiPortal Wiwiz-PinPinWiFi



## 生成完整目录清单
cat > Update.txt <<EOF
OpenAppFilter
Rclone-OpenWrt
Wiwiz-PinPinWiFi
adguardhome
alist
alist2
aliyundrive-fuse
aliyundrive-webdav
app-lucky
ardhome
assets
cdnspeedtest
clud
cpulimit-ng
cpulimit
filebrowser
gost
gowebdav
iptvhelper
kcptun
kerman
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
luci-app-cupsd
luci-app-ddns-go
luci-app-ddnsto
luci-app-dockerman
luci-app-filebrowser
luci-app-gost
luci-app-gowebdav
luci-app-ikoolproxy
luci-app-iptvhelper
luci-app-istorex
luci-app-linkease
luci-app-lucky
luci-app-mentohust
luci-app-mosdns
luci-app-msd_lite
luci-app-natter
luci-app-netwizard
luci-app-nginx-manager
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
luci-app-syncthing
luci-app-tencentddns
luci-app-timecontrol
luci-app-ttnode
luci-app-udp2raw
luci-app-unblockneteasemusic
luci-app-vssr
luci-app-webd
luci-app-wifidog
luci-app-wolplus
luci-lib-iform
lucky
mentohust
mosdns
mosdnszz
msd_lite
multimedia
nas-packages-luci
nas-packages
natter
network
oaf
open-app-filter
openwrt-subconverter
openwrt-tmate
oscam
packr
rclone-ng
rclone-webui-react
rclone
smartmontools
socat
switch-lan-play
syncthing
udp2raw
upx-static
v2dat
v2ray-geodata
webd
EOF
exit 0
