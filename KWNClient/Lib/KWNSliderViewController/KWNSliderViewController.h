//
//  KWNSliderViewController.h
//  KWNClient
//
//  Created by 张明磊 on 14-4-15.
//  Copyright (c) 2014年 张明磊. All rights reserved.
//

#import "ZMViewController.h"
//#import <QuartzCore/QuartzCore.h>

typedef enum
{
    DDMenuPanDirectionLeft = 0,
    DDMenuPanDirectionRight,
} DDMenuPanDirection;

typedef enum
{
    DDMenuPanCompletionLeft = 0,
    DDMenuPanCompletionRight,
    DDMenuPanCompletionRoot,
} DDMenuPanCompletion;

@protocol DDMenuControllerDelegate;
@interface KWNSliderViewController : ZMViewController<UIGestureRecognizerDelegate>
{
    id _tap;
    id _pan;
    CGFloat _panOriginX;
    CGPoint _panVelocity;
    DDMenuPanDirection _panDirection;
    struct
    {
        unsigned int respondsToWillShowViewController:1;
        unsigned int showingLeftView:1;
        unsigned int showingRightView:1;
        unsigned int canShowRight:1;
        unsigned int canShowLeft:1;
    } _menuFlags;
}

+ (KWNSliderViewController *)sharedController;
- (id)initWithRootViewController:(UIViewController*)controller;

@property(nonatomic,assign) id <DDMenuControllerDelegate> delegate;

@property(nonatomic,strong) UIViewController *leftViewController;
@property(nonatomic,strong) UIViewController *rightViewController;
@property(nonatomic,strong) UIViewController *rootViewController;

@property(nonatomic,readonly) UITapGestureRecognizer *tap;
@property(nonatomic,readonly) UIPanGestureRecognizer *pan;

- (void)setRootController:(UIViewController *)controller animated:(BOOL)animated; // used to push a new controller on the stack
- (void)showRootController:(BOOL)animated; // reset to "home" view controller
- (void)showRightController:(BOOL)animated;  // show right
- (void)showLeftController:(BOOL)animated;  // show left
- (void)setPanUsedWithBool:(BOOL)_bool;

@end

@protocol DDMenuControllerDelegate
- (void)menuController:(KWNSliderViewController *)controller willShowViewController:(UIViewController*)controller;


@end
