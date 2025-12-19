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

# Blur
TARGET_SUPPORTS_BLUR := true

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := rock
PRODUCT_NAME := lineage_rock
PRODUCT_BRAND := Redmi
PRODUCT_MODEL := 22071219AI
PRODUCT_MANUFACTURER := Xiaomi

BUILD_HOSTNAME := picasso09
BUILD_FINGERPRINT :=Redmi/rock/rock:14/UP1A.231005.007/V816.0.12.0.ULUMIXM:user/release-keys
PRIVATE_BUILD_DESC="rock-user 14 UP1A.231005.007 V816.0.12.0.ULUMIXM release-keys"

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

LINEAGE_VERSION_APPEND_TIME_OF_DAY := true

