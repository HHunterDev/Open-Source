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

static UIColor *foregroundColor;
static UIColor *backgroundColor;
static int fgc = 1;
static int bgc = 4;

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
// StatusBar Colours
//

%hook UIStatusBarNewUIStyleAttributes

-(id)initWithRequest:(id)arg1 backgroundColor:(id)arg2 foregroundColor:(id)arg3 {
    NSDictionary *settings = [[NSDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.newjoy.sleekphone.plist"];
    if (settings) {
	bgc = ([settings objectForKey:@"bgc"] ? [[settings objectForKey:@"bgc"] intValue] : bgc);
	fgc = ([settings objectForKey:@"fgc"] ? [[settings objectForKey:@"fgc"] intValue] : fgc);
    }

	switch (bgc) {
		case 1:
			backgroundColor = [UIColor blackColor];
			break;
		case 2:
			backgroundColor = [UIColor blueColor];
			break;
		case 3:
			backgroundColor = [UIColor brownColor];
			break;
		case 4:
			backgroundColor = [UIColor clearColor];
			break;
		case 5:
			backgroundColor = [UIColor cyanColor];
			break;
		case 6:
			backgroundColor = [UIColor darkGrayColor];
			break;
		case 7:
			backgroundColor = [UIColor grayColor];
			break;
		case 8:
			backgroundColor = [UIColor greenColor];
			break;
		case 9:
			backgroundColor = [UIColor lightGrayColor];
			break;
		case 10:
			backgroundColor = [UIColor magentaColor];
			break;
		case 11:
			backgroundColor = [UIColor orangeColor];
			break;
		case 12:
			backgroundColor = [UIColor purpleColor];
			break;
		case 13:
			backgroundColor = [UIColor redColor];
			break;
		case 14:
			backgroundColor = [UIColor whiteColor];
			break;
		case 15:
			backgroundColor = [UIColor yellowColor];
			break;
		default:
			break;
	}
	
	switch (fgc) {
		case 1:
			foregroundColor = [UIColor blackColor];
			break;
		case 2:
			foregroundColor = [UIColor blueColor];
			break;
		case 3:
			foregroundColor = [UIColor brownColor];
			break;
		case 4:
			foregroundColor = [UIColor cyanColor];
			break;
		case 5:
			foregroundColor = [UIColor darkGrayColor];
			break;
		case 6:
			foregroundColor = [UIColor grayColor];
			break;
		case 7:
			foregroundColor = [UIColor greenColor];
			break;
		case 8:
			foregroundColor = [UIColor lightGrayColor];
			break;
		case 9:
			foregroundColor = [UIColor magentaColor];
			break;
		case 10:
			foregroundColor = [UIColor orangeColor];
			break;
		case 11:
			foregroundColor = [UIColor purpleColor];
			break;
		case 12:
			foregroundColor = [UIColor redColor];
			break;
		case 13:
			foregroundColor = [UIColor whiteColor];
			break;
		case 14:
			foregroundColor = [UIColor yellowColor];
			break;
		default:
			break;
	}
	arg2 = backgroundColor;
    arg3 = foregroundColor;
    return %orig(arg1,arg2,arg3);
  }

%end


//
// LCD Display (default is white)
//
%hook PHHandsetDialerLCDView
- (id)lcdColor {
if(GetPrefBool(@"kLCD")) {
    return %orig;
	}
  return UIColor.clearColor;
}
%end


//
// Dialer Color
//
%hook PHHandsetDialerView
- (id)dialerColor {
if(GetPrefBool(@"kDial")) {
    return %orig;
	}
  return UIColor.clearColor;
}
%end


//
// Button Color
//
%hook TPPathView
- (void)setFillColor:(id)color {
if(GetPrefBool(@"kButton")) {
    UIColor *newColor = [UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:0.0];
    %orig(newColor);
	}
  return %orig; 
}
%end

//
// Call Button
//
%hook TPSuperBottomBarButton
- (void)setBackgroundColor:(id)arg1 {
if(GetPrefBool(@"kCall")) {
	return %orig(UIColor.clearColor);
	}
	return %orig;
}
%end

//
// Misc
// 


//
// Hide Voicemail tab
//

%hook MobilePhoneApplication
-(BOOL)showsPhoneVoicemail {
if(GetPrefBool(@"kVoice")) {
	return FALSE;
	}
  return %orig;
}
%end

%end


//--------------------------------------------------------------------------//
//
// Doesn't work "yet"
//
// Hide Tabs
//
/*
%hook PhoneTabBarController
- (void)showFavouritesTab:(bool)arg1 recentsTab:(bool)arg2 contactsTab:(bool)arg3 keypadTab:(bool)arg4 voicemailTab:(bool)arg5 {
*/
	
//--------------------------------------------------------------------------//


// Initialize
%ctor {
	@autoreleasepool {
		%init(main);
	}
}

