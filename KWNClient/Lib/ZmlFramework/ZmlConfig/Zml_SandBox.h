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

@interface Zml_SandBox : NSObject

@property (nonatomic, readonly) NSString *string_appPath;
@property (nonatomic, readonly) NSString *string_docPath;
@property (nonatomic, readonly) NSString *string_libPrefPath;
@property (nonatomic, readonly) NSString *string_libCachePath;
@property (nonatomic, readonly) NSString *string_tmpPath;

+ (NSString *)appPath;		// 程序目录,不能存任何东西
+ (NSString *)docPath;		// 文档目录,需要ITUNES同步备份的数据存这里,会自动icloud
+ (NSString *)libPrefPath;	// 配置目录,配置文件存这里
+ (NSString *)libCachePath;	// 缓存目录,系统永远不会删除这里的文件,ITUNES会删除
+ (NSString *)tmpPath;		// 缓存目录,APP退出后,系统可能会删除这里的内容

#pragma mark - 查看是否存在目录,不存在创建 -
/**
 *  查看是否存在目录,不存在创建
 */
+ (BOOL)touchDic:(NSString *)path;

#pragma mark - 查看是否存在文件,不存在创建 -
/**
 *  查看是否存在文件,不存在创建
 */
+ (BOOL)touchFile:(NSString *)file;

@end
