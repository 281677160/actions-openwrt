#!/bin/bash
# https://github.com/281677160/build-actions
# common Module by 28677160

git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon luci-theme-argon
git clone -b argon-config https://github.com/281677160/luci-theme-argon luci-app-argon-config
git clone https://github.com/gngpp/luci-theme-design.git
git clone https://github.com/gngpp/luci-app-design-config.git
git clone https://github.com/sirpdboy/luci-theme-opentopd
svn export https://github.com/Aslin-Ameng/luci-theme-Light/trunk/luci-theme-Light
git clone https://github.com/apollo-ng/luci-theme-darkmatter
svn export https://github.com/sirpdboy/sirpdboy-package/trunk/luci-theme-ifit
svn export https://github.com/coolsnowwolf/openwrt-gl-ax1800/trunk/extra/luci/themes/luci-theme-argon-dark-mod
svn export https://github.com/coolsnowwolf/openwrt-gl-ax1800/trunk/extra/luci/themes/luci-theme-argon-light-mod
svn export https://github.com/coolsnowwolf/openwrt-gl-ax1800/trunk/extra/luci/themes/luci-theme-Butterfly-dark
svn export https://github.com/coolsnowwolf/openwrt-gl-ax1800/trunk/extra/luci/themes/luci-theme-Butterfly
svn export https://github.com/coolsnowwolf/openwrt-gl-ax1800/trunk/extra/luci/themes/luci-theme-bootstrap-mod

git clone -b lede https://github.com/pymumu/luci-app-smartdns luci-app-smartdns
git clone https://github.com/pymumu/openwrt-smartdns smartdns
git clone -b LUCI-LUA-UCITRACK https://github.com/281677160/feed-netkeeper  && mv feed-netkeeper/* ./

cp -Rf ${GITHUB_WORKSPACE}/README/1806cascade.css luci-theme-argon/htdocs/luci-static/argon/css/cascade.css


## 生成完整目录清单
cat > Update.txt <<EOF
luci-app-argon-config
luci-app-design-config
luci-app-smartdns
luci-theme-Butterfly-dark
luci-theme-Butterfly
luci-theme-Light
luci-theme-argon-dark-mod
luci-theme-argon-light-mod
luci-theme-argon
luci-theme-bootstrap-mod
luci-theme-darkmatter
luci-theme-design
luci-theme-ifit
luci-theme-opentopd
smartdns
EOF
exit 0
