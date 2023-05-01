#!/bin/bash
# https://github.com/281677160/build-actions
# common Module by 28677160

git clone -b master https://github.com/jerrykuku/luci-theme-argon luci-theme-argon
git clone -b argon-config https://github.com/281677160/luci-theme-argon luci-app-argon-config
git clone -b js https://github.com/gngpp/luci-theme-design.git luci-theme-design
git clone https://github.com/gngpp/luci-app-design-config.git luci-app-design-config
svn co https://github.com/immortalwrt/luci/trunk/themes/luci-theme-bootstrap-mod

git clone https://github.com/pymumu/luci-app-smartdns luci-app-smartdns
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
luci-theme-argon
luci-theme-bootstrap-mod
luci-theme-design
smartdns
EOF

exit 0
