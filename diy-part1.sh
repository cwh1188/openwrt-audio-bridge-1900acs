#!/bin/bash

set -e

echo "=============================================="
echo " DIY PART 1"
echo " OpenWrt 23.05.6 / WRT1900ACS"
echo "=============================================="

#
# Remove unrelated IEI PUZZLE MCU patches.
#
# These patches are for IEI Puzzle hardware and are
# unrelated to Linksys WRT1900ACS.
#

find target/linux/mvebu -type f \
    \( \
        -iname '*wt61p803*puzzle*.patch' \
        -o -iname '*iei*wt61p803*.patch' \
    \) \
    -delete

#
# Remove unrelated x86 patch if present.
#

rm -f \
    target/linux/x86/patches/501-add-dmi-info-for-some-x86-devices.patch

#
# IMPORTANT
#
# Do NOT modify LuCI Status.
#
# Run #8 kept the Status menu.
# Run #10 intentionally keeps it unchanged.
#

echo ""
echo "DIY PART 1 completed."
echo ""
