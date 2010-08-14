# Inherit AOSP device configuration for liquid.
$(call inherit-product, device/acer/liquid/liquid.mk)

# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/cyanogen/products/common.mk)

# Include GSM stuff
$(call inherit-product, vendor/cyanogen/products/gsm.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := cyanogen_liquid
PRODUCT_BRAND := acer
PRODUCT_DEVICE := liquid
PRODUCT_MODEL := liquid
PRODUCT_MANUFACTURER := acer

TARGET_NO_KERNEL := true

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_ID=FRF91 BUILD_DISPLAY_ID=FRF91 PRODUCT_NAME=passion BUILD_FINGERPRINT=google/passion/passion/mahimahi:2.2/FRF91/43546:user/release-keys TARGET_BUILD_TYPE=userdebug BUILD_VERSION_TAGS=release-keys PRIVATE_BUILD_DESC="passion-user 2.2 FRF91 43546 release-keys" TARGET_DEVICE=passion

#CYANOGEN_WITH_GOOGLE := true

#build with 2G map (acer used for their roms), or remove this line to build with 3G/1G (nexus one standard build that works with phh FRF91 kernel)
#PRODUCT_SPECIFIC_DEFINES += TARGET_PRELINKER_MAP=$(TOP)/vendor/cyanogen/prelink-linux-arm-liquid.map

# Extra Passion overlay
#PRODUCT_PACKAGE_OVERLAYS += vendor/cyanogen/overlay/bravo

# Use a precompiled kernel until the merge with cm-kernel
#TARGET_PREBUILT_KERNEL = device/htc/bravo/kernel/kernel

# Extra RIL settings
#PRODUCT_PROPERTY_OVERRIDES += \
#    ro.ril.enable.managed.roaming=1 \
#    ro.ril.oem.nosim.ecclist=911,112,113,115,117,999,000,08,118,120,122,110,119,995 \
#    ro.ril.emc.mode=2

# Enable Windows Media
#WITH_WINDOWS_MEDIA := true


# Set ro.modversion

ifdef CYANOGEN_NIGHTLY
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.modversion=CyanogenMod-6-$(shell date +%m%d%Y)-NIGHTLY-Liquid
else
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.modversion=CyanogenMod-6.0.0-Liquid-RC2
endif

#
# Copy passion specific prebuilt files
#
PRODUCT_COPY_FILES +=  \
    vendor/cyanogen/prebuilt/hdpi/media/bootanimation.zip:system/media/bootanimation.zip
