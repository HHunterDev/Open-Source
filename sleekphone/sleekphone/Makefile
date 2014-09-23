ARCHS = armv7 arm64
TARGET = iphone:clang:latest:7.0

include theos/makefiles/common.mk

BUNDLE_NAME = SleekPhone
SleekPhone_FILES = SleekPhone.xm Credits.mm
SleekPhone_INSTALL_PATH = /Library/PreferenceBundles
SleekPhone_FRAMEWORKS = UIKit
SleekPhone_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/SleekPhone.plist$(ECHO_END)
