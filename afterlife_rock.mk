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
$(call inherit-product, vendor/afterlife/config/common_full_phone.mk)

# Bootanimation Res
TARGET_BOOT_ANIMATION_RES := 1080

# AfterLife flags
AFTERLIFE_MAINTAINER := picasso09
TARGET_SUPPORTS_QUICK_TAP := true
TARGET_FACE_UNLOCK_SUPPORTED := true
USE_PIXEL_CHARGER := true

# Blur
TARGET_SUPPORTS_BLUR := true

# Gapps
AFTERLIFE_GAPPS := true
GAPPS_CORE := true

# Google Chrome
TARGET_INCUDE_CHROME := true
# Google Contacts
TARGET_INCLUDE_CONTACTS := true
# Google Dialer
TARGET_INCLUDE_DIALER := true
# Gboard
TARGET_INCLUDE_GBOARD := true
# Gmail
TARGET_INCLUDE_GMAIL := true
# Google Maps
TARGET_INCLUDE_MAPS := true
# Google Messages
TARGET_INCLUDE_MESSAGES := true
# Google Photos
TARGET_INCLUDE_PHOTOS := true


# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := rock
PRODUCT_NAME := afterlife_rock
PRODUCT_BRAND := Redmi
PRODUCT_MODEL := 22071219AI
PRODUCT_MANUFACTURER := Xiaomi

BUILD_HOSTNAME := picasso09
BUILD_FINGERPRINT :=Redmi/rock/rock:12/UP1A.231005.007/V816.0.7.0.ULUINXM:user/release-keys
PRIVATE_BUILD_DESC="rock-user 14 UP1A.231005.007 V816.0.7.0.ULUINXM release-keys"

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi
