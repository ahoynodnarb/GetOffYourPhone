INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = GetOffYourPhone

GetOffYourPhone_FILES = Tweak.x
GetOffYourPhone_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
