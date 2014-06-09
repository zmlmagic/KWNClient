//
//  ChangeView_all.h
//  KWNClient
//
//  Created by 张明磊 on 14-6-7.
//  Copyright (c) 2014年 张明磊. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, AlertViewBackgroundStyle)
{
    AlertViewBackgroundStyleGradient = 0,
    AlertViewBackgroundStyleSolid,
};

typedef NS_ENUM(NSInteger, AlertViewTransitionStyle)
{
    AlertViewTransitionStyleSlideFromBottom = 0,
    AlertViewTransitionStyleSlideFromTop,
    AlertViewTransitionStyleFade,
    AlertViewTransitionStyleBounce,
    AlertViewTransitionStyleDropDown
};

@interface ChangeView_all : UIView

@property (nonatomic, assign) AlertViewTransitionStyle transitionStyle;
@property (nonatomic, assign) AlertViewBackgroundStyle style;

@property (weak, nonatomic) UIView *view_content;
@property (weak, nonatomic) UIView *view_background;

- (void)showAnimated;
- (void)dismissAnimated;
- (void)configureViewWihtTag:(NSInteger )tag;

@end
