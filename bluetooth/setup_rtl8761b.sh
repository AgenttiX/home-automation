#!/usr/bin/env bash
set -e

# Driver/firmware installer for RTL8761B
# https://linuxreviews.org/Realtek_RTL8761B

if [ "${EUID}" -ne 0 ]; then
   echo "This script should be run as root."
   exit 1
fi

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

wget -O "rtl8761b_config.bin" "https://raw.githubusercontent.com/Realtek-OpenSource/android_hardware_realtek/rtk1395/bt/rtkbt/Firmware/BT/rtl8761b_config"
wget -O "rtl8761b_fw.bin" "https://raw.githubusercontent.com/Realtek-OpenSource/android_hardware_realtek/rtk1395/bt/rtkbt/Firmware/BT/rtl8761b_fw"

mkdir -p /usr/lib/firmware/rtl_bt
cp "${SCRIPT_DIR}/rtl8761b_config.bin" "/usr/lib/firmware/rtl_bt/rtl8761b_config.bin"
cp "${SCRIPT_DIR}/rtl8761b_fw.bin" "/usr/lib/firmware/rtl_bt/rtl8761b_fw.bin"

ln -f -s "/usr/lib/firmware/rtl_bt/rtl8761b_config.bin" "/usr/lib/firmware/rtl_bt/rtl8761bu_config.bin"
ln -f -s "/usr/lib/firmware/rtl_bt/rtl8761b_fw.bin" "/usr/lib/firmware/rtl_bt/rtl8761bu_fw.bin"

# Ubuntu does not seem to detect the firmware from /usr/lib, so let's copy it to /lib as well.
cp "${SCRIPT_DIR}/rtl8761b_config.bin" "/lib/firmware/rtl_bt/rtl8761b_config.bin"
cp "${SCRIPT_DIR}/rtl8761b_fw.bin" "/lib/firmware/rtl_bt/rtl8761b_fw.bin"

ln -s "/lib/firmware/rtl_bt/rtl8761b_config.bin" "/lib/firmware/rtl_bt/rtl8761bu_config.bin"
ln -s "/lib/firmware/rtl_bt/rtl8761b_fw.bin" "/lib/firmware/rtl_bt/rtl8761bu_fw.bin"
