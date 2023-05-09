#!/bin/bash
## https://github.com/281677160/AutoBuild-OpenWrt
## common Module by 28677160

## sbwml 插件
git clone https://github.com/sbwml/luci-app-alist alist2
mv alist2/* ./
git clone https://github.com/sbwml/luci-app-mosdns mosdnszz
mv mosdnszz/* ./
git clone https://github.com/sbwml/v2ray-geodata v2ray-geodata

## store 插件
git clone https://github.com/linkease/nas-packages
mv nas-packages/* ./
git clone https://github.com/linkease/nas-packages-luci
mv nas-packages-luci/luci/* ./
rm -rf luci-app-unishare
rm -rf network/services/unishare
git clone https://github.com/linkease/istore luci-app-store

## Lienol 插件
git clone -b main https://github.com/Lienol/openwrt-package Lienol-package
mv Lienol-package/* ./
rm -rf Lienol-package
git clone -b other https://github.com/Lienol/openwrt-package Lienol-packages
mv Lienol-packages/* ./
rm -rf Lienol-packages
mv lean/* ./
rm -rf lean
rm -rf mt
rm -rf luci-app-dockerman
rm -rf luci-app-kodexplorer
rm -rf luci-app-turboacc
rm -rf luci-app-adbyby-plus
rm -rf adbyby
rm -rf luci-app-timecontrol
rm -rf luci-app-softethervpn
rm -rf luci-app-softether
rm -rf luci-app-adguardhome
rm -rf adguardhome
rm -rf autosamba

# 官方的
git clone -b openwrt-22.03 https://github.com/openwrt/packages gf2203
cp -Rf gf2203/utils/antfs-mount ./antfs-mount
cp -Rf gf2203//kernel/antfs ./antfs
rm -rf gf2203

## coolsnowwolf 插件
git clone https://github.com/lisaac/luci-app-dockerman kerman && mv -f kerman/applications/luci-app-dockerman ./luci-app-dockerman
git clone https://github.com/coolsnowwolf/luci ddluci
cp -Rf ddluci/applications/luci-app-accesscontrol ./luci-app-accesscontrol
cp -Rf ddluci/applications/luci-app-serverchan ./luci-app-serverchan
cp -Rf ddluci/applications/luci-app-pushbot ./luci-app-pushbot
cp -Rf ddluci/applications/luci-app-vlmcsd ./luci-app-aliyundrive-webdav
cp -Rf ddluci/libs/luci-lib-fs ./luci-lib-fs
cp -Rf ddluci/libs/luci-lib-nixio ./luci-lib-nixio
cp -Rf ddluci/collections/luci-lib-docker ./luci-lib-docker
rm -rf ddluci
git clone https://github.com/coolsnowwolf/packages ddpackages
cp -Rf ddpackages/multimedia/aliyundrive-webdav ./aliyundrive-webdav
cp -Rf ddpackages/multimedia/aliyundrive-fuse ./aliyundrive-fuse
cp -Rf ddpackages/utils/cgroupfs-mount ./cgroupfs-mount
cp -Rf ddpackages/utils/docker ./docker
cp -Rf ddpackages/utils/dockerd ./dockerd
cp -Rf ddpackages/utils/containerd ./containerd
cp -Rf ddpackages/utils/libnetwork ./libnetwork
cp -Rf ddpackages/utils/tini ./tini
cp -Rf ddpackages/utils/runc ./runc
cp -Rf ddpackages/utils/bcm27xx-eeprom ./bcm27xx-eeprom
cp -Rf ddpackages/net/frp ./frp
cp -Rf ddpackages/net/xfrpc ./xfrpc
cp -Rf ddpackages/net/shadowsocks-libev ./shadowsocks-libev
cp -Rf ddpackages/net/kcptun ./kcptun
rm -rf ddpackages
git clone https://github.com/coolsnowwolf/lede
cp -Rf lede/package/lean/upx ./upx
cp -Rf lede/package/lean/ucl ./ucl
cp -Rf lede/package/lean/r8101 ./r8101
cp -Rf lede/package/lean/r8125 ./r8125
cp -Rf lede/package/lean/r8168 ./r8168
cp -Rf lede/package/lean/autosamba ./autosamba
cp -Rf lede/package/lean/mt ./mt
cp -Rf lede/package/utils/bcm27xx-userland ./bcm27xx-userland
rm -rf lede


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

## 天灵 插件
git clone https://github.com/immortalwrt/Rclone-OpenWrt && mv -f Rclone-OpenWrt/* ./
git clone https://github.com/project-openwrt/openwrt-tmate openwrt-tmate
git clone https://github.com/tindy2013/openwrt-subconverter openwrt-subconverter
git clone https://github.com/destan19/OpenAppFilter && mv -f OpenAppFilter/* ./

git clone -b master https://github.com/immortalwrt/luci tlluci
cp -Rf tlluci/applications/luci-app-aliddns ./luci-app-aliddns
cp -Rf tlluci/applications/luci-app-aliddns ./luci-app-adbyby-plus
cp -Rf tlluci/applications/luci-app-aliddns ./luci-app-softethervpn
cp -Rf tlluci/applications/luci-app-aliddns ./luci-app-softethervpn5
cp -Rf tlluci/applications/luci-app-gowebdav ./luci-app-gowebdav
cp -Rf tlluci/applications/luci-app-unblockneteasemusic ./luci-app-unblockneteasemusic
cp -Rf tlluci/applications/luci-app-mentohust ./luci-app-mentohust
cp -Rf tlluci/applications/luci-app-oscam ./luci-app-oscam
cp -Rf tlluci/applications/luci-app-filebrowser ./luci-app-filebrowser
cp -Rf tlluci/applications/luci-app-udp2raw ./luci-app-udp2raw
cp -Rf tlluci/applications/luci-app-cpulimit ./luci-app-cpulimit
cp -Rf tlluci/applications/luci-app-iptvhelper ./luci-app-iptvhelper
cp -Rf tlluci/applications/luci-app-syncthing ./luci-app-syncthing
cp -Rf tlluci//modules/luci-base ./luci-base
rm -rf tlluci
git clone -b master https://github.com/immortalwrt/packages tlpackages
cp -Rf tlpackages/net/adbyby ./adbyby
cp -Rf tlpackages/net/softethervpn ./softethervpn
cp -Rf tlpackages/net/softethervpn5 ./softethervpn5
cp -Rf tlpackages/net/gowebdav ./gowebdav
cp -Rf tlpackages/net/udp2raw ./udp2raw
cp -Rf tlpackages/net/oscam ./oscam
cp -Rf tlpackages/net/socat ./socat
cp -Rf tlpackages/net/mentohust ./mentohust
cp -Rf tlpackages/net/iptvhelper ./iptvhelper
cp -Rf tlpackages/utils/cpulimit-ng ./cpulimit-ng
cp -Rf tlpackages/utils/cpulimit ./cpulimit
cp -Rf tlpackages/utils/filebrowser ./filebrowser
cp -Rf tlpackages/utils/smartmontools ./smartmontools
cp -Rf tlpackages/utils/syncthing ./syncthing
rm -rf tlpackages

## Hyy2001X插件
git clone https://github.com/Hyy2001X/AutoBuild-Packages
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
git clone https://github.com/rufengsuixing/luci-app-autoipsetadder luci-app-autoipsetadder
git clone https://github.com/ximliu/luci-app-smartinfo luci-app-smartinfo

## sundaqiang
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
git clone https://github.com/mingxiaoyu/luci-app-cloudflarespeedtest clud && cp -Rf clud/applications/luci-app-cloudflarespeedtest ./luci-app-cloudflarespeedtest
git clone https://github.com/immortalwrt-collections/openwrt-cdnspeedtest cdnspeedtest

## 拼拼WiFi，选择以下项目（必选）
## Wiwiz/PinPinWiFi -> Portal  --->
git clone https://github.com/wiwizcom/WiFiPortal Wiwiz-PinPinWiFi


## 生成完整目录清单
cat > Update.txt <<EOF
OpenAppFilter
Rclone-OpenWrt
UnblockNeteaseMusic-Go
UnblockNeteaseMusic
Wiwiz-PinPinWiFi
adbyby
adguardhome
alist
alist2
aliyundrive-fuse
aliyundrive-webdav
antfs-mount
antfs
app-lucky
ardhome
assets
autocore
automount
autosamba
baidupcs-web
bcm27xx-eeprom
bcm27xx-userland
cdnspeedtest
cgroupfs-mount
clud
containerd
cpulimit-ng
cpulimit
ddns-scripts_aliyun
ddns-scripts_dnspod
docker
dockerd
dsmboot
filebrowser
frp
gost
gowebdav
iptvhelper
ipv6-helper
k3-brcmfmac4366c-firmware
k3screenctrl
kerman
libcryptopp
libnetwork
lua-maxminddb
luci-app-accesscontrol
luci-app-adbyby-plus
luci-app-adguardhome
luci-app-advanced
luci-app-aliddns
luci-app-alist
luci-app-aliyundrive-webdav
luci-app-amlogic
luci-app-arpbind
luci-app-autoipsetadder
luci-app-autoreboot
luci-app-autotimeset
luci-app-baidupcs-web
luci-app-cifs-mount
luci-app-clash
luci-app-cloudflarespeedtest
luci-app-control-timewol
luci-app-control-webrestriction
luci-app-control-weburl
luci-app-cpulimit
luci-app-cupsd
luci-app-ddns-go
luci-app-ddnsto
luci-app-diskman
luci-app-dockerman
luci-app-fileassistant
luci-app-filebrowser
luci-app-filetransfer
luci-app-frpc
luci-app-frps
luci-app-gost
luci-app-gowebdav
luci-app-guest-wifi
luci-app-ikoolproxy
luci-app-ipsec-server
luci-app-iptvhelper
luci-app-istorex
luci-app-linkease
luci-app-lucky
luci-app-mentohust
luci-app-mosdns
luci-app-msd_lite
luci-app-mwan3helper
luci-app-netdata
luci-app-netwizard
luci-app-nfs
luci-app-nginx-manager
luci-app-nginx-pingos
luci-app-nps
luci-app-oaf
luci-app-oled
luci-app-onliner
luci-app-oscam
luci-app-partexp
luci-app-poweroff
luci-app-pppoe-relay
luci-app-pppoe-server
luci-app-pptp-server
luci-app-pushbot
luci-app-qbittorrent
luci-app-quickstart
luci-app-ramfree
luci-app-rclone
luci-app-serverchan
luci-app-shutdown
luci-app-smartinfo
luci-app-socat
luci-app-softethervpn
luci-app-softethervpn5
luci-app-ssr-mudb-server
luci-app-store
luci-app-supervisord
luci-app-switch-lan-play
luci-app-syncdial
luci-app-syncthing
luci-app-tcpdump
luci-app-tencentddns
luci-app-timecontrol
luci-app-ttnode
luci-app-udp2raw
luci-app-unblockmusic
luci-app-unblockneteasemusic
luci-app-usb-printer
luci-app-uugamebooster
luci-app-verysync
luci-app-vlmcsd
luci-app-vsftpd
luci-app-vssr
luci-app-webd
luci-app-wifidog
luci-app-wolplus
luci-app-wrtbwmon
luci-app-xlnetacc
luci-app-zerotier
luci-lib-docker
luci-lib-fs
luci-lib-iform
lucky
mentohust
mosdns
mosdnszz
msd_lite
mt
multimedia
nas-packages-luci
nas-packages
network
nps
oaf
open-app-filter
openwrt-subconverter
openwrt-tmate
oscam
packr
parted
qBittorrent-static
qBittorrent
qtbase
qttools
r8101
r8125
r8168
rblibtorrent
rclone-ng
rclone-webui-react
rclone
runc
smartmontools
socat
softethervpn
softethervpn5
switch-lan-play
syncthing
tini
ucl
udp2raw
upx
uugamebooster
v2dat
v2ray-geodata
verysync
vlmcsd
vsftpd-alt
webd
xfrpc
EOF
exit 0
