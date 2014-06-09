//
//  UIUtils.h
//  lvgouProjectIphone
//
//  Created by 张明磊 on 14-3-26.
//  Copyright (c) 2014年 lvgou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIImage+Utils.h"

#undef  iPhone5
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

#undef  IOS7_STATEBAR
#define IOS7_STATEBAR ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0 ?[self setNeedsStatusBarAppearanceUpdate]:[[UIApplication sharedApplication] setStatusBarHidden:NO])

#undef  IOS7
#define IOS7(view) ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0 ?[view setFrame:CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width, view.frame.size.height + 20)]:NO)

#undef  IOS7_VERSION
#define IOS7_VERSION ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0 ?YES:NO)

#undef  IOS7_SIZE
#define IOS7_SIZE ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0 ?20:0)

#undef  RGB
#define RGB(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]

@interface UIUtils : NSObject

#pragma mark - 非动态绑定,直接地址调用函数 -
/**
 *  非动态绑定,直接地址调用函数
 重复调用的函数可用此for循环
 
 class_name类名，function_name方法名，midel参数
 */
+ (void)useClass:(id)class_name
    loadFountion:(NSString *)function_name
    andParameter:(id)model;

#pragma mark - 显示等待框 -
/**
 *  显示等待框
 *  view_cover为可点击层,如果为nil,则为全屏遮罩
 */
+ (void)showHUDWithContent:(NSString *)string_content inCoverView:(UIView *)view_cover;

#pragma mark - MBProgressHUD
+ (void)showHUD:(NSString *)_infoContent afterTime:(float)time;
+ (void)showAlterView:(NSString *)_infoContent afterTime:(float)time;

#pragma mark - 消除等待框 -
/**
 *  消除等待框
 */
+ (void)dismissCurrentHUD;

#pragma mark - 检测网络 -
/**
 *  检测网络
 */
+ (BOOL)isConnectNetwork;

#pragma mark - 压缩图片尺寸 -
/**
 *  压缩图片
 */
+ (UIImage *)imageWithImageSimple:(UIImage*)image scaledToSize:(CGSize)newSize;

#pragma mark - 压缩图片大小 -
/**
 *  压缩图片大小
 */
+ (NSData *)saveImage:(UIImage *)tempImage WithName:(NSString *)imageName;

@end
