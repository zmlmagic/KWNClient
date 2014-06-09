//
//  ZMViewController.m
//  iosClassTool
//
//  Created by 张明磊 on 14-4-3.
//  Copyright (c) 2014年 张明磊. All rights reserved.
//

#import "ZMViewController.h"
#import "MINavigationController.h"
#import "ZINavigationController.h"
#import "ZMLNavigationController.h"

@implementation ZMViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        if([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
        {
            [self setNeedsStatusBarAppearanceUpdate];
        }
    }
    return self;
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (BOOL)prefersStatusBarHidden
{
    return NO;
}

- (void)pushViewController:(ZMViewController *)viewController
{
    viewController.navigationController_MI = _navigationController_MI;
    viewController.navigationController_ZI = _navigationController_ZI;
    viewController.navigationController_ZML = _navigationController_ZML;
    if(_navigationController_MI)
    {
        [_navigationController_MI pushViewController:viewController animated:YES];
    }
    else if(_navigationController_ZI)
    {
        [_navigationController_ZI pushViewController:viewController animated:YES];
    }
    else
    {
        [_navigationController_ZML pushViewController:viewController animated:NO];
    }
}

- (void)popViewController
{
    if(_navigationController_MI)
    {
        [_navigationController_MI popViewControllerAnimated:YES];
    }
    else if(_navigationController_ZI)
    {
        [_navigationController_ZI popViewControllerAnimated:YES];
    }
    else
    {
        [_navigationController_ZML popViewControllerAnimated:YES];
    }
}

@end
