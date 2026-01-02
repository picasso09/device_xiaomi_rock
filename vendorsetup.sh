echo -e "\033[1;33mCloning Dependencies\033[0m"

# Kernel
git clone https://github.com/picasso09/kernel_xiaomi_rock -b lineage-23.0 kernel/xiaomi/rock

# Vendor
git clone https://github.com/picasso09/proprietary_vendor_xiaomi_rock -b lineage-23.0 vendor/xiaomi/rock

# Hardware
git clone https://github.com/LineageOS/android_hardware_mediatek -b lineage-23.0 hardware/mediatek
git clone https://github.com/LineageOS/android_hardware_xiaomi -b lineage-23.0 hardware/xiaomi

# Sepolicy
git clone https://github.com/LineageOS/android_device_mediatek_sepolicy_vndr -b lineage-23.0 device/mediatek/sepolicy_vndr

# Common IMS
git clone https://github.com/MillenniumOSS/android_vendor_mediatek_ims.git -b sixteen vendor/mediatek/ims

echo -e "\033[32mDone go cook\033[0m"
