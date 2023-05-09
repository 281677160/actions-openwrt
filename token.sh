#!/bin/bash

# 删除一些没用的文件
find . -name '*.git*' -o -name '*.ipk' | xargs -i rm -rf {}
find . -name '*.svn' -o -name '*.md' -o -name 'LICENSE' | xargs -i rm -rf {}
rm -rf install.sh

# 增加filebrowser的用户名跟密码提示
sed -i "s/助您方便的管理设备上的文件。"/助您方便的管理设备上的文件，初始用户名跟密码都为：admin"/g" `grep "助您方便的管理设备上的文件\。" -rl ./`

# 删除sirpdboy广告
po_file="$(grep -Eio "GitHub \@sirpdboy/luci-app-.*"  -rl ./ |grep "\.lua")"
for i in ${po_file}
do
  p="$(grep -Eio "GitHub \@sirpdboy/luci-app-.*" ${i} |cut -d"<" -f1)"
  [[ -n "${p}" ]] && sed -i "s#${p}##g" "${i}"
  o="$(grep -Eio "https://github.com/sirpdboy/luci-app-.*" ${i} |grep 'target' |cut -d"'" -f1)"
  [[ -n "${o}" ]] && sed -i "s#${o}##g" "${i}"
  y="$(grep -Eio "For specific usage, see\:" ${i})"
  [[ -n "${y}" ]] && sed -i "s#${y}##g" "${i}"
done

# 修改几个插件名称
sed -i 's?"设置向导"?"设置"?g' `egrep "设置向导" -rl ./`
sed -i 's?"Design 主题设置"?"Design设置"?g' `egrep "Design 主题设置" -rl ./`
sed -i 's?"Argon 主题设置"?"Argon设置"?g' `egrep "Argon 主题设置" -rl ./`
sed -i 's?"网络向导"?"向导"?g' `egrep "网络向导" -rl ./`
sed -i 's?"网络存储"?"NAS"?g' `egrep "网络存储" -rl ./`
sed -i 's?Powered by sundaqiang??g' `egrep "Powered by sundaqiang" -rl ./`

# 修改主题footer.htm去掉一些LUCI链接
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

# 修改路径
inc_file="$(grep -Eio "include ../../luci.mk"  -rl ./)"
for c in ${inc_file}
do
  [[ -n "${c}" ]] && sed -i 's#include ../../luci.mk#include \$(TOPDIR)/feeds/luci/luci.mk#g' "${c}"
done
lang_file="$(grep -Eio "include ../../lang/"  -rl ./)"
for g in ${lang_file}
do
  [[ -n "${g}" ]] && sed -i 's#include ../../lang/#include \$(TOPDIR)/feeds/packages/lang/#g' "${g}"
done

## 修改所有语言包为zh-cn格式，编译时按需改成zh_Hans
curl -fsSL https://raw.githubusercontent.com/281677160/common/main/language/zh-cn.sh -o zh-cn.sh
chmod +x zh-cn.sh
/bin/bash zh-cn.sh
rm -rf zh-cn.sh

# 获取所有更新目录并显示
ls -1 -d */ |cut -d"/" -f1 > UpdateList.txt

# 对比Update.md文件里没有的内容，并生成变量
[[ -f Update.txt ]] && export FOLDERS=`grep -Fxvf UpdateList.txt Update.txt`
[[ -n "${FOLDERS}" ]] && export FOLDERSX=`echo $FOLDERS | sed 's/ /、/g'`;echo $FOLDERSX

# 提取所有luci-app和luci-theme存放在根目录
A="$(ls -1 |grep -Eo "luci-app-.*|luci-theme-.*")"
for b in ${A}
do
	mv -f ${b} ../
done

# 判断变量值，如果有效发送pushplus通知
if [[ -n "${FOLDERS}" ]]; then
	curl -k --data token="$PUSH_PLUS_TOKEN" --data title="${FOLDER_NAME}插件同步失败" --data "content=$FOLDERSX" "http://www.pushplus.plus/send"
fi

# 删除对比更新目录列表
rm -rf Update.txt

exit 0
