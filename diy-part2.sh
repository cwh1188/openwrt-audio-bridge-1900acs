#!/bin/bash

#
# Remove WiFi packages from Linksys device definitions
#
# WRT1900ACS is being used as a wired audio-network router.
# WiFi is intentionally disabled.
#


#
# Remove generic Linksys WiFi packages
#

sed -i '/define Device\/linksys$/,/^endef$/ s/kmod-mwlwifi wpad-basic-mbedtls//' \
    target/linux/mvebu/image/cortexa9.mk


#
# Remove WRT1900ACS-specific WiFi firmware
#

sed -i '/define Device\/linksys_wrt1900acs$/,/^endef$/ s/ mwlwifi-firmware-88w8864//' \
    target/linux/mvebu/image/cortexa9.mk

# 开启高级重启 (AB分区切换) 插件
echo "CONFIG_PACKAGE_luci-app-advanced-reboot=y" >> .config
