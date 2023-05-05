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
rm -rf sirpdboy-package
git clone https://github.com/sirpdboy/luci-app-partexp.git luci-app-partexp
git clone https://github.com/sirpdboy/luci-app-lucky app-lucky && mv app-lucky/* ./
git clone https://github.com/sirpdboy/luci-app-autotimeset luci-app-autotimeset
git clone https://github.com/sirpdboy/luci-app-netwizard luci-app-netwizard

## kenzok8 插件
svn export https://github.com/kenzok8/openwrt-packages/trunk/luci-app-aliyundrive-webdav luci-app-aliyundrive-webdav
svn export https://github.com/kenzok8/openwrt-packages/trunk/aliyundrive-webdav aliyundrive-webdav

## 天灵 插件
git clone https://github.com/immortalwrt/Rclone-OpenWrt && mv -f Rclone-OpenWrt/* ./
git clone https://github.com/project-openwrt/openwrt-tmate openwrt-tmate
git clone https://github.com/tindy2013/openwrt-subconverter openwrt-subconverter
svn export https://github.com/immortalwrt/luci/branches/openwrt-18.06/applications/luci-app-aliddns luci-app-aliddns
svn export https://github.com/quintus-lab/openwrt-package/trunk/luci-app-gost luci-app-gost
svn export https://github.com/quintus-lab/openwrt-package/trunk/gost gost
svn export https://github.com/immortalwrt-collections/openwrt-gowebdav/trunk/luci-app-gowebdav luci-app-gowebdav
svn export https://github.com/immortalwrt-collections/openwrt-gowebdav/trunk/gowebdav gowebdav
svn export https://github.com/immortalwrt/packages/branches/openwrt-18.06/net/oscam oscam
svn export https://github.com/immortalwrt/luci/branches/openwrt-18.06/applications/luci-app-oscam luci-app-oscam
svn export https://github.com/immortalwrt-collections/luci-app-unblockneteasemusic/trunk luci-app-unblockneteasemusic
svn export https://github.com/immortalwrt/luci/branches/openwrt-18.06/applications/luci-app-udp2raw luci-app-udp2raw
svn export https://github.com/immortalwrt/packages/branches/openwrt-18.06/net/udp2raw udp2raw
svn export https://github.com/immortalwrt/luci/branches/openwrt-18.06/applications/luci-app-cpulimit luci-app-cpulimit
svn export https://github.com/immortalwrt/packages/branches/openwrt-18.06/utils/cpulimit-ng cpulimit-ng
svn export https://github.com/immortalwrt/packages/branches/openwrt-18.06/utils/cpulimit cpulimit
svn export https://github.com/immortalwrt/luci/branches/openwrt-18.06/applications/luci-app-iptvhelper luci-app-iptvhelper
svn export https://github.com/immortalwrt/packages/branches/openwrt-18.06/net/iptvhelper iptvhelper
svn export https://github.com/KFERMercer/OpenWrt/trunk/package/kferm/luci-app-smartinfo luci-app-smartinfo
svn export https://github.com/immortalwrt/packages/branches/openwrt-18.06/utils/smartmontools smartmontools
svn export https://github.com/immortalwrt/luci/branches/openwrt-18.06/applications/luci-app-mentohust luci-app-mentohust
svn export https://github.com/immortalwrt/packages/branches/openwrt-18.06/net/mentohust mentohust

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
svn export https://github.com/quintus-lab/openwrt-package/trunk/luci-app-gost luci-app-gost
svn export https://github.com/quintus-lab/openwrt-package/trunk/gost gost
svn export https://github.com/sundaqiang/openwrt-packages/trunk/luci-app-wolplus luci-app-wolplus
svn export https://github.com/coolsnowwolf/luci/trunk/applications/luci-app-pushbot luci-app-pushbot
svn export https://github.com/coolsnowwolf/luci/trunk/applications/luci-app-cifsd luci-app-cifsd
svn export https://github.com/sundaqiang/openwrt-packages/trunk/luci-app-supervisord luci-app-supervisord

## vssr,openclash,clash三个梯子
git clone https://github.com/jerrykuku/luci-app-vssr luci-app-vssr
git clone https://github.com/jerrykuku/lua-maxminddb lua-maxminddb
git clone https://github.com/frainzy1477/luci-app-clash luci-app-clash

## N1和晶晨系列盒子专用的安装和升级固件工具
svn export https://github.com/ophub/luci-app-amlogic/trunk/luci-app-amlogic luci-app-amlogic

## CF优先IP
svn export https://github.com/mingxiaoyu/luci-app-cloudflarespeedtest/trunk/applications/luci-app-cloudflarespeedtest luci-app-cloudflarespeedtest
svn export https://github.com/immortalwrt-collections/openwrt-cdnspeedtest/trunk/cdnspeedtest cdnspeedtest

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
cpulimit-ng
cpulimit
feed-netkeeper
gost
gowebdav
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
luci-app-netwizard
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
openwrt-subconverter
openwrt-tmate
oscam
rclone-ng
rclone-webui-react
rclone
smartmontools
switch-lan-play
udp2raw
v2dat
v2ray-geodata
webd
EOF
exit 0
