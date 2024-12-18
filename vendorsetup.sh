echo "\033[1;33mCloning Dependencies\033[0m"

if [ -d "hardware/xiaomi/megvii" ]; then
    rm -rf "hardware/xiaomi/megvii"
fi

# Kernel
git clone https://github.com/picasso09/kernel_xiaomi_rock -b fifteen kernel/xiaomi/rock

# Vendor
git clone https://github.com/picasso09/proprietary_vendor_xiaomi_rock -b fifteen vendor/xiaomi/rock

# Hardware
git clone https://github.com/LineageOS/android_hardware_mediatek -b lineage-22.0 hardware/mediatek
git clone https://github.com/LineageOS/android_hardware_xiaomi -b lineage-22.0 hardware/xiaomi

# Sepolicy
git clone https://github.com/LineageOS/android_device_mediatek_sepolicy_vndr device/mediatek/sepolicy_vndr

echo "\033[32mDone go cook\033[0m"
