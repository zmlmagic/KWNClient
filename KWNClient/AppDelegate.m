//
//  AppDelegate.m
//  KWNClient
//
//  Created by 张明磊 on 14-4-14.
//  Copyright (c) 2014年 张明磊. All rights reserved.
//

#import "AppDelegate.h"
#import "KWNLeftSideViewController.h"
#import "KWNHomeViewController.h"
#import "MINavigationController.h"
#import "RESideMenu.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    KWNHomeViewController *controller_root = [[KWNHomeViewController alloc] init];
    KWNLeftSideViewController *controller_left = [[KWNLeftSideViewController alloc] init];
    RESideMenu *sideMenuViewController = [[RESideMenu alloc] initWithContentViewController:controller_root menuViewController:controller_left];
    sideMenuViewController.backgroundImage = [UIImage imageFileName:@"imageView_menuBack.png"];
    sideMenuViewController.contentViewScaleValue = 0.9;
    sideMenuViewController.contentViewInPortraitOffsetCenterX = 95;
    sideMenuViewController.menuPreferredStatusBarStyle = UIStatusBarStyleLightContent;
    [[RESideMenu sharedInstance] setPanGestureEnabled:NO];
    
    UINavigationController *navigation_root = [[UINavigationController alloc] initWithRootViewController:sideMenuViewController];
    navigation_root.navigationBarHidden = YES;
    
    self.window.rootViewController = navigation_root;
    [self.window makeKeyAndVisible];
    
    [self playAnimationDurationInBegin];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - 启动页动画 -
/**
 *  启动页动画
 */
- (void)playAnimationDurationInBegin
{
    __block UIImageView *splashView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].currentMode.size.width/2, [UIScreen mainScreen].currentMode.size.height/2)];
    if(iPhone5)
    {
        splashView.image = [UIImage imageFileName:@"Default_960.png"];
    }
    else
    {
        splashView.image = [UIImage imageFileName:@"Default_480.png"];
    }
    [self.window addSubview:splashView];
    [self.window bringSubviewToFront:splashView];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationTransition:UIViewAnimationTransitionNone forView: self.window cache:YES];
    [UIView setAnimationDelegate:self];
    splashView.alpha = 0.0;
    splashView.frame = CGRectMake(-160, -185, 640, 915);
    [UIView commitAnimations];
}

@end
