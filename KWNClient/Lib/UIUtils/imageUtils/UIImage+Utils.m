//
//  UIImage+Utils.m
//  lvgouProjectIphone
//
//  Created by 张明磊 on 14-3-26.
//  Copyright (c) 2014年 lvgou. All rights reserved.
//

#import "UIImage+Utils.h"

@implementation UIImage (Utils)

#pragma mark - 加载压缩图片 -
/**
 *  加载压缩图片
 */
+ (UIImage *)imageFileName:(NSString *)filename
{
    @autoreleasepool
    {
        /*NSString *path = [[NSBundle mainBundle] pathForResource:@"0@2x" ofType:@"png"];
        NSLog(@"%@",path);*/
        
        NSString *imageFile = [NSString stringWithFormat:@"%@/%@", [[NSBundle mainBundle] resourcePath], filename];
        
        //NSLog(@"%@",imageFile);
        
        UIImage *image =  [UIImage imageWithContentsOfFile:imageFile];
        return image;
    }
}

@end
