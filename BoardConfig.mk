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

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).
# The proprietary variant sets USE_CAMERA_STUB := false, this way
# we use the camera stub when the vendor tree isn't present, and
# the true camera library when the vendor tree is available.

TARGET_SPECIFIC_HEADER_PATH := device/zte/blade_g/include

# Inherit from the proprietary version
-include vendor/zte/blade_g/BoardConfigVendor.mk

# Flags
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE
COMMON_GLOBAL_CFLAGS += -DQCOM_BSP
COMMON_GLOBAL_CFLAGS += -DMR0_CAMERA_BLOB
COMMON_GLOBAL_CFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS
TARGET_GLOBAL_CFLAGS += -mfloat-abi=softfp -mfpu=neon -mtune=cortex-a5
TARGET_GLOBAL_CPPFLAGS += -mfloat-abi=softfp -mfpu=neon -mtune=cortex-a5

# Architecture and CPU
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a5
TARGET_CPU_SMP := true
TARGET_BOARD_PLATFORM := msm7x27a
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200
ARCH_ARM_HAVE_TLS_REGISTER := true

# Lowmem device
TARGET_ARCH_LOWMEM := true

# Qualcomm hardware
BOARD_USES_QCOM_HARDWARE := true

# Audio
BOARD_USES_LEGACY_ALSA_AUDIO := true
TARGET_QCOM_AUDIO_VARIANT := legacy
TARGET_PROVIDES_LIBAUDIO := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/zte/blade_g/bluetooth

# Camera
USE_CAMERA_STUB := true

# Wi-Fi
BOARD_HAS_ATH_WLAN := true
BOARD_WLAN_DEVICE := ath6kl
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_FW_PATH_AP := "ap"
WIFI_DRIVER_FW_PATH_STA := "sta"
WIFI_DRIVER_FW_PATH_P2P := "p2p"
WIFI_DRIVER_MODULE_NAME := "ar6000"
WIFI_DRIVER_MODULE_PATH := "/data/misc/wifi/load/ar6000.ko"
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_HOSTAPD_DRIVER := NL80211
TARGET_CUSTOM_WIFI := ../../device/zte/blade_g/libhardware_legacy/wifi/wifi.c
WPA_SUPPLICANT_VERSION := VER_0_8_X

# GPS
BOARD_USES_QCOM_GPS := true
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 50000
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := $(TARGET_BOARD_PLATFORM)

# RIL
BOARD_RIL_CLASS := ../../../device/zte/blade_g/ril/

# Graphics
BOARD_ADRENO_DECIDE_TEXTURE_TARGET := true
BOARD_EGL_CFG := device/zte/blade_g/configs/egl.cfg
BOARD_EGL_WORKAROUND_BUG_10194508 := true
BOARD_USE_MHEAP_SCREENSHOT := true
TARGET_DOESNT_USE_FENCE_SYNC := true
TARGET_QCOM_DISPLAY_VARIANT := legacy
USE_OPENGL_RENDERER := true
TARGET_USES_ION := true
TARGET_USES_QCOM_BSP := true

# Hardware
BOARD_HARDWARE_CLASS := device/zte/blade_g/cmhw

# Kernel
BOARD_KERNEL_BASE := 0x00200000
BOARD_KERNEL_CMDLINE := androidboot.hardware=huawei androidboot.selinux=permissive
BOARD_PAGE_SIZE := 2048
TARGET_KERNEL_SOURCE := kernel/zte/blade_g
TARGET_KERNEL_CONFIG := cm11-perf_defconfig

# Lights
TARGET_PROVIDES_LIBLIGHTS := true

# Media
TARGET_QCOM_LEGACY_MMPARSER := true
TARGET_QCOM_MEDIA_VARIANT := legacy

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x800000
BOARD_CACHEIMAGE_PARTITION_SIZE := 201326592 # 0xC000000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x1400000
BOARD_FLASH_BLOCK_SIZE := 131072
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1073741824 # 0x40000000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1207943168 # 0x47FFC000

# Recovery
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_UMS_LUNFILE := /sys/class/android_usb/android0/f_mass_storage/lun%d/file
TARGET_RECOVERY_INITRC := device/zte/blade_g/recovery/init.rc
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
BOARD_CUSTOM_GRAPHICS := ../../../device/zte/blade_g/recovery/graphics.c
TARGET_RECOVERY_FSTAB := device/zte/blade_g/rootdir/fstab.zte

# SELinux
BOARD_SEPOLICY_DIRS += device/zte/blade_g/sepolicy

BOARD_SEPOLICY_UNION += \
    file_contexts \
    file.te

# USB
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
BOARD_VOLD_MAX_PARTITIONS := 19
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/class/android_usb/android0/f_mass_storage/lun%d/file
TARGET_USE_CUSTOM_SECOND_LUN_NUM := 1

# Web Rendering
ENABLE_WEBGL := true
PRODUCT_PREBUILT_WEBVIEWCHROMIUM := yes
TARGET_FORCE_CPU_UPLOAD := true

# Bootloader & Misc
TARGET_BOOTLOADER_BOARD_NAME := blade_g
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
BOARD_WANTS_EMMC_BOOT := true
