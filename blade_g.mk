#
# Copyright 2014 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Inherit the msm7x27a-common definitions
$(call inherit-product, device/zte/msm7x27a-common/msm7x27a.mk)

DEVICE_PACKAGE_OVERLAYS += device/zte/blade_g/overlay

# Files
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,device/zte/blade_g/rootdir,root)

#Prebuilt files
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,device/zte/blade_g/prebuilt,system)


PRODUCT_COPY_FILES += \
    device/zte/blade_g/configs/AudioFilter.csv:system/etc/AudioFilter.csv \
    device/zte/blade_g/configs/thermald.conf:system/etc/thermald.conf

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml

# Properties
PRODUCT_PROPERTY_OVERRIDES += \
    gsm.version.baseband=2030 \
    rild.libpath=/system/lib/libril-qc-qmi-1.so \
    ro.telephony.ril.v3=qcomdsds,skippinpukcount \
    ro.telephony.ril_class=HuaweiQualcommRIL

$(call inherit-product, $(SRC_TARGET_DIR)/product/full.mk)

$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)

$(call inherit-product, vendor/huawei/u8833/u8833-vendor.mk)
