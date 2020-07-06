include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = getoffyourphoneprefs

getoffyourphoneprefs_FILES = GOYPRootListController.m
getoffyourphoneprefs_INSTALL_PATH = /Library/PreferenceBundles
getoffyourphoneprefs_FRAMEWORKS = UIKit
getoffyourphoneprefs_PRIVATE_FRAMEWORKS = Preferences
getoffyourphoneprefs_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/getoffyourphoneprefs.plist$(ECHO_END)
