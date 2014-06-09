//	  _____      __________    ___
//	 /\__  \    /\  __  __ \  /\  \
//	 \/_ \  \__ \ \ \ \ \ \ \ \ \  \___
//	    \ \____\ \ \_\ \_\ \ \ \ \_____\
//	     \/____/  \/_/\/_/\/_/  \/_____/
//
//
//  Copyright (c) 2014年 张明磊. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Zml_SystemConfigure : NSObject

#pragma mark - 系统版本 -
/**
 *  系统版本
 */
+ (NSString *)OSVersion;

#pragma mark - app版本 -
/**
 *  app版本
 */
+ (NSString *)appVersion;

#pragma mark - app标示 -
/**
 *  app标示
 */
+ (NSString *)appIdentifier;

#pragma mark - 判断设备/iphone/itouch/ipod -
/**
 *  判断设备/iphone/itouch/ipod
 */
+ (NSString *)deviceModel;

#pragma mark - UUID -
/**
 *  UUID
 */
+ (NSString *)deviceUUID;

#pragma mark - 是否越狱 -
/**
 *  是否越狱
 */
+ (BOOL)isJailBroken		NS_AVAILABLE_IOS(4_0);
+ (NSString *)jailBreaker	NS_AVAILABLE_IOS(4_0);

#pragma mark - 各设备适配 -
/**
 *  各设备适配
 */
+ (BOOL)isDevicePhone;
+ (BOOL)isDevicePad;
+ (BOOL)isPhone35;
+ (BOOL)isPhoneRetina35;
+ (BOOL)isPhoneRetina4;
+ (BOOL)isPad;
+ (BOOL)isPadRetina;
+ (BOOL)isIOS7;

#pragma mark - 是否能打电话 -
/**
 *  是否能打电话
 */
+ (BOOL)isCanCallPhone;

@end
