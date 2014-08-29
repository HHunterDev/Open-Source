//
//  SleekPhone
//
//  What does it do?
//  Gives the dialer view of the phone app a
//  nice transparent look instead of the white
//  stock one. As requested on reddit, also 
//  a big, big thanks to sticktron on reddit
//  for helping in this and fixing up the 
//  final code

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define PLIST_PATH @"/var/mobile/Library/Preferences/com.newjoy.sleekphone.plist"

inline bool GetPrefBool(NSString *key)
{
return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] boolValue];
}

%group main

//
// StatusBar Foreground
//
%hook UIStatusBarStyleAttributes
- (id)foregroundStyle {
if(GetPrefBool(@"kStatus")) {
    return nil;
	}
  return %orig;
}
%end
//
// LCD Display (default is white)
//
%hook PHHandsetDialerLCDView
- (id)lcdColor {
if(GetPrefBool(@"kLCD")) {
    return UIColor.clearColor;
	}
  return %orig;
}
%end


//
// Dialer Color
//
%hook PHHandsetDialerView
- (id)dialerColor {
if(GetPrefBool(@"kDialer")) {
    return UIColor.clearColor;
	}
   return %orig;
}
%end


//
// Button Color
//
%hook TPPathView
- (void)setFillColor:(id)color {
    UIColor *newColor = [UIColor colorWithRed:239.0/255.0 green:239.0/255.0 blue:239.0/255.0 alpha:0.0];
    %orig(newColor);
}
%end

%end



// Initialize
%ctor {
	@autoreleasepool {
		%init(main);
	}
}

