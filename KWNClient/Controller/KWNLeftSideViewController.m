//
//  KWNLeftSideViewController.m
//  KWNClient
//
//  Created by 张明磊 on 14-4-15.
//  Copyright (c) 2014年 张明磊. All rights reserved.
//

#import "KWNLeftSideViewController.h"
#import "KWNSetViewController.h"
#import "KWNShareViewController.h"
#import "KWNHomeViewController.h"
#import "Model_space.h"
#import "KWNChatViewController.h"
#import "RESideMenu.h"

@interface KWNLeftSideViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation KWNLeftSideViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.view.backgroundColor = RGB(36, 36, 36);
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self installViewUI];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 *  初始化UI界面
 */
- (void)installViewUI
{
    UITableView *tableView_menu = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    tableView_menu.backgroundColor = [UIColor clearColor];
    tableView_menu.delegate = self;
    tableView_menu.dataSource = self;
    [self.view addSubview:tableView_menu];
    tableView_menu.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return 4;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *CellIdentifier = @"Cell_menu";
    UITableViewCell *cell = [tableView  dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle: 	UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = [UIColor clearColor];
    }
    switch (indexPath.row)
    {
        case 0:
        {
            UIImageView *imageView_title = [[UIImageView alloc] initWithFrame:CGRectMake(cell.frame.size.width/2 - 90, 35, 131, 61)];
            imageView_title.image = [UIImage imageFileName:@"imageView_menu_title.png"];
            [cell addSubview:imageView_title];
            UIView *view_line = [[UIView alloc] initWithFrame:CGRectMake(0, 114, cell.frame.size.width, 1)];
            [view_line setBackgroundColor:[UIColor blackColor]];
            [cell addSubview:view_line];
        }break;
        case 1:
        {
            UIImageView *imageView_ask = [[UIImageView alloc] initWithFrame:CGRectMake(cell.frame.size.width/2 - 90, 5, 148, 59)];
            imageView_ask.image = [UIImage imageFileName:@"imageView_ask.png"];
            [cell addSubview:imageView_ask];
            UIView *view_line = [[UIView alloc] initWithFrame:CGRectMake(0, 65, cell.frame.size.width, 1)];
            [view_line setBackgroundColor:[UIColor blackColor]];
            [cell addSubview:view_line];
        }break;
        case 2:
        {
            UIImageView *imageView_share = [[UIImageView alloc] initWithFrame:CGRectMake(cell.frame.size.width/2 - 90, 5, 148, 59)];
            imageView_share.image = [UIImage imageFileName:@"imageView_share.png"];
            [cell addSubview:imageView_share];
            UIView *view_line = [[UIView alloc] initWithFrame:CGRectMake(0, 65, cell.frame.size.width, 1)];
            [view_line setBackgroundColor:[UIColor blackColor]];
            [cell addSubview:view_line];
        }break;
        case 3:
        {
            UIImageView *imageView_set = [[UIImageView alloc] initWithFrame:CGRectMake(cell.frame.size.width/2 - 90, 5, 148, 59)];
            imageView_set.image = [UIImage imageFileName:@"imageView_set.png"];
            [cell addSubview:imageView_set];
            UIView *view_line = [[UIView alloc] initWithFrame:CGRectMake(0, 65, cell.frame.size.width, 1)];
            [view_line setBackgroundColor:[UIColor blackColor]];
            [cell addSubview:view_line];
        }break;
        default:
            break;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row)
    {
        case 1:
        {
            if([Model_space sharedModel].string_text || [Model_space sharedModel].string_voicePath)
            {
                [[RESideMenu sharedInstance] hideMenuViewController];
                KWNChatViewController *chat = [Model_space sharedModel].controller_chat;
                KWNHomeViewController *controller_home = (KWNHomeViewController *)[RESideMenu sharedInstance].contentViewController;
                [controller_home presentViewController:chat animated:YES completion:nil];
            }
            else
            {
                [UIUtils showAlterView:@"您还未提问" afterTime:1.5];
            }
            
        } break;
        case 2:
        {
            KWNShareViewController *controller_share = [[KWNShareViewController alloc] init];
            [[RESideMenu sharedInstance] hideMenuViewController];
            KWNHomeViewController *controller_home = (KWNHomeViewController *)[RESideMenu sharedInstance].contentViewController;
            [controller_home.navigationController pushViewController:controller_share animated:YES];
            
        }break;
        case 3:{
            KWNSetViewController *controller_set = [[KWNSetViewController alloc] init];
            [[RESideMenu sharedInstance] hideMenuViewController];
            KWNHomeViewController *controller_home = (KWNHomeViewController *)[RESideMenu sharedInstance].contentViewController;
            [controller_home.navigationController pushViewController:controller_set animated:YES];
        }break;
        default:
            break;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row)
    {
        case 0:
        {
            return 109;
        }break;
        default:
        {
            return 60;
        }break;
    }
}

@end
