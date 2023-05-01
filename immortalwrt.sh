#!/bin/bash
# https://github.com/281677160/AutoBuild-OpenWrt
# common Module by 28677160

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

## Hyy2001X插件
svn co https://github.com/Hyy2001X/AutoBuild-Packages/trunk/luci-app-natter luci-app-natter
svn co https://github.com/Hyy2001X/AutoBuild-Packages/trunk/natter natter
svn co https://github.com/Hyy2001X/AutoBuild-Packages/trunk/luci-app-onliner luci-app-onliner
svn co https://github.com/Hyy2001X/AutoBuild-Packages/trunk/luci-app-shutdown luci-app-shutdown
svn co https://github.com/Hyy2001X/AutoBuild-Packages/trunk/luci-app-webd luci-app-webd
svn co https://github.com/Hyy2001X/AutoBuild-Packages/trunk/webd webd

## 零碎拉取的插件
svn co https://github.com/quintus-lab/openwrt-package/trunk/luci-app-gost luci-app-gost
svn co https://github.com/quintus-lab/openwrt-package/trunk/gost gost
svn co https://github.com/sundaqiang/openwrt-packages/trunk/luci-app-wolplus luci-app-wolplus
svn co https://github.com/msylgj/luci-app-tencentddns/trunk luci-app-tencentddns
svn co https://github.com/esirplayground/luci-app-poweroff/trunk luci-app-poweroff
svn co https://github.com/coolsnowwolf/luci/trunk/applications/luci-app-pushbot luci-app-pushbot
svn co https://github.com/jerrykuku/luci-app-ttnode/trunk luci-app-ttnode
svn co https://github.com/coolsnowwolf/luci/trunk/applications/luci-app-cifsd luci-app-cifsd
svn co https://github.com/iwrt/luci-app-ikoolproxy/trunk luci-app-ikoolproxy
svn co https://github.com/sundaqiang/openwrt-packages/trunk/luci-app-supervisord luci-app-supervisord
svn co https://github.com/281677160/feed-netkeeper/branches/LUCI-LUA-UCITRACK feed-netkeeper && mv feed-netkeeper/* ./

## 插件完毕

## N1和晶晨系列盒子专用的安装和升级固件工具
svn co https://github.com/ophub/luci-app-amlogic/trunk/luci-app-amlogic luci-app-amlogic

## CF优先IP
svn co https://github.com/mingxiaoyu/luci-app-cloudflarespeedtest/trunk/applications/luci-app-cloudflarespeedtest luci-app-cloudflarespeedtest

## 拼拼WiFi，选择以下项目（必选）
## Wiwiz/PinPinWiFi -> Portal  --->
git clone https://github.com/wiwizcom/WiFiPortal Wiwiz-PinPinWiFi


## 生成完整目录清单
cat > Update.txt <<EOF
Wiwiz-PinPinWiFi
adguardhome
alist
app-lucky
feed-netkeeper
gost
install.sh
luci-app-adguardhome
luci-app-advanced
luci-app-alist
luci-app-amlogic
luci-app-autotimeset
luci-app-cifsd
luci-app-cloudflarespeedtest
luci-app-ddns-go
luci-app-ddnsto
luci-app-gost
luci-app-ikoolproxy
luci-app-istorex
luci-app-linkease
luci-app-lucky
luci-app-mosdns
luci-app-natter
luci-app-netkeeper-interception
luci-app-onliner
luci-app-partexp
luci-app-poweroff
luci-app-pushbot
luci-app-quickstart
luci-app-shutdown
luci-app-store
luci-app-supervisord
luci-app-switch-lan-play
luci-app-tencentddns
luci-app-timecontrol
luci-app-ttnode
luci-app-webd
luci-app-wifidog
luci-app-wizard
luci-app-wolplus
luci-lib-iform
luci-proto-netkeeper
lucky
mosdns
mosdnszz
multimedia
nas-packages
nas-packages-luci
natter
netkeeper
netkeeper-interception
network
switch-lan-play
v2dat
v2ray-geodata
webd
EOF

exit 0
