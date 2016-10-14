# Copyright (C) 2012 The CyanogenMod Project
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
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).

# inherit from the proprietary version

TARGET_SPECIFIC_HEADER_PATH += device/samsung/ancora/include

# Platform
TARGET_BOARD_PLATFORM := msm7x30
TARGET_BOOTLOADER_BOARD_NAME := ancora
TARGET_OTA_ASSERT_DEVICE := ancora,GT-I8150
TARGET_NO_BOOTLOADER := true

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := scorpion
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := false

# Enable dex-preoptimization to speed up first boot sequence
WITH_DEXPREOPT := true

# Legacy MMAP for pre-lollipop blobs
BOARD_USES_LEGACY_MMAP := true

# Kernel
BOARD_KERNEL_BASE := 0x00400000
BOARD_KERNEL_PAGESIZE := 2048
TARGET_KERNEL_SOURCE := kernel/samsung/msm7x30-common
TARGET_KERNEL_CONFIG := ancora_defconfig

# Build kernel with GCC 4.9
#TARGET_KERNEL_CROSS_COMPILE_PREFIX := arm-linux-androideabi-

# disable block based ota
BLOCK_BASED_OTA := false

# Wifi related defines
WIFI_BAND                        := 802_11_ABG
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE                := bcmdhd
BOARD_HAVE_SAMSUNG_WIFI          := true

WIFI_DRIVER_MODULE_PATH          := "/system/lib/modules/dhd.ko"
WIFI_DRIVER_MODULE_NAME          := "dhd"
WIFI_DRIVER_MODULE_ARG           := "firmware_path=/vendor/firmware/fw_bcmdhd.bin nvram_path=/vendor/firmware/nvram_net.txt"
WIFI_DRIVER_MODULE_AP_ARG        := "firmware_path=/vendor/firmware/fw_bcmdhd_apsta.bin nvram_path=/vendor/firmware/nvram_net.txt"
WIFI_DRIVER_FW_PATH_PARAM        := "/sys/module/dhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA          := "/vendor/firmware/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_AP           := "/vendor/firmware/fw_bcmdhd_apsta.bin"

# Healthd HAL
BOARD_HAL_STATIC_LIBRARIES := libhealthd.msm

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/samsung/ancora/bluetooth
BOARD_BLUEDROID_VENDOR_CONF := device/samsung/ancora/bluetooth/vnd_ancora.txt

# RIL
COMMON_GLOBAL_CFLAGS += -DDISABLE_ASHMEM_TRACKING
TARGET_NEEDS_BIONIC_PRELINK_SUPPORT := true
TARGET_NEEDS_NON_PIE_SUPPORT := true
BOARD_MOBILEDATA_INTERFACE_NAME = "pdp0"
BOARD_RIL_CLASS := ../../../device/samsung/ancora/ril/

# Audio
BOARD_USES_LEGACY_ALSA_AUDIO := true
BOARD_HAVE_SAMSUNG_AUDIO := true
AUDIO_FEATURE_ENABLED_INCALL_MUSIC := false
AUDIO_FEATURE_ENABLED_COMPRESS_VOIP := false
AUDIO_FEATURE_ENABLED_PROXY_DEVICE := false

# Qualcomm
TARGET_USES_ION := true
TARGET_USES_C2D_COMPOSITION := true
TARGET_DISPLAY_INSECURE_MM_HEAP := true
USE_OPENGL_RENDERER := true
BOARD_USES_QCOM_HARDWARE := true

# Triple FrameBuffer
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3

# Camera
USE_DEVICE_SPECIFIC_CAMERA := true
COMMON_GLOBAL_CFLAGS += -DBINDER_COMPAT
TARGET_RELEASE_CPPFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS

# Light HAL
TARGET_PROVIDES_LIBLIGHT := true

# Include an expanded selection of fonts
EXTENDED_FONT_FOOTPRINT := true

# CM Hardware
BOARD_HARDWARE_CLASS := device/samsung/ancora/cmhw

# GPS
USE_DEVICE_SPECIFIC_GPS := true

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 5767168
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 7864320
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1163919360
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1832894464
BOARD_CACHEIMAGE_PARTITION_SIZE := 560988160
BOARD_FLASH_BLOCK_SIZE := 131072

# Misc. filesystem settings
#BOARD_SYSTEMIMAGE_JOURNAL_SIZE := 0
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# TWRP recovery
DEVICE_RESOLUTION := 480x800
TARGET_RECOVERY_DEVICE_DIRS := device/samsung/ancora
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TARGET_RECOVERY_FSTAB := device/samsung/ancora/rootdir/fstab.qcom
TW_TARGET_USES_QCOM_BSP := true
TW_SCREEN_BLANK_ON_BOOT := true
TW_BRIGHTNESS_PATH := /sys/devices/platform/msm_fb.196609/leds/lcd-backlight/brightness
TW_MAX_BRIGHTNESS := 255
TW_CUSTOM_POWER_BUTTON := 107
BOARD_USE_CUSTOM_RECOVERY_FONT:= \"roboto_10x18.h\"
RECOVERY_SDCARD_ON_DATA := true
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"
TW_NO_REBOOT_BOOTLOADER := true
TW_HAS_DOWNLOAD_MODE := true
TW_USE_MODEL_HARDWARE_ID_FOR_DEVICE_ID := true
TW_INCLUDE_FB2PNG := true
TW_NO_CPU_TEMP := true

# Charger
BOARD_CHARGER_DISABLE_INIT_BLANK := true
BOARD_CHARGER_ENABLE_SUSPEND := true

# SELinux
#BOARD_SEPOLICY_DIRS += \
    device/samsung/ancora/sepolicy
