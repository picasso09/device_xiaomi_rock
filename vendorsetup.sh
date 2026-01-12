echo -e "\033[1;33mCloning Dependencies\033[0m"

# Kernel
git clone https://github.com/picasso09/kernel_xiaomi_rock -b thirteen kernel/xiaomi/rock

# Vendor
git clone https://github.com/picasso09/proprietary_vendor_xiaomi_rock -b thirteen vendor/xiaomi/rock

# Hardware
git clone https://github.com/LineageOS/android_hardware_mediatek -b lineage-20 hardware/mediatek
git clone https://github.com/LineageOS/android_hardware_xiaomi -b lineage-20 hardware/xiaomi
git clone https://github.com/picasso09/vendor_xiaomi_camera-rock -b thirteen vendor/xiaomi/camera

# Sepolicy
git clone https://github.com/LineageOS/android_device_mediatek_sepolicy_vndr -b lineage-20 device/mediatek/sepolicy_vndr

echo -e "\033[32mDone go cook\033[0m"
