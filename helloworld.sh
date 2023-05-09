#!/bin/bash

git clone https://github.com/fw876/helloworld.git
mv -f helloworld/* ./
rm -rf helloworld


# 生成完整目录清单
cat > Update.txt <<EOF
chinadns-ng
dns2socks
dns2tcp
gn
hysteria
ipt2socks
lua-neturl
luci-app-ssr-plus
microsocks
naiveproxy
redsocks2
shadowsocks-rust
shadowsocksr-libev
simple-obfs
tcping
trojan
v2ray-core
v2ray-geodata
v2ray-plugin
v2raya
xray-core
xray-plugin
EOF

exit 0
