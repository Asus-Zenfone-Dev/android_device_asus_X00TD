#
# Copyright (C) 2018-2019 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from sdm660-common
$(call inherit-product, device/asus/sdm660-common/sdm660.mk)

DEVICE_PATH := device/asus/X00TD

# Setup dalvik vm configs
$(call inherit-product, frameworks/native/build/phone-xhdpi-4096-dalvik-heap.mk)

# Audio
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/audio/audio_platform_info_intcodec.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_intcodec.xml \
    $(DEVICE_PATH)/audio/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml \
    $(DEVICE_PATH)/audio/sound_trigger_mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths.xml \
    $(DEVICE_PATH)/audio/sound_trigger_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_platform_info.xml

# FM
BOARD_HAVE_QCOM_FM := true

# HW crypto
PRODUCT_PACKAGES += \
    vendor.qti.hardware.cryptfshw@1.0-service-qti.qsee

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(DEVICE_PATH)/overlay \
    $(DEVICE_PATH)/overlay-lineage

# Ramdisk
PRODUCT_PACKAGES += \
    fstab.qcom \
    init.device.rc

# USB
PRODUCT_PACKAGES += \
    android.hardware.usb@1.0-service.basic

# Wifi
PRODUCT_PACKAGES += \
    X00TDWifiOverlay

# Inherit the proprietary files
$(call inherit-product, vendor/asus/X00TD/X00TD-vendor.mk)
