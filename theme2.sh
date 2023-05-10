#!/bin/bash
# https://github.com/281677160/build-actions
# common Module by 28677160

git clone -b master https://github.com/281677160/luci-theme-argon luci-theme-argon
git clone -b argon-config https://github.com/281677160/luci-theme-argon luci-app-argon-config
git clone -b js https://github.com/gngpp/luci-theme-design.git luci-theme-design
git clone https://github.com/gngpp/luci-app-design-config.git luci-app-design-config
svn export https://github.com/immortalwrt/luci/trunk/themes/luci-theme-bootstrap-mod

git clone https://github.com/pymumu/luci-app-smartdns luci-app-smartdns
git clone https://github.com/pymumu/openwrt-smartdns smartdns
git clone -b master https://github.com/281677160/feed-netkeeper  && mv feed-netkeeper/* ./


## 生成完整目录清单
cat > Update.txt <<EOF
feed-netkeeper
luci-app-argon-config
luci-app-design-config
luci-app-netkeeper-interception
luci-app-smartdns
luci-proto-netkeeper
luci-theme-argon
luci-theme-bootstrap-mod
luci-theme-design
netkeeper-interception
netkeeper
smartdns
EOF

exit 0
