#!/bin/bash

#
# Remove unused x86 patch
#

rm -f target/linux/x86/patches/501-add-dmi-info-for-some-x86-devices.patch


#
# Remove unused IEI WT61P803 PUZZLE MCU patches
#
# These patches are for IEI PUZZLE hardware,
# not for Linksys WRT1900ACS.
# They also cause the current Linux 6.6 patch conflict.
#

find target/linux/mvebu/patches-6.6 \
    -type f \
    -iname '*wt61p803*puzzle*.patch' \
    -delete
