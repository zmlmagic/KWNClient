//
//  Model_space.m
//  KWNClient
//
//  Created by 张明磊 on 14-6-7.
//  Copyright (c) 2014年 张明磊. All rights reserved.
//

#import "Model_space.h"

static Model_space *modelSpace = nil;

@implementation Model_space

+ (Model_space *)sharedModel
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        modelSpace = [[self alloc] init];
        modelSpace.bool_first = NO;
        modelSpace.bool_chatRoom = NO;
    });
    return modelSpace;
}

@end
