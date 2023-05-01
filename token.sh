#!/bin/bash

# 删除一些没用的文件
find . -name '*.git*' -o -name '*.ipk' | xargs -i rm -rf {}
find . -name '*.svn' -o -name '*.md' -o -name 'LICENSE' | xargs -i rm -rf {}
rm -rf install.sh

# 增加filebrowser的用户名跟密码提示
sed -i "s/助您方便的管理设备上的文件。"/助您方便的管理设备上的文件，初始用户名跟密码都为：admin"/g" `grep "助您方便的管理设备上的文件\。" -rl ./`

po_file="$(grep -Eio "GitHub \@sirpdboy/luci-app-.*"  -rl ./)"
for a in ${po_file}
do
	sirpdboy="$(grep -Eio "GitHub \@sirpdboy/luci-app-.*" ${a} |cut -d"<" -f1)"
	[[ -n "${sirpdboy}" ]] && sed -i "s#${sirpdboy}##g" "${a}"
done
po_file2="$(grep -Eio "https://github.com/sirpdboy/luci-app-.*"  -rl ./)"
for b in ${po_file2}
do
	httpssirpdboy="$(grep -Eio "https://github.com/sirpdboy/luci-app-.*" ${b} |grep 'target' |cut -d"'" -f1)"
	[[ -n "${httpssirpdboy}" ]] && sed -i "s#${httpssirpdboy}##g" "${b}"
done
sed -i "s/For specific usage, see://" `egrep "For specific usage, see" -rl ./ |grep -v "\.po"`
sed -i "s#"设置向导"#"设置"#g" `egrep "设置向导" -rl ./`
sed -i "s?"Design 主题设置"?"Design设置"?g" `egrep "Design 主题设置" -rl ./`
sed -i "s?"网络向导"?"向导"?g" `egrep "网络向导" -rl ./`
sed -i 's/"网络存储"/"NAS"/g' `egrep "网络存储" -rl ./`
sed -i '/OpentopdTheme/d' `egrep "https://github.com/sirpdboy/luci-theme-opentopd" -rl ./`

# 修改路径
sed -i 's#include ../../luci.mk#include $(TOPDIR)/feeds/luci/luci.mk#g'  `grep "include ../../luci.mk" -rl ./`
sed -i 's#include ../../lang/golang/golang-package.mk#include $(TOPDIR)/feeds/packages/lang/golang/golang-package.mk#g'  `grep "include ../../lang/golang/golang-package.mk" -rl ./`

## 修改语言文件
curl -fsSL https://raw.githubusercontent.com/281677160/common/main/language/zh-cn.sh -o zh-cn.sh
chmod +x zh-cn.sh
/bin/bash zh-cn.sh
rm -rf zh-cn.sh

# 获取所有更新目录并显示
ls -1 -d */ |cut -d"/" -f1 > UpdateList.txt

# 对比Update.md文件里没有的内容，并生成变量
[[ -f Update.txt ]] && export FOLDERS=`grep -Fxvf UpdateList.txt Update.txt`
[[ -n "${FOLDERS}" ]] && export FOLDERSX=`echo $FOLDERS | sed 's/ /、/g'`;echo $FOLDERSX

# 提取所有luci-app
A="$(ls -1 |grep -Eo "luci-app-.*|luci-theme-.*")"
for b in ${A}
do
	mv -f ${b} ../
done

# 判断变量值，如果有效发送微信通知
if [[ -n "${FOLDERS}" ]]; then
	curl -k --data token="$PUSH_PLUS_TOKEN" --data title="${FOLDER_NAME}插件同步失败" --data "content=$FOLDERSX" "http://www.pushplus.plus/send"
fi

# 删除对比更新目录列表
rm -rf Update.txt

exit 0
