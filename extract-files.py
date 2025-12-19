#!/usr/bin/env -S PYTHONPATH=../../../tools/extract-utils python3
#
# SPDX-FileCopyrightText: 2024 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

from extract_utils.fixups_blob import (
    blob_fixup,
    blob_fixups_user_type,
)
from extract_utils.main import (
    ExtractUtils,
    ExtractUtilsModule,
)

blob_fixups: blob_fixups_user_type = {
    'system_ext/lib64/libsource.so': blob_fixup()
    .add_needed('libui_shim.so'),
    'system_ext/lib64/libsink.so': blob_fixup()
    .add_needed('libshim_sink.so'),
    'vendor/bin/mtk_agpsd': blob_fixup()
    .replace_needed('libcrypto.so', 'libcrypto-v32.so'),
    'vendor/bin/hw/android.hardware.media.c2@1.2-mediatek-64b': blob_fixup()
    .replace_needed('libavservices_minijail_vendor.so', 'libavservices_minijail.so')
    .add_needed('libstagefright_foundation-v32.so'),
    'vendor/bin/hw/android.hardware.vibrator-service.mediatek': blob_fixup()
    .replace_needed('android.hardware.vibrator-V2-ndk_platform.so', 'android.hardware.vibrator-V2-ndk.so'),
    'vendor/bin/hw/android.hardware.lights-service.mediatek': blob_fixup()
    .replace_needed('android.hardware.light-V1-ndk_platform.so', 'android.hardware.light-V1-ndk.so'),
    'vendor/etc/init/android.hardware.graphics.allocator@4.0-service-mediatek.rc': blob_fixup()
    .regex_replace('android.hardware.graphics.allocator@4.0-service-mediatek', 'mt6789/android.hardware.graphics.allocator@4.0-service-mediatek.mt6789'),
    'vendor/etc/init/android.hardware.media.c2@1.2-mediatek.rc': blob_fixup()
    .regex_replace('1.2-mediatek', '1.2-mediatek-64b'),
    'vendor/etc/init/android.hardware.bluetooth@1.1-service-mediatek.rc': blob_fixup()
    .regex_replace('on property:vts(.|\n)*', ''),
    ('vendor/lib64/libmtkcam_stdutils.so', 'vendor/lib64/hw/mt6789/android.hardware.camera.provider@2.6-impl-mediatek.so', 'vendor/lib64/hw/mt6789/vendor.mediatek.hardware.pq@2.15-impl.so'): blob_fixup()
    .replace_needed('libutils.so', 'libutils-v32.so'),

    # GNSS
    ('vendor/bin/hw/android.hardware.gnss-service.mediatek', 'vendor/lib64/hw/android.hardware.gnss-impl-mediatek.so'): blob_fixup()
    .replace_needed('android.hardware.gnss-V1-ndk_platform.so', 'android.hardware.gnss-V1-ndk.so')
}  # fmt: skip

module = ExtractUtilsModule(
    'rock',
    'xiaomi',
    blob_fixups=blob_fixups,
    check_elf=False,
)

if __name__ == '__main__':
    utils = ExtractUtils.device(module)
    utils.run()