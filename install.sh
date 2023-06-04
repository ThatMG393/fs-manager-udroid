#!/usr/bin/env bash

DIE() { echo -e "${@}"; exit 1 ;:;}
GWARN() { echo -e "\e[90m${*}\e[0m";:;}

apt install -y jq wget proot pv pulseaudio libandroid-shmem-static
[[ ! -d udroid/src ]] && {
    echo "udroid/src not found"
    exit 1
}

# Android version warinigs
android_version_code=$(getprop ro.system.build.version.release)
if (( android_version_code >= 12 )); then
    sleep 1
    echo
    GWARN "[Warning]: Android version ${android_version_code} detected"
    GWARN "You may experience issues like crashing"
    GWARN ""
    echo
    sleep 2
fi

cd udroid/src || exit 1
# Remove old udroid
rm -rf $(which udroid)
bash install.sh
