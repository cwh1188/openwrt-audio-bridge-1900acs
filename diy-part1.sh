#!/bin/bash
set -e

#
# Remove unrelated IEI PUZZLE MCU patches
#
# These patches are not for Linksys WRT1900ACS.
# They caused the previous kernel patch conflict.
#

find target/linux/mvebu -type f \
    \( -iname '*wt61p803*puzzle*.patch' -o -iname '*iei*wt61p803*.patch' \) \
    -delete

#
# Remove unrelated x86 patch
#

rm -f target/linux/x86/patches/501-add-dmi-info-for-some-x86-devices.patch

#
# Hide LuCI Status menu only.
#
# Keep the Run #8 package set otherwise unchanged.
# luci-mod-admin-full depends on luci-mod-status, so simply
# setting CONFIG_PACKAGE_luci-mod-status=n cannot remove it.
# Removing only its menu definition leaves the underlying
# package dependency intact while removing the "状态" menu.
#

STATUS_MENU="feeds/luci/modules/luci-mod-status/root/usr/share/luci/menu.d/luci-mod-status.json"

if [ -f "$STATUS_MENU" ]; then
    rm -f "$STATUS_MENU"
fi

