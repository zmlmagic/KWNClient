//	  _____      __________    ___
//	 /\__  \    /\  __  __ \  /\  \
//	 \/_ \  \__ \ \ \ \ \ \ \ \ \  \___
//	    \ \____\ \ \_\ \_\ \ \ \ \_____\
//	     \/____/  \/_/\/_/\/_/  \/_____/
//
//
//  Copyright (c) 2014年 张明磊. All rights reserved.
//

#import "Zml_SystemConfigure.h"
#import "OpenUDID.h"
#import "Zml_Keychain.h"

@implementation Zml_SystemConfigure

#pragma mark - 系统版本 -
/**
 *  系统版本
 */
+ (NSString *)OSVersion
{
#if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
	return [NSString stringWithFormat:@"%@ %@", [UIDevice currentDevice].systemName, [UIDevice currentDevice].systemVersion];
#else
	return nil;
#endif
}

#pragma mark - app版本 -
/**
 *  app版本
 */
+ (NSString *)appVersion
{
#if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR || TARGET_OS_MAC)
	NSString * __string_value = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
	if ( nil == __string_value || 0 == __string_value.length )
	{
		__string_value = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersion"];
	}
	return __string_value;
#else	// #if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
	return nil;
#endif	// #if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
}

#pragma mark - app标示 -
/**
 *  app标示
 */
+ (NSString *)appIdentifier
{
#if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
	static NSString * __string_identifier = nil;
	if ( nil == __string_identifier )
	{
		__string_identifier = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"];
	}
	return __string_identifier;
#else
	return @"";
#endif
}

#pragma mark - 判断设备/iphone/itouch/ipod -
/**
 *  判断设备/iphone/itouch/ipod
 */
+ (NSString *)deviceModel
{
#if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
	return [UIDevice currentDevice].model;
#else
	return nil;
#endif
}

#pragma mark - UUID -
/**
 *  UUID
 */
+ (NSString *)deviceUUID
{
#if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR || TARGET_OS_MAC)
	Class openUDID = NSClassFromString(@"OpenUDID");
	if (openUDID)
	{
		return [openUDID value];
	}
#endif
	return nil;
}

#if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
static const char * __jb_app = NULL;
#endif	

+ (BOOL)isJailBroken NS_AVAILABLE_IOS(4_0)
{
#if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
	static const char * __jb_apps[] =
	{
		"/Application/Cydia.app",
		"/Application/limera1n.app",
		"/Application/greenpois0n.app",
		"/Application/blackra1n.app",
		"/Application/blacksn0w.app",
		"/Application/redsn0w.app",
		NULL
	};
	__jb_app = NULL;
	// method 1
    for ( int i = 0; __jb_apps[i]; ++i )
    {
        if ( [[NSFileManager defaultManager] fileExistsAtPath:[NSString stringWithUTF8String:__jb_apps[i]]] )
        {
			__jb_app = __jb_apps[i];
			return YES;
        }
    }
    // method 2
	if ( [[NSFileManager defaultManager] fileExistsAtPath:@"/private/var/lib/apt/"] )
	{
		return YES;
	}
	
	// method 3
	if ( 0 == system("ls") )
	{
		return YES;
	}
#endif
    return NO;
}

#pragma mark - 是否越狱 -
/**
 *  是否越狱
 */
+ (NSString *)jailBreaker NS_AVAILABLE_IOS(4_0)
{
#if (TARGET_OS_IPHONE)
	if ( __jb_app )
	{
		return [NSString stringWithUTF8String:__jb_app];
	}
#endif
	return @"";
}

#pragma mark - 各设备适配 -
/**
 *  各设备适配
 */
+ (BOOL)isDevicePhone
{
#if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
	NSString * deviceType = [UIDevice currentDevice].model;
	
	if ( [deviceType rangeOfString:@"iPhone" options:NSCaseInsensitiveSearch].length > 0 ||
		[deviceType rangeOfString:@"iPod" options:NSCaseInsensitiveSearch].length > 0 ||
		[deviceType rangeOfString:@"iTouch" options:NSCaseInsensitiveSearch].length > 0 )
	{
		return YES;
	}
#endif
	return NO;
}

+ (BOOL)isDevicePad
{
#if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
	NSString * deviceType = [UIDevice currentDevice].model;
	
	if ( [deviceType rangeOfString:@"iPad" options:NSCaseInsensitiveSearch].length > 0 )
	{
		return YES;
	}
#endif
	return NO;
}

+ (BOOL)isCanCallPhone
{
#if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
    NSString * deviceType = [UIDevice currentDevice].model;
    if([deviceType rangeOfString:@"iPhone" options:NSCaseInsensitiveSearch].length > 0)
    {
        return YES;
    }
#endif
	return NO;
}

+ (BOOL)isPhone35
{
#if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
    return [Zml_SystemConfigure isScreenSize:CGSizeMake(320, 480)];
#else
	return NO;
#endif
}

+ (BOOL)isPhoneRetina35
{
#if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
    return [Zml_SystemConfigure isScreenSize:CGSizeMake(640, 960)];
#else
	return NO;
#endif
}

+ (BOOL)isPhoneRetina4
{
#if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
    return [Zml_SystemConfigure isScreenSize:CGSizeMake(640, 1136)];
#else
	return NO;
#endif
}

+ (BOOL)isPad
{
#if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
	return [Zml_SystemConfigure isScreenSize:CGSizeMake(768, 1024)];
#else
	return NO;
#endif
}

+ (BOOL)isPadRetina
{
#if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
	return [Zml_SystemConfigure isScreenSize:CGSizeMake(1536, 2048)];
#else
	return NO;
#endif
}

+ (BOOL)isIOS7
{
#if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
	return [[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0;
#else
	return NO;
#endif
}

+ (BOOL)isScreenSize:(CGSize)size
{
#if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
	if ( [UIScreen instancesRespondToSelector:@selector(currentMode)] )
	{
		CGSize size2 = CGSizeMake( size.height, size.width );
		CGSize screenSize = [UIScreen mainScreen].currentMode.size;
		if ( CGSizeEqualToSize(size, screenSize) || CGSizeEqualToSize(size2, screenSize) )
		{
			return YES;
		}
	}
	return NO;
#else
	return NO;
#endif
}

@end
