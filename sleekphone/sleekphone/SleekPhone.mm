#import <Preferences/Preferences.h>

@interface SleekPhoneListController: PSListController {
}
@end

@implementation SleekPhoneListController
- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"SleekPhone" target:self] retain];
	}
	return _specifiers;
}
@end

// vim:ft=objc
