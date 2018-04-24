PRODUCT_PROPERTY_OVERRIDES := $(if $(CONFIG_SW_GRAPHICS), \
	ro.kernel.qemu=1)

ifeq ($(TARGET_ARCH),arm64)
  PRODUCT_PACKAGES := \
	libGLES_android
else
  PRODUCT_PACKAGES := \
	libEGL_swiftshader \
	libGLESv1_CM_swiftshader \
	libGLESv2_swiftshader
endif

PRODUCT_PROPERTY_OVERRIDES += \
        ro.sf.lcd_density=$(CONFIG_DISPLAY_DPI)

subdirs-true :=
subdirs-$(BOARD_USES_DRM_HWCOMPOSER) += drm
subdirs-$(CONFIG_GRALLOC_MALI) += gralloc
$(call inherit-product-dirs, $(subdirs-true))
