#import <UIKit/UIKit.h>
#import "PSListController.h"

@interface SleekPhoneListController: PSListController {
}
@end

// Notification Listener
static void sleekPhone_change(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef userInfo) {
	system("killall -9 MobilePhone");
}

@implementation SleekPhoneListController
- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"SleekPhone" target:self] retain];
	}
	return _specifiers;
}
-(void) loadView {
	[super loadView];
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, &sleekPhone_change, CFSTR("com.newjoy.sleekphone/KillPhone"), NULL, 0);
}
-(void)viewDidDisappear:(BOOL)animated {
		CFNotificationCenterRemoveObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, CFSTR("com.newjoy.sleekphone/KillPhone"), NULL);
}
@end

// vim:ft=objc
