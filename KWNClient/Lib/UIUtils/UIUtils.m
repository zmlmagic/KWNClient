//
//  UIUtils.m
//  lvgouProjectIphone
//
//  Created by 张明磊 on 14-3-26.
//  Copyright (c) 2014年 lvgou. All rights reserved.
//

#import "UIUtils.h"
#import "MBHUDView.h"

@implementation UIUtils

#pragma mark - 非动态绑定,直接地址调用函数 -
/**
 *  非动态绑定,直接地址调用函数
 重复调用的函数可用此for循环
 */

void(* loadingFounction)(id, SEL ,id);

+ (void)useClass:(id)class_name
    loadFountion:(NSString *)function_name
    andParameter:(id)model
{
    SEL class_sel = NSSelectorFromString(function_name);
    IMP class_imp = [class_name methodForSelector:class_sel];
    loadingFounction = (void(*)(id, SEL, id))class_imp;
    loadingFounction(class_name,class_sel,model);
}

#pragma mark - 显示等待框 -
/**
 *  显示等待框
 *  view_cover为可点击层,如果为nil,则为全屏遮罩
 */
+ (void)showHUDWithContent:(NSString *)string_content inCoverView:(UIView *)view_cover
{
    if(view_cover)
    {
        [MBHUDView hudWithBody:string_content type:MBAlertViewHUDTypeActivityIndicator hidesAfter:888.0f show:YES inCoverView:view_cover];
    }
    else
    {
        [MBHUDView hudWithBody:string_content type:MBAlertViewHUDTypeActivityIndicator hidesAfter:888.0f show:YES];
    }
}

#pragma mark -
#pragma mark MBProgressHUD
+ (void)showHUD:(NSString *)_infoContent afterTime:(float)time
{
    [MBHUDView hudWithBody:_infoContent type:MBAlertViewHUDTypeActivityIndicator hidesAfter:time show:YES];
}

+ (void)showAlterView:(NSString *)_infoContent afterTime:(float)time
{
    [MBHUDView hudWithBody:_infoContent type:MBAlertViewHUDTypeDefault hidesAfter:time show:YES];
}

#pragma mark - 消除等待框 -
/**
 *  消除等待框
 */
+ (void)dismissCurrentHUD
{
    [MBHUDView dismissCurrentHUD];
}

#pragma mark - 检测网络 -
/**
 *  检测网络
 */
+ (BOOL)isConnectNetwork
{
    BOOL connect_result = YES;
    /*Reachability *connect_net = [Reachability reachabilityWithHostname:@"www.baidu.com"];
    switch ([connect_net currentReachabilityStatus])
    {
        case NotReachable:
        {
            connect_result = NO;
        }break;
        case ReachableViaWWAN:
        {
            connect_result = YES;
        }break;
        case ReachableViaWiFi:
        {
            connect_result = YES;
        }break;}*/
    return connect_result;
}

#pragma mark - 压缩图片尺寸 -
/**
 *  压缩图片
 */
+ (UIImage *)imageWithImageSimple:(UIImage*)image scaledToSize:(CGSize)newSize
{
    UIGraphicsBeginImageContext(newSize);
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

#pragma mark - 压缩图片大小 -
/**
 *  压缩图片大小
 */
+ (NSData *)saveImage:(UIImage *)tempImage WithName:(NSString *)imageName
{
    NSData *imageData = UIImageJPEGRepresentation(tempImage,1);
    if(imageData.length/1000 > 2000)
    {
        for(int i = 0; imageData.length < 2000; i++)
        {
            imageData = UIImageJPEGRepresentation(tempImage,1 - 0.1*i);
        }
    }
    //NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //NSString *documentsDirectory = [paths objectAtIndex:0];
    //NSString *fullPathToFile = [documentsDirectory stringByAppendingPathComponent:imageName];
    //[imageData writeToFile:fullPathToFile atomically:NO];
    //NSLog(@"%d",imageData.length/1000);
    return imageData;
}

@end
