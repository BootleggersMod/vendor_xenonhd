# OTA default build type
ifeq ($(OTA_TYPE),)
OTA_TYPE=Unofficial
endif

# XenonHD version
XENONHD_VERSION := XenonHD-$(shell date +"%y%m%d")-$(OTA_TYPE)
DEVICE := $(subst xenonhd_,,$(TARGET_PRODUCT))

# XenonHD OTA app
PRODUCT_PACKAGES += \
    XenonOTA \
    libbypass

# Build.prop overrides
PRODUCT_PROPERTY_OVERRIDES += \
    ro.xenonhd.version=$(XENONHD_VERSION) \
    ro.ota.device=$(DEVICE) \
    ro.ota.type=$(OTA_TYPE) \
    ro.ota.version=$(shell date +"%y%m%d") \
    ro.ota.manifest=https://mirrors.c0urier.net/android/teamhorizon/N/OTA/ota_nougat_$(DEVICE).xml
