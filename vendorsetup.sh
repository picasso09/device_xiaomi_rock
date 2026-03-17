echo -e "\033[1;33mCloning Dependencies\033[0m"

# Kernel
git clone https://github.com/picasso09/kernel_xiaomi_rock -b lineage-23.2 kernel/xiaomi/rock

# Vendor
git clone https://github.com/picasso09/proprietary_vendor_xiaomi_rock -b lineage-23.2 vendor/xiaomi/rock

# Hardware
rm -rf hardware/mediatek
git clone https://github.com/picasso09/android_hardware_mediatek -b lineage-23.2 hardware/mediatek
git clone https://github.com/LineageOS/android_hardware_xiaomi -b lineage-23.2 hardware/xiaomi
rm -rf hardware/lineage/compat
git clone https://github.com/picasso09/android_hardware_lineage_compat -b lineage-23.2 hardware/lineage/compat

# Sepolicy
git clone https://github.com/LineageOS/android_device_mediatek_sepolicy_vndr -b lineage-23.2 device/mediatek/sepolicy_vndr

# Common IMS
git clone https://github.com/MillenniumOSS/android_vendor_mediatek_ims.git -b sixteen-qpr2 vendor/mediatek/ims

# Sony Dolby
git clone https://github.com/picasso09/vendor_sony_dolby -b sixteen-redesign vendor/sony/dolby

echo -e "\033[32mDone go cook\033[0m"
