//
//  Model_space.h
//  KWNClient
//
//  Created by 张明磊 on 14-6-7.
//  Copyright (c) 2014年 张明磊. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KWNChatViewController.h"

@interface Model_space : NSObject

#pragma mark - 领域 -
/**
 *  领域
 */
@property (strong, nonatomic) NSString *string_space;

#pragma mark - 个人企业tag -
/**
 *  tag
 */
@property (assign, nonatomic) NSInteger int_space;

@property (strong, nonatomic) NSString *string_text;

@property (strong, nonatomic) NSString *string_voicePath;

@property (strong, nonatomic) KWNChatViewController *controller_chat;


+ (Model_space *)sharedModel;

@end
