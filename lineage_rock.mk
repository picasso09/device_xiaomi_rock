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
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Bootanimation Res
TARGET_BOOT_ANIMATION_RES := 1080

# Axion flags
TARGET_SUPPORTS_QUICK_TAP := true
TARGET_FACE_UNLOCK_SUPPORTED := true
USE_PIXEL_CHARGER := true

# Define rear camera specs (multiple sensors supported)
AXION_CAMERA_REAR_INFO := 50,2,2
# Define front camera specs
AXION_CAMERA_FRONT_INFO := 5
AXION_MAINTAINER := picasso09
BYPASS_CHARGE_SUPPORTED := true
# Define small and big core groups
AXION_CPU_SMALL_CORES := 0,1,2,3,4,5
AXION_CPU_BIG_CORES := 6,7

# Processor name (use "_" for spaces)
AXION_PROCESSOR := Mediatek_Helio_G99

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := rock
PRODUCT_NAME := lineage_rock
PRODUCT_BRAND := Redmi
PRODUCT_MODEL := 22071219AI
PRODUCT_MANUFACTURER := Xiaomi

BUILD_HOSTNAME := picasso09
BUILD_FINGERPRINT :=Redmi/rock/rock:12/UP1A.231005.007/V816.0.12.0.ULUINXM:user/release-keys
PRIVATE_BUILD_DESC="rock-user 14 UP1A.231005.007 V816.0.12.0.ULUINXM release-keys"

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

# TimeStamp
LINEAGE_VERSION_APPEND_TIME_OF_DAY := true
