#!/usr/bin/env -S PYTHONPATH=../../../tools/extract-utils python3
#
# SPDX-FileCopyrightText: 2024 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

from extract_utils.fixups_blob import (
    blob_fixup,
    blob_fixups_user_type,
)

from extract_utils.fixups_lib import (
    lib_fixups,
    lib_fixups_user_type,
)

from extract_utils.main import (
    ExtractUtils,
    ExtractUtilsModule,
)

namespace_imports = [
     'device/xiaomi/rock',
     'hardware/mediatek',
     'hardware/xiaomi',
     'hardware/mediatek/libmtkperf_client',
     'vendor/xiaomi/rock'
 ]

def lib_fixup_vendor_suffix(lib: str, partition: str, *args, **kwargs):
     return f'{lib}_{partition}' if partition == 'vendor' else None

lib_fixups: lib_fixups_user_type = {
     **lib_fixups,
     ('vendor.mediatek.hardware.videotelephony@1.0',): lib_fixup_vendor_suffix,
}

blob_fixups: blob_fixups_user_type = {
    'vendor/bin/mtk_agpsd': blob_fixup()
    .replace_needed('libcrypto.so', 'libcrypto-v32.so'),
    'vendor/bin/hw/android.hardware.media.c2@1.2-mediatek-64b': blob_fixup()
    .replace_needed('libavservices_minijail_vendor.so', 'libavservices_minijail.so')
    .add_needed('libstagefright_foundation-v33.so'),
    'vendor/bin/hw/android.hardware.vibrator-service.mediatek': blob_fixup()
    .replace_needed('android.hardware.vibrator-V2-ndk_platform.so', 'android.hardware.vibrator-V2-ndk.so'),
    'vendor/bin/hw/android.hardware.lights-service.mediatek': blob_fixup()
    .replace_needed('android.hardware.light-V1-ndk_platform.so', 'android.hardware.light-V1-ndk.so'),
    'vendor/bin/hw/android.hardware.security.keymint@1.0-service.beanpod': blob_fixup()
	.replace_needed('android.hardware.security.keymint-V1-ndk_platform.so', 'android.hardware.security.keymint-V3-ndk-v34.so')
	.replace_needed('android.hardware.security.sharedsecret-V1-ndk_platform.so', 'android.hardware.security.sharedsecret-V1-ndk.so')
	.replace_needed('android.hardware.security.secureclock-V1-ndk_platform.so', 'android.hardware.security.secureclock-V1-ndk.so')
	.add_needed('android.hardware.security.rkp-V3-ndk.so'),
    'vendor/etc/init/android.hardware.graphics.allocator@4.0-service-mediatek.rc': blob_fixup()
    .regex_replace('android.hardware.graphics.allocator@4.0-service-mediatek', 'mt6789/android.hardware.graphics.allocator@4.0-service-mediatek.mt6789'),
    'vendor/etc/init/android.hardware.media.c2@1.2-mediatek.rc': blob_fixup()
    .regex_replace('1.2-mediatek', '1.2-mediatek-64b'),
    'vendor/etc/init/android.hardware.bluetooth@1.1-service-mediatek.rc': blob_fixup()
    .regex_replace('on property:vts(.|\n)*', ''),
    'vendor/lib64/libvendor.goodix.hardware.biometrics.fingerprint@2.1.so': blob_fixup()
	.replace_needed('libhidltransport.so', 'libhidlbase-v32.so'),
    ('vendor/lib64/libmtkcam_stdutils.so', 'vendor/lib64/hw/mt6789/android.hardware.camera.provider@2.6-impl-mediatek.so'): blob_fixup()
    .replace_needed('libutils.so', 'libutils-v32.so')
    .add_needed('libprocessgroup_shim.so'),
     'vendor/lib64/mt6789/libneuralnetworks_sl_driver_mtk_prebuilt.so': blob_fixup()
	.clear_symbol_version('AHardwareBuffer_allocate')
	.clear_symbol_version('AHardwareBuffer_describe')
	.clear_symbol_version('AHardwareBuffer_createFromHandle')
	.clear_symbol_version('AHardwareBuffer_getNativeHandle')
	.clear_symbol_version('AHardwareBuffer_lock')
	.clear_symbol_version('AHardwareBuffer_lockPlanes')
	.clear_symbol_version('AHardwareBuffer_release')
	.clear_symbol_version('AHardwareBuffer_unlock'),
    ('vendor/lib64/libteei_daemon_vfs.so', 'vendor/lib64/mt6789/libaaa_ltm.so', 'vendor/lib64/mt6789/lib3a.flash.so', 'vendor/lib64/mt6789/lib3a.ae.stat.so', 'vendor/lib64/mt6789/lib3a.sensors.color.so', 'vendor/lib64/mt6789/lib3a.sensors.flicker.so', 'vendor/lib64/libSQLiteModule_VER_ALL.so'): blob_fixup()
        .add_needed('liblog.so'),
    'vendor/lib64/mt6789/libmnl.so' : blob_fixup()
        .add_needed('libcutils.so'),
    'vendor/lib/libvcodec_oal.so': blob_fixup()
        .clear_symbol_version('__aeabi_memcpy')
        .clear_symbol_version('__aeabi_memset')
        .clear_symbol_version('__gnu_Unwind_Find_exidx'),
    ('vendor/lib64/libnvram.so', 'vendor/lib64/libsysenv.so'): blob_fixup()
        .add_needed('libbase_shim.so'),
    'vendor/lib64/ese_spi_nxp.so': blob_fixup()
        .add_needed('libbase_shim.so'),

    # NVRAM
    ('vendor/lib/libnvram.so', 'vendor/lib64/libnvram.so', 'vendor/lib/libsysenv.so', 'vendor/lib64/libsysenv.so'): blob_fixup()
	.add_needed('libbase_shim.so'),

    # GNSS
    ('vendor/bin/hw/android.hardware.gnss-service.mediatek', 'vendor/lib64/hw/android.hardware.gnss-impl-mediatek.so'): blob_fixup()
    .replace_needed('android.hardware.gnss-V1-ndk_platform.so', 'android.hardware.gnss-V1-ndk.so'),

   # MTK HWCOMPOSER
    ('vendor/lib64/hw/hwcomposer.mtk_common.so', 'vendor/bin/hw/vendor.mediatek.hardware.pq@2.2-service') : blob_fixup()
        .add_needed('libprocessgroup_shim.so'),
      'vendor/lib64/hw/mt6789/vendor.mediatek.hardware.pq@2.15-impl.so' : blob_fixup()
        .replace_needed('libutils.so', 'libutils-v32.so')
        .replace_needed('libtinyxml2.so', 'libtinyxml2-v34.so')
        .add_needed('libprocessgroup_shim.so'),

   # RIL
    'vendor/bin/hw/mtkfusionrild': blob_fixup()
        .add_needed('libutils-v32.so'),

   # SENSORS
    ('vendor/bin/mnld', 'vendor/lib64/mt6789/libaalservice.so', 'vendor/lib64/mt6789/libcam.utils.sensorprovider.so', 'vendor/lib64/hw/mt6789/vendor.mediatek.hardware.pq@2.15-impl.so'): blob_fixup()
        .replace_needed('libsensorndkbridge.so', 'android.hardware.sensors@1.0-convert-shared.so')

}  # fmt: skip

module = ExtractUtilsModule(
    'rock',
    'xiaomi',
    blob_fixups=blob_fixups,
    namespace_imports=namespace_imports,
    lib_fixups=lib_fixups,
    add_firmware_proprietary_file=True,
)

if __name__ == '__main__':
    utils = ExtractUtils.device(module)
    utils.run()
