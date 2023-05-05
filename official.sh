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

svn export https://github.com/coolsnowwolf/lede/trunk/package/lean/autosamba autosamba
svn export https://github.com/openwrt/packages/branches/openwrt-22.03/utils/antfs-mount antfs-mount
svn export https://github.com/openwrt/packages/branches/openwrt-22.03/kernel/antfs antfs

svn export https://github.com/immortalwrt/luci/trunk/applications/luci-app-adbyby-plus luci-app-adbyby-plus
svn export https://github.com/immortalwrt/packages/trunk/net/adbyby adbyby

svn export https://github.com/immortalwrt/luci/trunk/applications/luci-app-softethervpn luci-app-softethervpn
svn export https://github.com/immortalwrt/luci/trunk/applications/luci-app-softethervpn5 luci-app-softethervpn5
svn export https://github.com/immortalwrt/packages/trunk/net/softethervpn softethervpn
svn export https://github.com/immortalwrt/packages/trunk/net/softethervpn softethervpn5

git clone https://github.com/lisaac/luci-app-dockerman kerman && mv -f kerman/applications/luci-app-dockerman ./luci-app-dockerman
svn export https://github.com/coolsnowwolf/packages/trunk/utils/cgroupfs-mount
svn export https://github.com/coolsnowwolf/packages/trunk/utils/docker
svn export https://github.com/coolsnowwolf/packages/trunk/utils/dockerd
svn export https://github.com/coolsnowwolf/packages/trunk/utils/containerd
svn export https://github.com/coolsnowwolf/packages/trunk/utils/libnetwork
svn export https://github.com/coolsnowwolf/packages/trunk/utils/tini
svn export https://github.com/coolsnowwolf/packages/trunk/utils/runc

svn export https://github.com/openwrt/openwrt/trunk/package/utils/bcm27xx-userland bcm27xx-userland
svn export https://github.com/coolsnowwolf/luci/trunk/collections/luci-lib-docker luci-lib-docker

svn export https://github.com/coolsnowwolf/lede/trunk/package/lean/upx
svn export https://github.com/coolsnowwolf/lede/trunk/package/lean/ucl
svn export https://github.com/coolsnowwolf/lede/trunk/package/lean/r8101
svn export https://github.com/coolsnowwolf/lede/trunk/package/lean/r8125
svn export https://github.com/coolsnowwolf/lede/trunk/package/lean/r8168

svn export https://github.com/coolsnowwolf/packages/trunk/net/frp,
svn export https://github.com/coolsnowwolf/packages/trunk/net/xfrpc


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
svn export https://github.com/immortalwrt/luci/trunk/applications/luci-app-accesscontrol luci-app-accesscontrol
git clone https://github.com/immortalwrt/Rclone-OpenWrt && mv -f Rclone-OpenWrt/* ./
git clone https://github.com/project-openwrt/openwrt-tmate openwrt-tmate
git clone https://github.com/tindy2013/openwrt-subconverter openwrt-subconverter
svn export https://github.com/immortalwrt/luci/branches/openwrt-21.02/applications/luci-app-aliddns luci-app-aliddns
svn export https://github.com/quintus-lab/openwrt-package/trunk/luci-app-gost luci-app-gost
svn export https://github.com/quintus-lab/openwrt-package/trunk/gost gost
svn export https://github.com/immortalwrt-collections/openwrt-gowebdav/trunk/luci-app-gowebdav luci-app-gowebdav
svn export https://github.com/immortalwrt-collections/openwrt-gowebdav/trunk/gowebdav gowebdav
svn export https://github.com/immortalwrt/packages/branches/openwrt-21.02/net/oscam oscam
svn export https://github.com/immortalwrt/luci/branches/openwrt-21.02/applications/luci-app-oscam luci-app-oscam
svn export https://github.com/immortalwrt-collections/luci-app-unblockneteasemusic/trunk luci-app-unblockneteasemusic
svn export https://github.com/immortalwrt/luci/branches/openwrt-21.02/applications/luci-app-udp2raw luci-app-udp2raw
svn export https://github.com/immortalwrt/packages/branches/openwrt-21.02/net/udp2raw udp2raw
svn export https://github.com/immortalwrt/luci/branches/openwrt-21.02/applications/luci-app-cpulimit luci-app-cpulimit
svn export https://github.com/immortalwrt/packages/branches/openwrt-21.02/utils/cpulimit-ng cpulimit-ng
svn export https://github.com/immortalwrt/packages/branches/openwrt-21.02/utils/cpulimit cpulimit
svn export https://github.com/immortalwrt/luci/branches/openwrt-21.02/applications/luci-app-iptvhelper luci-app-iptvhelper
svn export https://github.com/immortalwrt/packages/branches/openwrt-21.02/net/iptvhelper iptvhelper
svn export https://github.com/KFERMercer/OpenWrt/trunk/package/kferm/luci-app-smartinfo luci-app-smartinfo
svn export https://github.com/immortalwrt/packages/branches/openwrt-21.02/utils/smartmontools smartmontools
svn export https://github.com/immortalwrt/luci/branches/openwrt-21.02/applications/luci-app-mentohust luci-app-mentohust
svn export https://github.com/immortalwrt/packages/branches/openwrt-21.02/net/mentohust mentohust

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
UnblockNeteaseMusic-Go
UnblockNeteaseMusic
Wiwiz-PinPinWiFi
adbyby
adguardhome
alist
aliyundrive-webdav
antfs-mount
antfs
app-lucky
assets
autocore
automount
autosamba
baidupcs-web
bcm27xx-userland
cdnspeedtest
cgroupfs-mount
containerd
cpulimit-ng
cpulimit
ddns-scripts_aliyun
ddns-scripts_dnspod
docker
dockerd
dsmboot
feed-netkeeper
frp
gost
gowebdav
iptvhelper
ipv6-helper
k3-brcmfmac4366c-firmware
k3screenctrl
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
luci-app-nfs
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
luci-app-smartdns
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
luci-app-netwizard
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
openwrt-subconverter
openwrt-tmate
oscam
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
smartdns
smartmontools
softethervpn
softethervpn5
switch-lan-play
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
