#
# Copyright (C) 2023 AfterLife Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from device makefile
$(call inherit-product, device/xiaomi/rock/device.mk)

# Inherit some common AfterLife stuff
$(call inherit-product, vendor/arrow/config/common.mk)

# Bootanimation Res
TARGET_BOOT_ANIMATION_RES := 1080

# AfterLife flags
TARGET_SUPPORTS_QUICK_TAP := true
TARGET_FACE_UNLOCK_SUPPORTED := true
USE_PIXEL_CHARGER := true

DEVICE_MAINTAINER := picasso09
DEVICE_MAINTAINER_LINK := t.me/picasso170606

# Blur
TARGET_SUPPORTS_BLUR := true

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := rock
PRODUCT_NAME := arrow_rock
PRODUCT_BRAND := Redmi
PRODUCT_MODEL := 22071219AI
PRODUCT_MANUFACTURER := Xiaomi

BUILD_HOSTNAME := picasso09
BUILD_FINGERPRINT :=Redmi/rock/rock:12/UP1A.231005.007/V816.0.7.0.ULUINXM:user/release-keys
PRIVATE_BUILD_DESC="rock-user 14 UP1A.231005.007 V816.0.7.0.ULUINXM release-keys"

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi
