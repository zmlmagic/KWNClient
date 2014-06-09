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

@interface Zml_Keychain : NSObject

+ (NSMutableDictionary *)getKeychainQuery:(NSString *)service;
+ (void)save:(NSString *)service data:(id)data;
+ (id)load:(NSString *)service;
+ (void)delete:(NSString *)service;

+ (void)writeUUID:(NSString *)string_uuid;
+ (NSString *)readUUID;
+ (void)deleteUUID;

@end
