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
