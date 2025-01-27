#!/bin/bash

set -e -u
unset LD_PRELOAD

TERMUX_ROOT="/data/data/com.termux/files"
PROOT_DLCACHE="$TERMUX_ROOT/usr/var/lib/proot-distro/dlcache"
PROOTD_DIR="$TERMUX_ROOT/usr/var/lib/proot-distro/installed-rootfs"
source ../src/proot-utils/proot-utils.sh

# works only with udroid-impish-xfce4 for now
if (p_login --path ${PROOTD_DIR}/udroid-impish-xfce4 -- echo "Hello"); then
    echo "[TEST] Login successful"
    [[ -n $RETURN_ON_FAILURE ]] && return 0
else
    echo "[TEST] Login failed"
    [[ -n $RETURN_ON_FAILURE ]] && return 0
fi
