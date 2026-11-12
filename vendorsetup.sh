echo -e "\033[1;33mCloning Dependencies\033[0m"

# Kernel
git clone https://github.com/Asmodeus7999/kernel_xiaomi_rock -b lineage-23.2 kernel/xiaomi/rock

# Vendor
git clone https://github.com/Asmodeus7999/proprietary_vendor_xiaomi_rock -b lineage-23.2 vendor/xiaomi/rock
# Widevine blobs need protobuf 3.9.1 compat. Infinity excludes the original from bp scanning,
# so ship a copy inside the vendor tree (safe to run repeatedly)
if [ -d prebuilts/misc/protobuf_vendorcompat ] && [ ! -d vendor/xiaomi/rock/protobuf_vendorcompat ]; then
    cp -r prebuilts/misc/protobuf_vendorcompat vendor/xiaomi/rock/protobuf_vendorcompat
fi

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

# Lunaris Dolby
git clone https://github.com/Pong-Development/hardware_dolby.git -b 16  hardware/dolby

# Apply patches
echo -e "\033[1;33mApplying patches\033[0m"

# Always resolve paths relative to the AOSP root, not wherever the shell is.
# $ANDROID_BUILD_TOP is set by envsetup.sh; fall back to the script's own location
# (device/xiaomi/rock) going up 3 levels if the var isn't set yet.
_AOSP_ROOT="${ANDROID_BUILD_TOP:-$(cd "$(dirname "${BASH_SOURCE[0]}")/../../.." && pwd)}"
PATCHES_DIR="$_AOSP_ROOT/device/xiaomi/rock/patches"

apply_patch() {
    local repo_rel="$1"          # e.g. frameworks/av  (relative to AOSP root)
    local patch="$2"             # absolute path to .patch file
    local repo="$_AOSP_ROOT/$repo_rel"

    if [ ! -d "$repo" ]; then
        echo -e "  \033[31mMissing repo:\033[0m $repo_rel — skipping $(basename "$patch")"
        return
    fi
    if [ ! -f "$patch" ]; then
        echo -e "  \033[31mMissing patch file:\033[0m $patch"
        return
    fi

    # --check with --reverse tells us if the patch is already applied
    if git -C "$repo" apply --check --reverse "$patch" &>/dev/null; then
        echo -e "  \033[33mAlready applied:\033[0m $(basename "$patch")"
        return
    fi

    if git -C "$repo" apply --check "$patch" &>/dev/null; then
        git -C "$repo" apply "$patch"
        echo -e "  \033[32mApplied:\033[0m $(basename "$patch")"
    else
        echo -e "  \033[31mFailed (conflicts?):\033[0m $(basename "$patch")"
        git -C "$repo" apply "$patch" 2>&1 | sed 's/^/    /'
    fi
}

apply_patch frameworks/av \
    "$PATCHES_DIR/0001-APM-Remove-A2DP-audio-ports-from-the-primary-HAL.patch"

apply_patch packages/modules/Bluetooth \
    "$PATCHES_DIR/0002-Don-t-abort-when-failing-to-get-real-time-priority.patch"

echo -e "\033[32mDone go cook\033[0m"
