//
//  KWNSetViewController.m
//  KWNClient
//
//  Created by 张明磊 on 14-5-10.
//  Copyright (c) 2014年 张明磊. All rights reserved.
//

#import "KWNSetViewController.h"
#import "RESideMenu.h"

@interface KWNSetViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation KWNSetViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self){

    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    [self UI_set];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)UI_set
{
    self.view.backgroundColor = RGB(227, 227, 227);
    
    UIView *imageView_title = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44 + IOS7_SIZE)];
    imageView_title.backgroundColor = RGB(0, 143, 218);
    [self.view addSubview:imageView_title];
    
    UIImageView *imageView_titleText = [[UIImageView alloc] initWithFrame:CGRectMake(imageView_title.frame.size.width/2 - 35, IOS7_SIZE + 15, 70, 17)];
    imageView_titleText.image = [UIImage imageFileName:@"imageView_setTitle.png"];
    [self.view addSubview:imageView_titleText];
    
    UIButton *button_menu = [UIButton buttonWithType:UIButtonTypeCustom];
    button_menu.frame = CGRectMake(0, IOS7_SIZE, 60, 45);
    [button_menu setImage:[UIImage imageFileName:@"button_back.png"] forState:UIControlStateNormal];
    button_menu.tag = 0;
    [button_menu addTarget:self action:@selector(click_set:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button_menu];
    
    UITableView *tableView_home = [[UITableView alloc] initWithFrame:CGRectMake(imageView_title.frame.origin.x, imageView_title.frame.origin.y + imageView_title.frame.size.height, imageView_title.frame.size.width, self.view.frame.size.height - imageView_title.frame.size.height )];
    tableView_home.backgroundColor = [UIColor clearColor];
    tableView_home.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView_home.delegate = self;
    tableView_home.dataSource = self;
    [self.view addSubview:tableView_home];
}

- (void)click_set:(UIButton *)button{
    switch (button.tag)
    {
        case 0:
        {
            [self popViewController];
            //[[RESideMenu sharedInstance] presentMenuViewController];
        }break;
        case 1:
        {
            
        }break;
        default:
            break;
    }
}

/**
 *  列表数据源
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell_Set";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle: 	UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.backgroundColor = [UIColor clearColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        UIButton *button_one = [UIButton buttonWithType:UIButtonTypeCustom];
        button_one.frame = CGRectMake(0, 30, 320, 44);
        [button_one setImage:[UIImage imageFileName:@"set_0.png"] forState:UIControlStateNormal];
        //[button_one addTarget:self action:@selector(didClickButton_one:)forControlEvents:UIControlEventTouchUpInside];
        [cell addSubview:button_one];
        
        UIButton *button_two = [UIButton buttonWithType:UIButtonTypeCustom];
        button_two.frame = CGRectMake(button_one.frame.origin.x, button_one.frame.origin.y + button_one.frame.size.height, 320, 44);
        [button_two setImage:[UIImage imageFileName:@"set_1.png"] forState:UIControlStateNormal];
        //[button_two addTarget:self action:@selector(didClickButton_two:)forControlEvents:UIControlEventTouchUpInside];
        [cell addSubview:button_two];
        
        UIButton *button_three = [UIButton buttonWithType:UIButtonTypeCustom];
        button_three.frame = CGRectMake(button_two.frame.origin.x, button_two.frame.origin.y + button_two.frame.size.height , 320, 44);
        button_three.backgroundColor = [UIColor clearColor];
        [button_three setImage:[UIImage imageFileName:@"set_2.png"] forState:UIControlStateNormal];
        //[button_three addTarget:self action:@selector(didClickButton_three:)forControlEvents:UIControlEventTouchUpInside];
        [cell addSubview:button_three];

        UIButton *button_four = [UIButton buttonWithType:UIButtonTypeCustom];
        button_four.frame = CGRectMake(button_three.frame.origin.x, button_three.frame.origin.y + button_three.frame.size.height, 320, 44);
        [button_four setImage:[UIImage imageFileName:@"set_3.png"] forState:UIControlStateNormal];
        //[button_four addTarget:self action:@selector(didClickButton_four:)forControlEvents:UIControlEventTouchUpInside];
        [cell addSubview:button_four];
        
        UIButton *button_five = [UIButton buttonWithType:UIButtonTypeCustom];
        button_five.frame = CGRectMake(160 - 151, button_four.frame.origin.y + 80, 302, 53);
        [button_five setImage:[UIImage imageFileName:@"set_4.png"] forState:UIControlStateNormal];
        //[button_five addTarget:self action:@selector(didClickButton_five:)forControlEvents:UIControlEventTouchUpInside];
        [cell addSubview:button_five];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return tableView.frame.size.height;
}

@end
