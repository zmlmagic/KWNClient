//
//  Model_space.h
//  KWNClient
//
//  Created by 张明磊 on 14-6-7.
//  Copyright (c) 2014年 张明磊. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KWNChatViewController.h"
#import "XHMessage.h"

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

@property (strong, nonatomic) XHMessage *model_sound;

#pragma mark - 通知类型 -
/**
 *  通知类型
 */
@property (assign, nonatomic) NSInteger int_type;

#pragma mark - 识别符 -
/**
 *  识别符
 */
@property (assign, nonatomic) BOOL bool_first;

@property (assign, nonatomic) BOOL bool_chatRoom;

+ (Model_space *)sharedModel;

@end
