//
//  ZMViewController.h
//  iosClassTool
//
//  Created by 张明磊 on 14-4-3.
//  Copyright (c) 2014年 张明磊. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MINavigationController;
@class ZINavigationController;
@class ZMLNavigationController;

@interface ZMViewController : UIViewController

@property (assign ,nonatomic) MINavigationController *navigationController_MI;
@property (assign, nonatomic) ZINavigationController *navigationController_ZI;
@property (assign, nonatomic) ZMLNavigationController *navigationController_ZML;

- (void)pushViewController:(ZMViewController *)viewController;
- (void)popViewController;

@end
