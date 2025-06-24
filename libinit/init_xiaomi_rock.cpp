/*
  * Copyright (C) 2021 The LineageOS Project
  *
  * SPDX-License-Identifier: Apache-2.0
  */

#include <libinit_variant.h>
#include <libinit_utils.h>

#include "vendor_init.h"

static const variant_info_t rock_info = {
    .hwc_value = "",
    .sku_value = "rock",

    .brand = "Redmi",
    .device = "rock",
    .marketname = "Redmi 11 Prime",
    .model = "22071219AI",
    .build_fingerprint = "Redmi/rock/rock:13/TP1A.220624.014/V14.0.9.0.TLUMIXM:user/release-keys"
};

static const variant_info_t stone_info = {
    .hwc_value = "",
    .sku_value = "stone_p",

    .brand = "POCO",
    .device = "stone",
    .marketname = "POCO M5",
    .model = "22071219CG",
    .build_fingerprint = "POCO/stone_p_global/stone:13/TP1A.220624.014/V14.0.9.0.TLUMIXM:user/release-keys"
};

static const std::vector<variant_info_t> variants = {
    rock_info,
    stone_info,
};

void vendor_load_properties() {
    search_variant(variants);
}
