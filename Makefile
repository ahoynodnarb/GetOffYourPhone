INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = GetOffYourPhone

GetOffYourPhone_FILES = Tweak.xm
GetOffYourPhone_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += getoffyourphoneprefs
include $(THEOS_MAKE_PATH)/aggregate.mk
