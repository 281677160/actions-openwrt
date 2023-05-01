#!/bin/bash
# https://github.com/281677160/build-actions
# common Module by 28677160

git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon luci-theme-argon
git clone -b argon-config https://github.com/281677160/luci-theme-argon luci-app-argon-config
git clone https://github.com/gngpp/luci-theme-design.git
git clone https://github.com/gngpp/luci-app-design-config.git
git clone https://github.com/sirpdboy/luci-theme-opentopd
svn co https://github.com/Aslin-Ameng/luci-theme-Light/trunk/luci-theme-Light
git clone https://github.com/apollo-ng/luci-theme-darkmatter
svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-theme-ifit
svn co https://github.com/freifunk/openwrt-packages/trunk/themes/luci-theme-freifunk-generic
svn co https://github.com/coolsnowwolf/openwrt-gl-ax1800/trunk/extra/luci/themes/luci-theme-argon-dark-mod
svn co https://github.com/coolsnowwolf/openwrt-gl-ax1800/trunk/extra/luci/themes/luci-theme-argon-light-mod
svn co https://github.com/coolsnowwolf/openwrt-gl-ax1800/trunk/extra/luci/themes/luci-theme-Butterfly-dark
svn co https://github.com/coolsnowwolf/openwrt-gl-ax1800/trunk/extra/luci/themes/luci-theme-Butterfly
svn co https://github.com/coolsnowwolf/openwrt-gl-ax1800/trunk/extra/luci/themes/luci-theme-bootstrap-mod

git clone -b lede https://github.com/pymumu/luci-app-smartdns luci-app-smartdns
git clone https://github.com/pymumu/openwrt-smartdns smartdns


luci_file="$(grep -Eio "<%= ver.luciname %>"  -rl ./ |grep "\.htm")"
for x in ${luci_file}
do
  a="$(grep -Eio 'https://github.com/Lienol/openwrt-luci' "$x")"
  if [[ -n "${a}" ]]; then
    sed -i "s?${a}?/cgi-bin/luci/admin/status/overview?g" "$x"
  else
    a="$(grep -Eio 'https://github.com/openwrt/luci' "$x")"
    [[ -n "${a}" ]] && sed -i "s?${a}?/cgi-bin/luci/admin/status/overview?g" "$x"
  fi
  
  b="$(grep -Eio 'Powered.*<%= ver.luciname %>' "$x")"
  [[ -n "${b}" ]] && sed -i "s?${b}??g" "$x"
  
  c="$(grep -Eio '\(<%= ver.luciversion %>\)</a> /' "$x")"
  if [[ -n "${c}" ]]; then
    sed -i "s?${c}??g" "$x"
    sed -i 's?<%= ver.distversion %>?<%= ver.distversion %> </a>?g' "$x"
  else
    [[ -z "$(grep "<%= ver.distversion %>" "$x")" ]] && sed -i 's?<%= ver.luciversion %>?<%= ver.distversion %>?g' "$x"
  fi
  
  d="$(grep -Eio '<a href="https://github.com/.*%></a> /' "$x")"
  [[ -n "${d}" ]] && sed -i "s?${d}??g" "$x"
done


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
luci-theme-freifunk-generic
luci-theme-ifit
luci-theme-opentopd
smartdns
EOF
exit 0
