//	  _____      __________    ___
//	 /\__  \    /\  __  __ \  /\  \
//	 \/_ \  \__ \ \ \ \ \ \ \ \ \  \___
//	    \ \____\ \ \_\ \_\ \ \ \ \_____\
//	     \/____/  \/_/\/_/\/_/  \/_____/
//
//
//  Copyright (c) 2014年 张明磊. All rights reserved.
//

#pragma mark - 版本号 -
/**
 *  版本号
 */
#undef	Zml_VERSION
#define Zml_VERSION		@"0.0.0"

#pragma mark - 头文件区 -
/**
 *  头文件区
 */

#pragma mark - 开关 -
/**
 *  开关
 */

#undef	__ON__
#define __ON__		(1)
//打开输出

#undef	__OFF__
#define __OFF__		(0)
//关闭输出

#pragma mark - 配置Log -
/**
 *  配置Log
 */
#undef  __ZML_LOG__
#define __ZML_LOG__	 (__ON__)

#pragma mark - 配置防闭环 -
/**
 *  配置防闭环
 */

#ifndef	weak_blockSelf
#define weak_blockSelf( x )	autoreleasepool{} __weak __typeof__(x) __weak_##x##__ = x;


#pragma mark - 配置实现 -
/**
 *  配置实现
 */
#if defined(__ZML_LOG__) && __ZML_LOG__
# define ZMLLog(format, ...) NSLog((@"[文件名:%s]" "[函数名:%s]" "[行号:%d]" format), __FILE__, __FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
# define ZMLLog(...);
#endif

#endif




