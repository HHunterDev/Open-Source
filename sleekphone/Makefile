ARCHS = armv7 arm64
TARGET = iphone:clang:latest:7.0

THEOS_BUILD_DIR = Packages

TWEAK_NAME = SleekPhone
SleekPhone_CFLAGS = -fobjc-arc
SleekPhone_FILES = Tweak.xm
SleekPhone_FRAMEWORKS = Foundation UIKit

include theos/makefiles/common.mk
include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 backboardd"
SUBPROJECTS += sleekphone
include $(THEOS_MAKE_PATH)/aggregate.mk
