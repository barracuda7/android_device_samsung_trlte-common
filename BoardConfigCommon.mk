#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017 The LineageOS Project
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

# Inherit from qcom-common
-include device/samsung/qcom-common/BoardConfigCommon.mk

# Architecture
TARGET_CPU_VARIANT := krait

# Audio
BOARD_USES_ALSA_AUDIO := true
AUDIO_FEATURE_ENABLED_HWDEP_CAL := true
AUDIO_FEATURE_LOW_LATENCY_PRIMARY := true
AUDIO_FEATURE_ENABLED_LOW_LATENCY_CAPTURE := true
BOARD_USES_ES705 := true

# Bluetooth
BOARD_HAVE_BLUETOOTH_BCM := true
BCM_BLUETOOTH_TRLTE_BUG := true
BOARD_HAVE_SAMSUNG_BLUETOOTH := true
BOARD_BLUEDROID_VENDOR_CONF := device/samsung/trlte-common/bluetooth/vnd_trlte.txt
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/samsung/trlte-common/bluetooth
BOARD_BLUETOOTH_USES_HCIATTACH_PROPERTY := false
AUDIO_FEATURE_ENABLED_HFP := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := APQ8084

# Camera
USE_DEVICE_SPECIFIC_CAMERA := true
TARGET_HAS_LEGACY_CAMERA_HAL1 := true

# Charger
BOARD_CHARGER_DISABLE_INIT_BLANK := true

# CMHW
BOARD_HARDWARE_CLASS += device/samsung/trlte-common/cmhw

# Display
OVERRIDE_RS_DRIVER:= libRSDriver_adreno.so
MAX_EGL_CACHE_KEY_SIZE := 12*1024
MAX_EGL_CACHE_SIZE := 2048*1024
HAVE_ADRENO_SOURCE := false
USE_OPENGL_RENDERER := true

# Fonts
EXTENDED_FONT_FOOTPRINT := true

# Include path
TARGET_SPECIFIC_HEADER_PATH := device/samsung/trlte-common/include

# Kernel
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_CMDLINE := console=null androidboot.hardware=qcom user_debug=23 msm_rtb.filter=0x3b7 dwc3_msm.cpu_to_affin=1 zcache.enabled=1 zcache.compressor=lz4
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_SEPARATED_DT := true
BOARD_RAMDISK_OFFSET     := 0x02600000
BOARD_KERNEL_TAGS_OFFSET := 0x02400000
BOARD_SECOND_OFFSET      := 0x00f00000
TARGET_KERNEL_ARCH := arm
TARGET_KERNEL_CONFIG := lineageos_trlte_defconfig
TARGET_KERNEL_SELINUX_CONFIG := selinux_defconfig
TARGET_KERNEL_SOURCE := kernel/samsung/trlte
KERNEL_TOOLCHAIN := $(ANDROID_BUILD_TOP)/prebuilts/gcc/$(HOST_OS)-x86/arm/arm-eabi-4.8/bin
TARGET_KERNEL_CROSS_COMPILE_PREFIX := arm-eabi-
BOARD_CUSTOM_BOOTIMG := true
BOARD_CUSTOM_BOOTIMG_MK := hardware/samsung/mkbootimg.mk

#Keymaster
TARGET_KEYMASTER_WAIT_FOR_QSEE := true

# Media
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true

# Legacy BLOB Support
TARGET_NEEDS_PLATFORM_TEXT_RELOCATIONS := true

# Partitions
BOARD_FLASH_BLOCK_SIZE := 262144
BOARD_BOOTIMAGE_PARTITION_SIZE := 17825792
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 23068672
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3774873600
BOARD_USERDATAIMAGE_PARTITION_SIZE := 26558296064

# Platform
TARGET_BOARD_PLATFORM := apq8084

# Power HAL
TARGET_POWERHAL_VARIANT := qcom
TARGET_POWERHAL_SET_INTERACTIVE_EXT := device/samsung/trlte-common/power/power_ext.c

# Data services
USE_DEVICE_SPECIFIC_DATASERVICES := true

# Qualcomm support
TARGET_GLOBAL_CFLAGS += -DQCOM_BSP
TARGET_USES_QCOM_BSP := true

# Radio
BOARD_RIL_CLASS := ../../../device/samsung/trlte-common/ril

# Recovery
TARGET_RECOVERY_FSTAB := device/samsung/trlte-common/rootdir/etc/fstab.qcom
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# SELinux
include device/qcom/sepolicy/sepolicy.mk

BOARD_SEPOLICY_DIRS += \
    device/samsung/trlte-common/sepolicy

# Sensors
TARGET_NO_SENSOR_PERMISSION_CHECK := true

# Wifi
BOARD_HAVE_SAMSUNG_WIFI := true
BOARD_WLAN_DEVICE := bcmdhd
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WPA_SUPPLICANT_VERSION := VER_0_8_X
WIFI_BAND := 802_11_ABG
WIFI_DRIVER_MODULE_ARG      := "firmware_path=/system/etc/wifi/bcmdhd_sta.bin nvram_path=/system/etc/wifi/nvram_net.txt"
WIFI_DRIVER_MODULE_AP_ARG   := "firmware_path=/system/etc/wifi/bcmdhd_apsta.bin nvram_path=/system/etc/wifi/nvram_net.txt"
WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/dhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA     := "/system/etc/wifi/bcmdhd_sta.bin"
WIFI_DRIVER_FW_PATH_AP      := "/system/etc/wifi/bcmdhd_apsta.bin"
WIFI_BUS := PCIE
