#
# Copyright (C) 2025 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from device makefile
$(call inherit-product, device/xiaomi/rock/device.mk)

# Inherit some common
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Bootanimation Res
TARGET_BOOT_ANIMATION_RES := 1080

# Flags
TARGET_SUPPORTS_QUICK_TAP := true
TARGET_FACE_UNLOCK_SUPPORTED := true
USE_PIXEL_CHARGER := true
PERF_ANIM_OVERRIDE := true
# Blur
TARGET_ENABLE_BLUR := true
# Axion properties
AXION_CAMERA_REAR_INFO := 50
AXION_CAMERA_FRONT_INFO := 8
AXION_MAINTAINER := Asmodeus7999
AXION_PROCESSOR := MTK Helio G99

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := rock
PRODUCT_NAME := lineage_rock
PRODUCT_BRAND := Redmi
PRODUCT_MODEL := 22071219AI
PRODUCT_MANUFACTURER := Xiaomi

BUILD_HOSTNAME := picasso09
PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="missi_phone_global_ext4-user 14 UP1A.231005.007 V816.0.12.0.ULUMIXM release-keys" \
    BuildFingerprint=POCO/stone_p_global/stone:14/UP1A.231005.007/V816.0.12.0.ULUMIXM:user/release-keys \

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

LINEAGE_VERSION_APPEND_TIME_OF_DAY := true

# Axion
TARGET_DISABLE_EPPE := true
TARGET_DISABLES_LIBPERF ?= true
PERF_GOV_SUPPORTED := true
PERF_DEFAULT_GOV := schedutil
TARGET_IS_LOW_RAM ?= true
TARGET_SUPPORTED_REFRESH_RATES := 60,90
TARGET_INCLUDES_LOS_PREBUILTS := true
TARGET_INCLUDE_GOOGLE_TELECOMM := false
TARGET_INCLUDE_PARTNER_SETUP := false
