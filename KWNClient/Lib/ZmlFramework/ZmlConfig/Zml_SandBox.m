//	  _____      __________    ___
//	 /\__  \    /\  __  __ \  /\  \
//	 \/_ \  \__ \ \ \ \ \ \ \ \ \  \___
//	    \ \____\ \ \_\ \_\ \ \ \ \_____\
//	     \/____/  \/_/\/_/\/_/  \/_____/
//
//
//  Copyright (c) 2014年 张明磊. All rights reserved.
//

#import "Zml_SandBox.h"

@implementation Zml_SandBox

+ (NSString *)appPath
{
    NSString *__string_appPath;
	if (nil == __string_appPath)
	{
		NSError * error = nil;
		NSArray * paths = [[NSFileManager defaultManager] subpathsOfDirectoryAtPath:NSHomeDirectory() error:&error];
        
		for ( NSString * path in paths )
		{
			if ( [path hasSuffix:@".app"] )
			{
				__string_appPath = [NSString stringWithFormat:@"%@/%@", NSHomeDirectory(), path];
				break;
			}
		}
	}
    
	return __string_appPath;
}

+ (NSString *)docPath
{
    NSString *__string_docPath;
	if(nil == __string_docPath)
	{
		NSArray * paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
		__string_docPath = [paths objectAtIndex:0];
	}
	return __string_docPath;
}

+ (NSString *)libPrefPath
{
    NSString *__string_libPrefPath;
	if(nil == __string_libPrefPath)
	{
		NSArray * paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
		NSString * path = [[paths objectAtIndex:0] stringByAppendingFormat:@"/Preference"];
		[self touchDic:path];
		__string_libPrefPath = path;
	}
	return __string_libPrefPath;
}

+ (NSString *)libCachePath
{
    NSString *__string_libCachePath;
	if ( nil == __string_libCachePath )
	{
		NSArray * paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
		NSString * path = [[paths objectAtIndex:0] stringByAppendingFormat:@"/Caches"];
        
		[self touchDic:path];
		__string_libCachePath = path;
	}
	return __string_libCachePath;
}

+ (NSString *)tmpPath
{
    NSString *__string_tmpPath;
	if ( nil == __string_tmpPath )
	{
		NSArray * paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
		NSString * path = [[paths objectAtIndex:0] stringByAppendingFormat:@"/tmp"];
		[self touchDic:path];
		__string_tmpPath = path;
	}
	return __string_tmpPath;
}

#pragma mark - 查看是否存在目录,不存在创建 -
/**
 *  查看是否存在目录,不存在创建
 */
+ (BOOL)touchDic:(NSString *)path
{
	if ( NO == [[NSFileManager defaultManager] fileExistsAtPath:path] )
	{
		return [[NSFileManager defaultManager] createDirectoryAtPath:path
										 withIntermediateDirectories:YES
														  attributes:nil
															   error:NULL];
	}
	return YES;
}

#pragma mark - 查看是否存在文件,不存在创建 -
/**
 *  查看是否存在文件,不存在创建
 */
+ (BOOL)touchFile:(NSString *)file
{
	if ( NO == [[NSFileManager defaultManager] fileExistsAtPath:file] )
	{
		return [[NSFileManager defaultManager] createFileAtPath:file
													   contents:[NSData data]
													 attributes:nil];
	}
	return YES;
}

@end
