#!/bin/bash
# https://github.com/281677160/build-actions
# common Module by 28677160
# matrix.target=${FOLDER_NAME}

function Diy_wnejian() {
if [[ -n "${INPUTS_REPO_BRANCH}" ]]; then
  REPO_URL="https://github.com/$(echo "${INPUTS_REPO_URL}" |sed s/[[:space:]]//g)"
  REPO_BRANCH="${INPUTS_REPO_BRANCH}"
  CONFIG_FILE="seed/${INPUTS_CONFIG_FILE}"
  TEMPOARY_IP="${INPUTS_TEMPOARY_IP}"
  UPLOAD_FIRMWARE="${INPUTS_UPLOAD_FIRMWARE}"
  UPLOAD_RELEASE="${INPUTS_UPLOAD_RELEASE}"
  CACHEWRTBUILD_SWITCH="${INPUTS_CACHEWRTBUILD_SWITCH}"
  CHINESE_LANGUAGE_LUCI="${INPUTS_CHINESE_LANGUAGE_LUCI}"
  DELETE_LOGIN_PASSWORD="${INPUTS_DELETE_LOGIN_PASSWORD}"
  PACKAGING_FIRMWARE="${INPUTS_PACKAGING_FIRMWARE}"
  SOURCE="$(echo "${REPO_URL}" |cut -d"/" -f4)"
  LUCI_VERSION="$(echo "${REPO_BRANCH}" |sed 's/openwrt-//g')"
  DIY_WORK="${SOURCE}$(echo "${LUCI_VERSION}" |sed "s/\.//g" |sed "s/\-//g")"
else
  REPO_URL="https://github.com/$(echo "${REPO_URL}" |sed s/[[:space:]]//g)"
  REPO_BRANCH="${REPO_BRANCH}"
  CONFIG_FILE="seed/${CONFIG_FILE}"
  TEMPOARY_IP="${TEMPOARY_IP}"
  UPLOAD_FIRMWARE="${UPLOAD_FIRMWARE}"
  UPLOAD_RELEASE="${UPLOAD_RELEASE}"
  CACHEWRTBUILD_SWITCH="${CACHEWRTBUILD_SWITCH}"
  CHINESE_LANGUAGE_LUCI="${CHINESE_LANGUAGE_LUCI}"
  DELETE_LOGIN_PASSWORD="${DELETE_LOGIN_PASSWORD}"
  PACKAGING_FIRMWARE="${PACKAGING_FIRMWARE}"
  SOURCE="$(echo "${REPO_URL}" |cut -d"/" -f4)"
  LUCI_VERSION="$(echo "${REPO_BRANCH}" |sed 's/openwrt-//g')"
  DIY_WORK="${SOURCE}$(echo "${LUCI_VERSION}" |sed "s/\.//g" |sed "s/\-//g")"
fi

echo "REPO_URL=${REPO_URL}" >> ${GITHUB_ENV}
echo "REPO_BRANCH=${REPO_BRANCH}" >> ${GITHUB_ENV}
echo "CONFIG_FILE=${CONFIG_FILE}" >> ${GITHUB_ENV}
echo "TEMPOARY_IP=${TEMPOARY_IP}" >> ${GITHUB_ENV}
echo "UPLOAD_FIRMWARE=${UPLOAD_FIRMWARE}" >> ${GITHUB_ENV}
echo "UPLOAD_RELEASE=${UPLOAD_RELEASE}" >> ${GITHUB_ENV}
echo "CACHEWRTBUILD_SWITCH=${CACHEWRTBUILD_SWITCH}" >> ${GITHUB_ENV}
echo "CHINESE_LANGUAGE_LUCI=${CHINESE_LANGUAGE_LUCI}" >> ${GITHUB_ENV}
echo "DELETE_LOGIN_PASSWORD=${DELETE_LOGIN_PASSWORD}" >> ${GITHUB_ENV}
echo "PACKAGING_FIRMWARE=${PACKAGING_FIRMWARE}" >> ${GITHUB_ENV}
echo "SOURCE=${SOURCE}" >> $GITHUB_ENV
echo "LUCI_VERSION=${LUCI_VERSION}" >> $GITHUB_ENV
echo "DIY_WORK=${DIY_WORK}" >> $GITHUB_ENV
echo "FOLDER_NAME=${FOLDER_NAME}" >> ${GITHUB_ENV}
echo "DIY_PART_SH=${DIY_PART_SH}" >> ${GITHUB_ENV}
echo "GIT_REPOSITORY=${GIT_REPOSITORY}" >> $GITHUB_ENV
echo "REPO_TOKEN=${REPO_TOKEN}" >> $GITHUB_ENV
echo "CLEAR_PATH=${GITHUB_WORKSPACE}/openwrt/Sc_clear" >> ${GITHUB_ENV}
echo "HOME_PATH=${GITHUB_WORKSPACE}/openwrt" >> $GITHUB_ENV
echo "BUILD_PATH=${GITHUB_WORKSPACE}/openwrt/build" >> $GITHUB_ENV

if [[ ! -f "$GITHUB_WORKSPACE/build/${FOLDER_NAME}/${CONFIG_FILE}" ]]; then
  echo -e "\033[31m [${FOLDER_NAME}/${CONFIG_FILE}]文件不存在 \033[0m"
  echo -e "\033[32m 请先创建【$(echo "${CONFIG_FILE}" |cut -d"/" -f2)】文件 \033[0m"
  echo
  exit 1
elif [[ ! -f "$GITHUB_WORKSPACE/build/${FOLDER_NAME}/${DIY_PART_SH}" ]]; then
  echo -e "\033[31m [${FOLDER_NAME}/${DIY_PART_SH}]文件不存在 \033[0m"
  echo -e "\033[32m 请勿删除【${DIY_PART_SH}】文件 \033[0m"
  echo
  exit 1
elif [[ ! -d "${GITHUB_WORKSPACE}/build/${FOLDER_NAME}" ]]; then
  echo -e "\033[31m [build]文件夹里,[${FOLDER_NAME}]名称文件不存在 \033[0m"
  echo
  exit 1
elif [[ ! -f "${GITHUB_WORKSPACE}/common/common.sh" ]]; then
  echo -e "\033[31m [common]文件夹里,[common.sh]文件不存在,请勿删除或随意修改此文件 \033[0m"
  echo
  exit 1
fi
}


function Diy_checkout() {
cd ${HOME_PATH}
cp -Rf $GITHUB_WORKSPACE/build/${FOLDER_NAME} ${BUILD_PATH}
cp -Rf $GITHUB_WORKSPACE/common/*.sh ${BUILD_PATH}/
sudo chmod -R +x ${HOME_PATH}/build

LUCI_CHECKUT="$(git tag -l |grep '^V\|^v' |awk 'END {print}')"
if [[ -n "${LUCI_CHECKUT}" ]]; then
  git checkout ${LUCI_CHECKUT}
  git switch -c ${LUCI_CHECKUT}
  git pull
fi

./scripts/feeds update -a

App_path="$(find . -type d -name "applications" |grep 'luci' |sed "s?.?${HOME_PATH}?" |awk 'END {print}')"
if [[ `find "${App_path}" -type d -name "zh_Hans" |grep -c "zh_Hans"` -gt '20' ]]; then
  LUCI_BANBEN="2"
  echo "LUCI_BANBEN=${LUCI_BANBEN}" >> $GITHUB_ENV
else
  LUCI_BANBEN="1"
  echo "LUCI_BANBEN=${LUCI_BANBEN}" >> $GITHUB_ENV
fi

z="*luci-theme-argon*,*luci-app-argon-config*,*luci-theme-Butterfly*,*luci-theme-netgear*,*luci-theme-atmaterial*,*luci-app-netkeeper*, \
luci-theme-rosy,luci-theme-darkmatter,luci-theme-infinityfreedom,luci-theme-design,luci-app-design-config, \
luci-theme-bootstrap-mod,luci-theme-freifunk-generic,luci-theme-opentomato,*luci-app-smartdns*,*smartdns*"
t=(${z//,/ })
for x in ${t[@]}; do \
  find . -type d -name "${x}" |grep -v 'freifunk' |xargs -i rm -rf {}; \
done
if [[ "${LUCI_BANBEN}" == "2" ]]; then
  git clone -b Theme2 --depth 1 https://github.com/281677160/openwrt-package ${HOME_PATH}/package/theme_pkg > /dev/null 2>&1
else
  git clone -b Theme1 --depth 1 https://github.com/281677160/openwrt-package ${HOME_PATH}/package/theme_pkg > /dev/null 2>&1
fi

Settings_path="$(find "${HOME_PATH}/package" -type d -name "default-settings")"
if [[ -z "${Settings_path}" ]] && [[ "${LUCI_BANBEN}" == "2" ]]; then
  [[ -d "${GITHUB_WORKSPACE}/common/zh_Hans" ]] && cp -Rf ${GITHUB_WORKSPACE}/common/zh_Hans ${HOME_PATH}/package/default-settings
  [[ ! -d "${HOME_PATH}/feeds/luci/libs/luci-lib-base" ]] && sed -i "s/+luci-lib-base //g" ${HOME_PATH}/package/default-settings/Makefile
elif [[ -z "${Settings_path}" ]] && [[ "${LUCI_BANBEN}" == "1" ]]; then
  [[ -d "${GITHUB_WORKSPACE}/common/zh-cn" ]] && cp -Rf ${GITHUB_WORKSPACE}/common/zh-cn ${HOME_PATH}/package/default-settings
fi
ZZZ_PATH="$(find "${HOME_PATH}/package" -type f -name "*default-settings" |grep files)"
[[ -n "${ZZZ_PATH}" ]] && echo "ZZZ_PATH=${ZZZ_PATH}" >> $GITHUB_ENV

[[ -d "${BUILD_PATH}/diy" ]] && cp -Rf ${BUILD_PATH}/diy/* ${HOME_PATH}/
[[ -d "${BUILD_PATH}/files" ]] && mv -f ${BUILD_PATH}/files ${HOME_PATH}/files
rm -rf ${HOME_PATH}/README ${HOME_PATH}/files/README
if [[ -d "${BUILD_PATH}/patches" ]]; then
  find "${BUILD_PATH}/patches" -type f -name '*.patch' -print0 | sort -z | xargs -I % -t -0 -n 1 sh -c "cat '%'  | patch -d './' -p1 --forward --no-backup-if-mismatch"
fi
}


function Diy_partsh() {
cd ${HOME_PATH}
source ${BUILD_PATH}/${DIY_PART_SH}
cat feeds.conf.default|awk '!/^#/'|awk '!/^$/'|awk '!a[$1" "$2]++{print}' >uniq.conf
mv -f uniq.conf feeds.conf.default
./scripts/feeds update -a

case "${CHINESE_LANGUAGE_LUCI}" in
true)
  if [[ -d "${HOME_PATH}/package/emortal" ]]; then
    if [[ -z "$(grep "default-settings-chn" ${HOME_PATH}/include/target.mk)" ]]; then
      sed -i 's?DEFAULT_PACKAGES:=?DEFAULT_PACKAGES:=default-settings-chn default-settings luci luci-newapi luci-lib-fs ?g' "${HOME_PATH}/include/target.mk"
    fi
  else
    if [[ -z "$(grep "default-settings" ${HOME_PATH}/include/target.mk)" ]]; then
      sed -i 's?DEFAULT_PACKAGES:=?DEFAULT_PACKAGES:=default-settings luci luci-newapi luci-lib-fs ?g' "${HOME_PATH}/include/target.mk"
    fi
  fi
;;
esac

GENERATE_PATH="${HOME_PATH}/package/base-files/files/bin/config_generate"
IPADDR="$(grep "ipaddr:-" "${GENERATE_PATH}" |grep -v 'addr_offset' |grep -Eo "[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+")"
if [[ -n "${TEMPOARY_IP}" ]]; then
  if [[ -n "$(echo ${TEMPOARY_IP} |grep -Eo "[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+")" ]]; then
    if [[ "${IPADDR}" != "${TEMPOARY_IP}" ]]; then
      sed -i "s/${IPADDR}/${TEMPOARY_IP}/g" "${GENERATE_PATH}"
      echo "TEMPOARY_IP=${TEMPOARY_IP}" >> ${GITHUB_ENV}
    else
      echo "TEMPOARY_IP=${IPADDR}" >> ${GITHUB_ENV}
    fi
  else
    echo "TEMPOARY_IP=${IPADDR}" >> ${GITHUB_ENV}
  fi
fi

case "${PACKAGING_FIRMWARE}" in
true)
if [[ -n "${amlogic_model}" ]]; then
  echo "amlogic_model=${amlogic_model}" >> ${GITHUB_ENV}
else
  echo "amlogic_model=s905d" >> ${GITHUB_ENV}
fi
if [[ -n "${amlogic_kernel}" ]]; then
  echo "amlogic_kernel=${amlogic_kernel}" >> ${GITHUB_ENV}
else
  echo "amlogic_kernel=5.10.172" >> ${GITHUB_ENV}
fi
if [[ -n "${auto_kernel}" ]]; then
  echo "auto_kernel=${auto_kernel}" >> ${GITHUB_ENV}
else
  echo "auto_kernel=true" >> ${GITHUB_ENV}
fi
if [[ -n "${rootfs_size}" ]]; then
  echo "rootfs_size=${rootfs_size}" >> ${GITHUB_ENV}
else
  echo "rootfs_size=2560" >> ${GITHUB_ENV}
fi
echo "kernel_repo=ophub/kernel" >> ${GITHUB_ENV}
if [[ -n "${kernel_usage}" ]]; then
  echo "kernel_usage=${kernel_usage}" >> ${GITHUB_ENV}
else
  echo "kernel_usage=stable" >> ${GITHUB_ENV}
fi
;;
esac

./scripts/feeds install -a > /dev/null 2>&1

if [[ "${LUCI_BANBEN}" == "2" ]]; then
  if [[ -f "${GITHUB_WORKSPACE}/common/zh_Hans.sh" ]]; then
    cp -Rf ${GITHUB_WORKSPACE}/common/zh_Hans.sh ${HOME_PATH}/zh_Hans.sh
    /bin/bash ${HOME_PATH}/zh_Hans.sh
  fi
else
  if [[ -f "${GITHUB_WORKSPACE}/common/zh-cn.sh" ]]; then
    cp -Rf ${GITHUB_WORKSPACE}/common/zh-cn.sh ${HOME_PATH}/zh-cn.sh
    /bin/bash ${HOME_PATH}/zh-cn.sh
  fi
fi

./scripts/feeds install -a

if [[ -f "${BUILD_PATH}/${CONFIG_FILE}" ]]; then
  cp -Rf ${BUILD_PATH}/${CONFIG_FILE} ${HOME_PATH}/.config
fi

if [[ "${CHINESE_LANGUAGE_LUCI}" == "true" ]]; then
  echo "CONFIG_PACKAGE_luci=y" >> ${HOME_PATH}/.config
  echo "CONFIG_PACKAGE_default-settings=y" >> ${HOME_PATH}/.config
  echo "CONFIG_PACKAGE_default-settings-chn=y" >> ${HOME_PATH}/.config
  [[ -f "${ZZZ_PATH}" ]] && sed -i "s?main.lang=.*?main.lang='zh_cn'?g" "${ZZZ_PATH}"
fi
}


function Diy_config() {
cd ${HOME_PATH}
TARGET_BOARD="$(awk -F '[="]+' '/TARGET_BOARD/{print $2}' ${HOME_PATH}/.config)"
TARGET_SUBTARGET="$(awk -F '[="]+' '/TARGET_SUBTARGET/{print $2}' ${HOME_PATH}/.config)"
TARGET_PROFILE_DG="$(awk -F '[="]+' '/TARGET_PROFILE/{print $2}' ${HOME_PATH}/.config)"
REPAIR_PATH="${HOME_PATH}/package/base-files/files/etc/openwrt_release"
FIRMWARE_PATH="${HOME_PATH}/bin/targets/${TARGET_BOARD}/${TARGET_SUBTARGET}"
if [[ `grep -c 'CONFIG_TARGET_x86_64=y' ${HOME_PATH}/.config` -eq '1' ]]; then
  TARGET_PROFILE="x86-64"
elif [[ `grep -c 'CONFIG_TARGET_x86=y' ${HOME_PATH}/.config` -eq '1' ]]; then
  TARGET_PROFILE="x86-32"
elif [[ `grep -c 'CONFIG_TARGET_armvirt_64=y' ${HOME_PATH}/.config` -eq '1' ]]; then
  TARGET_PROFILE="Armvirt_64"
  echo "CONFIG_TARGET_ROOTFS_TARGZ=y" >> "${HOME_PATH}/.config"
  if [[ "${SOURCE}" == "openwrt" ]]; then
    echo -e "\nDISTRIB_SOURCECODE='official_${LUCI_VERSION}'" >> "${REPAIR_PATH}" && sed -i '/^\s*$/d' "${REPAIR_PATH}"
  else
    echo -e "\nDISTRIB_SOURCECODE='${SOURCE}_${LUCI_VERSION}'" >> "${REPAIR_PATH}" && sed -i '/^\s*$/d' "${REPAIR_PATH}"
  fi
elif [[ `grep -Ec "CONFIG_TARGET.*DEVICE.*=y" ${HOME_PATH}/.config` -eq '1' ]]; then
  TARGET_PROFILE="$(grep -Eo "CONFIG_TARGET.*DEVICE.*=y" ${HOME_PATH}/.config | sed -r 's/.*DEVICE_(.*)=y/\1/')"
else
  TARGET_PROFILE="${TARGET_PROFILE_DG}"
fi

KERNEL_PATCH="$(grep -Eo "KERNEL_PATCHVER.*[0-9.]+" "${HOME_PATH}/target/linux/${TARGET_BOARD}/Makefile" |grep -Eo "[0-9.]+")"
KERNEL_VERSINO="kernel-${KERNEL_PATCH}"
if [[ -f "${HOME_PATH}/include/${KERNEL_VERSINO}" ]]; then
  LINUX_KERNEL="$(grep -Eo "LINUX_KERNEL_HASH-[0-9.]+" "${HOME_PATH}/include/${KERNEL_VERSINO}"  |grep -Eo "[0-9.]+")"
  [[ -z ${LINUX_KERNEL} ]] && LINUX_KERNEL="nono"
else
  LINUX_KERNEL="$(grep -Eo "LINUX_KERNEL_HASH-${KERNEL_PATCH}.[0-9]+" "${HOME_PATH}/include/kernel-version.mk" |grep -Eo "[0-9.]+")"
  [[ -z ${LINUX_KERNEL} ]] && LINUX_KERNEL="nono"
fi

echo "TARGET_BOARD=${TARGET_BOARD}" >> ${GITHUB_ENV}
echo "TARGET_SUBTARGET=${TARGET_SUBTARGET}" >> ${GITHUB_ENV}
echo "TARGET_PROFILE=${TARGET_PROFILE}" >> ${GITHUB_ENV}
echo "FIRMWARE_PATH=${FIRMWARE_PATH}" >> ${GITHUB_ENV}
echo "LINUX_KERNEL=${LINUX_KERNEL}" >> ${GITHUB_ENV}

mkdir -p ${GITHUB_WORKSPACE}/ConFig
./scripts/diffconfig.sh > ${GITHUB_WORKSPACE}/ConFig/config.txt
d="CONFIG_CGROUPFS_MOUNT_KERNEL_CGROUPS=y,CONFIG_DOCKER_CGROUP_OPTIONS=y,CONFIG_DOCKER_NET_MACVLAN=y,CONFIG_DOCKER_STO_EXT4=y, \
CONFIG_KERNEL_CGROUP_DEVICE=y,CONFIG_KERNEL_CGROUP_FREEZER=y,CONFIG_KERNEL_CGROUP_NET_PRIO=y,CONFIG_KERNEL_EXT4_FS_POSIX_ACL=y,CONFIG_KERNEL_EXT4_FS_SECURITY=y, \
CONFIG_KERNEL_FS_POSIX_ACL=y,CONFIG_KERNEL_NET_CLS_CGROUP=y,CONFIG_PACKAGE_btrfs-progs=y,CONFIG_PACKAGE_cgroupfs-mount=y, \
CONFIG_PACKAGE_containerd=y,CONFIG_PACKAGE_docker=y,CONFIG_PACKAGE_dockerd=y,CONFIG_PACKAGE_fdisk=y,CONFIG_PACKAGE_kmod-asn1-encoder=y,CONFIG_PACKAGE_kmod-br-netfilter=y, \
CONFIG_PACKAGE_kmod-crypto-rng=y,CONFIG_PACKAGE_kmod-crypto-sha256=y,CONFIG_PACKAGE_kmod-dax=y,CONFIG_PACKAGE_kmod-dm=y,CONFIG_PACKAGE_kmod-dummy=y,CONFIG_PACKAGE_kmod-fs-btrfs=y, \
CONFIG_PACKAGE_kmod-ikconfig=y,CONFIG_PACKAGE_kmod-keys-encrypted=y,CONFIG_PACKAGE_kmod-keys-trusted=y,CONFIG_PACKAGE_kmod-lib-raid6=y,CONFIG_PACKAGE_kmod-lib-xor=y, \
CONFIG_PACKAGE_kmod-lib-zstd=y,CONFIG_PACKAGE_kmod-nf-ipvs=y,CONFIG_PACKAGE_kmod-oid-registry=y,CONFIG_PACKAGE_kmod-random-core=y,CONFIG_PACKAGE_kmod-tpm=y, \
CONFIG_PACKAGE_kmod-veth=y,CONFIG_PACKAGE_libdevmapper=y,CONFIG_PACKAGE_liblzo=y,CONFIG_PACKAGE_libnetwork=y,CONFIG_PACKAGE_libseccomp=y,CONFIG_PACKAGE_luci-i18n-docker-zh-cn=y, \
CONFIG_PACKAGE_luci-i18n-dockerman-zh-cn=y,CONFIG_PACKAGE_luci-lib-docker=y,CONFIG_PACKAGE_mount-utils=y,CONFIG_PACKAGE_runc=y,CONFIG_PACKAGE_tini=y,CONFIG_PACKAGE_naiveproxy=y"
k=(${d//,/ })
for x in ${k[@]}; do \
  sed -i "s#${x}##g" "${GITHUB_WORKSPACE}/ConFig/config.txt"; \
done
sed -i '/^$/d' "${GITHUB_WORKSPACE}/ConFig/config.txt"
echo "CON_DATE=$(date +"%Y.%m%d.%H%M")" >> $GITHUB_ENV
}


function Diy_organize() {
cd ${FIRMWARE_PATH}
mkdir -p ipk-package
cp -rf $(find ${HOME_PATH}/bin/packages/ -type f -name "*.ipk") ipk-package/ && sync
sudo tar -czf ipk-package.tar.gz ipk-package && sync
if [[ "${PACKAGING_FIRMWARE}" == "true" ]] && [[ `ls -1 |grep -Eoc "armvirt.*64.*rootfs.*tar.gz"` -eq '1' ]] && [[ -n "${REPO_TOKEN}" ]]; then
  root_targz="$(ls -1 |grep -E "64.*rootfs.*tar.gz")"
  echo "PACK_RELEASE=${UPLOAD_RELEASE}" >> $GITHUB_ENV
  echo "UPLOAD_RELEASE=true" >> $GITHUB_ENV
  echo "FILE_TAG=targz" >> $GITHUB_ENV
  echo "FILE_NAME=rootfs.tar.gz" >> $GITHUB_ENV
  echo "FIRMWARE=*rootfs.tar.gz" >> $GITHUB_ENV
  echo "date=$(date +'%m.%d')" >> $GITHUB_ENV
  echo "FILE_DATE=$(date +"%Y.%m%d.%H%M")" >> $GITHUB_ENV
  mv -f ${FIRMWARE_PATH}/${root_targz} ${FIRMWARE_PATH}/ipk-package/${SOURCE}-armvirt-64-default-rootfs.tar.gz
  cp -Rf ${FIRMWARE_PATH}/ipk-package/*rootfs.tar.gz ${FIRMWARE_PATH}/${SOURCE}-armvirt-64-default-rootfs.tar.gz
else
  echo "FILE_TAG=$(date +"%Y%m%d%H%M%S")" >> $GITHUB_ENV
  echo "FILE_NAME=${SOURCE}-${LUCI_VERSION}-${LINUX_KERNEL}-${TARGET_PROFILE}" >> $GITHUB_ENV
  echo "FIRMWARE=*" >> $GITHUB_ENV
  echo "date=$(date +'%m.%d')" >> $GITHUB_ENV
  echo "FILE_DATE=$(date +"%Y.%m%d.%H%M")" >> $GITHUB_ENV
  echo "PACKAGING_FIRMWARE=false" >> $GITHUB_ENV
fi
sudo rm -rf ipk-package
for X in $(cat ${CLEAR_PATH} |sed "s/.*${TARGET_BOARD}//g"); do
  rm -rf *"$X"*
done
}

function Packaged_services() {
REPOS_ITORY="${GITHUB_WORKSPACE}/REPOSITORY"
TRIGGER_PROGRAM="${REPOS_ITORY}/build/${FOLDER_NAME}/relevance"
git clone -b main https://github.com/${GIT_REPOSITORY}.git ${REPOS_ITORY}

[[ ! -d "${TRIGGER_PROGRAM}" ]] && mkdir -p "${TRIGGER_PROGRAM}"

YML_PATH="${REPOS_ITORY}/.github/workflows/packaging.yml"
cp -Rf ${GITHUB_WORKSPACE}/.github/workflows/packaging.yml ${YML_PATH}
PATHS1="$(grep -A 5 'paths:' "${YML_PATH}" |sed 's/^[ ]*//g' |grep -v "^#" |grep -Eo "\- '.*'" |awk 'NR==1')"
PATHS2="- 'build/${FOLDER_NAME}/relevance/start'"
SOURCE_NAME1="$(grep 'SOURCE:' "${YML_PATH}"|sed 's/^[ ]*//g' |grep -v "^#" |awk 'NR==1')"
SOURCE_NAME2="SOURCE: ${SOURCE}"
FOLDER_NE1="$(grep 'FOLDER_NAME:' "${YML_PATH}"|sed 's/^[ ]*//g' |grep -v "^#" |awk 'NR==1')"
FOLDER_NE2="FOLDER_NAME: ${FOLDER_NAME}"

if [[ -n "${PATHS1}" ]] && [[ -n "${SOURCE_NAME1}" ]] && [[ -n "${FOLDER_NE1}" ]]; then
  sed -i "s?${PATHS1}?${PATHS2}?g" "${YML_PATH}"
  sed -i "s?${SOURCE_NAME1}?${SOURCE_NAME2}?g" "${YML_PATH}"
  sed -i "s?${FOLDER_NE1}?${FOLDER_NE2}?g" "${YML_PATH}"
else
  echo "获取变量失败,请勿胡乱修改packaging.yml文件和文件名称"
  exit 1
fi

cat >"${TRIGGER_PROGRAM}/start" <<-EOF
Trigger packaging ${SOURCE} program-$(date +%Y%m%d%H%M%S)
EOF

cat >"${TRIGGER_PROGRAM}/start.ini" <<-EOF
amlogic_model="${amlogic_model}"
amlogic_kernel="${amlogic_kernel}"
auto_kernel="${auto_kernel}"
rootfs_size="${rootfs_size}"
kernel_repo="ophub/kernel"
kernel_usage="${kernel_usage}"
SOURCE="${SOURCE}"
LUCI_VERSION="${LUCI_VERSION}"
UPLOAD_FIRMWARE="${UPLOAD_FIRMWARE}"
UPLOAD_RELEASE="${PACK_RELEASE}"
EOF

chmod -R +x ${REPOS_ITORY}
cd ${REPOS_ITORY}
git add .
git commit -m "打包${SOURCE}-${amlogic_model}固件"
git push --force "https://${REPO_TOKEN}@github.com/${GIT_REPOSITORY}" HEAD:main
}


function Package_amlogic() {
if [[ `ls -1 "${GITHUB_WORKSPACE}/openwrt" |grep -Eoc "64.*rootfs.*tar.gz"` -eq '1' ]]; then
  mkdir -p ${GITHUB_WORKSPACE}/openwrt/temp_dir
  cp -Rf ${GITHUB_WORKSPACE}/openwrt/*tar.gz ${GITHUB_WORKSPACE}/openwrt/temp_dir/openwrt-armvirt-64-default-rootfs.tar.gz && sync
  tar -xzf ${GITHUB_WORKSPACE}/openwrt/temp_dir/openwrt-armvirt-64-default-rootfs.tar.gz -C ${GITHUB_WORKSPACE}/openwrt/temp_dir/
  if [[ `grep -c "DISTRIB_SOURCECODE" ${GITHUB_WORKSPACE}/openwrt/temp_dir/etc/openwrt_release` -eq '1' ]]; then
    source_codename="$(cat "${GITHUB_WORKSPACE}/openwrt/temp_dir/etc/openwrt_release" 2>/dev/null | grep -oE "^DISTRIB_SOURCECODE=.*" | head -n 1 | cut -d"'" -f2)"
    echo "source_codename=${source_codename}" >> ${GITHUB_ENV}
    echo "build_name=${source_codename}_${amlogic_model}_$(date +"%m.%d.%H%M")" >> ${GITHUB_ENV}
    sudo rm -rf ${GITHUB_WORKSPACE}/openwrt/temp_dir
  else
    source_codename="armvirt"
    echo "source_codename=${source_codename}" >> ${GITHUB_ENV}
    echo "build_name=${source_codename}_${amlogic_model}_$(date +"%m.%d.%H%M")" >> ${GITHUB_ENV}
    sudo rm -rf ${GITHUB_WORKSPACE}/openwrt/temp_dir
  fi
else
  echo -e "\033[31m 没发现armvirt-64-default-rootfs.tar.gz固件存在 \033[0m"
  exit 1
fi
}


function Diy_xinxi() {
CPU_MODEL="$(cat /proc/cpuinfo |grep 'model name' |gawk -F : '{print $2}' |uniq -c |sed 's/^ \+[0-9]\+ //g' |sed 's/^[ ]*//g')"
echo
echo -e "\033[32m 固件源码: ${SOURCE} \033[0m"
echo -e "\033[32m 源码链接: ${REPO_URL} \033[0m"
echo -e "\033[32m 源码分支: ${REPO_BRANCH} \033[0m"
echo -e "\033[32m 配置文件: $(echo "${CONFIG_FILE}" |cut -d"/" -f2) \033[0m"
echo -e "\033[32m 编译机型: ${TARGET_PROFILE} \033[0m"
echo -e "\033[32m 后台地址: ${TEMPOARY_IP} \033[0m"
if [[ "${PACKAGING_FIRMWARE}" == "true" ]] && [[ `grep -c 'CONFIG_TARGET_armvirt_64=y' ${HOME_PATH}/.config` -eq '1' ]]; then
  echo -e "\033[32m 内核版本: 以打包内核为准 \033[0m"
  echo
  echo -e "\033[34m 打包机型: ${amlogic_model} \033[0m"
  echo -e "\033[34m 打包内核: ${amlogic_kernel} \033[0m"
  echo -e "\033[34m 自动检测最新版内核: ${auto_kernel} \033[0m"
  echo -e "\033[34m ROOTFS大小: ${rootfs_size} \033[0m"
  echo -e "\033[34m 内核仓库: ${kernel_usage} \033[0m"
else
  echo -e "\033[32m 内核版本: ${LINUX_KERNEL} \033[0m"
  echo "PACKAGING_FIRMWARE=false" >> ${GITHUB_ENV}
fi
echo
echo -e "\033[35m  系统空间      类型  总数   已用  可用 使用率 \033[0m"
df -hT $PWD
echo
echo -e "\033[35m 服务器CPU: ${CPU_MODEL} \033[0m"
echo
if [[ "${UPLOAD_FIRMWARE}" == "true" ]]; then
  echo -e "\033[33m 上传固件在Artifacts: 开启 \033[0m"
else
  echo -e "\033[31m 上传固件在Artifacts: 关闭 \033[0m"
fi
if [[ "${UPLOAD_RELEASE}" == "true" ]]; then
  echo -e "\033[33m 发布固件(Releases): 开启 \033[0m"
else
  echo -e "\033[31m 发布固件(Releases): 关闭 \033[0m"
fi
if [[ "${CACHEWRTBUILD_SWITCH}" == "true" ]]; then
  echo -e "\033[33m 是否开启缓存加速: 开启 \033[0m"
else
  echo -e "\033[31m 是否开启缓存加速: 关闭 \033[0m"
fi
if [[ "${CHINESE_LANGUAGE_LUCI}" == "true" ]]; then
  echo -e "\033[33m 使用中文LUCI: 开启 \033[0m"
else
  echo -e "\033[31m 使用中文LUCI: 关闭 \033[0m"
fi
if [[ "${DELETE_LOGIN_PASSWORD}" == "true" ]]; then
  echo -e "\033[33m 首次安装固件,免密登录固件设置: 开启 \033[0m"
else
  echo -e "\033[31m 首次安装固件,免密登录固件设置: 关闭 \033[0m"
fi
if [[ "${PACKAGING_FIRMWARE}" == "true" ]]; then
  echo -e "\033[33m 自动打包Amlogic或Rockchip固件: 开启 \033[0m"
else
  echo -e "\033[31m 自动打包Amlogic或Rockchip固件: 关闭 \033[0m"
fi
echo
}
