//
//  KWNHomeViewController.m
//  KWNClient
//
//  Created by 张明磊 on 14-4-15.
//  Copyright (c) 2014年 张明磊. All rights reserved.
//

#import "KWNHomeViewController.h"
#import "KWNSliderViewController.h"
#import "KWNDetailViewController.h"
#import "RESideMenu.h"
#import "ChangeView_all.h"
#import "KWNChatViewController.h"
#import "KWNTextSendViewController.h"
#import "Model_space.h"
#import "KWNSoundSendViewController.h"

@interface KWNHomeViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (assign ,nonatomic) BOOL bool_sound;

@end

@implementation KWNHomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self){
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notification_textClick:) name:@"notification_text"  object:nil];
        if([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
        {
            [self setNeedsStatusBarAppearanceUpdate];
            //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notification_textClick:) name:@"notification_text"  object:nil];
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

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"notification_text" object:nil];
}

- (void)viewDidLoad{
    [super viewDidLoad];
    [self UI_home];
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)UI_home{
    self.view.backgroundColor = RGB(227, 227, 227);
    
    UIView *imageView_title = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44 + IOS7_SIZE)];
    imageView_title.backgroundColor = RGB(0, 143, 218);
    [self.view addSubview:imageView_title];
    
    UIImageView *imageView_titleText = [[UIImageView alloc] initWithFrame:CGRectMake(imageView_title.frame.size.width/2 - 35, IOS7_SIZE + 15, 70, 17)];
    imageView_titleText.image = [UIImage imageFileName:@"imageView_titleText.png"];
    //imageView_titleText.image = [UIImage imageNamed:@"imageView_titleText.png"];
    [self.view addSubview:imageView_titleText];
    
    UIButton *button_menu = [UIButton buttonWithType:UIButtonTypeCustom];
    button_menu.frame = CGRectMake(0, IOS7_SIZE, 60, 45);
    [button_menu setImage:[UIImage imageFileName:@"button_menu.png"] forState:UIControlStateNormal];
    button_menu.tag = 0;
    [button_menu addTarget:self action:@selector(didClickButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button_menu];
    
    UIButton *button_receive = [UIButton buttonWithType:UIButtonTypeCustom];
    button_receive.frame = CGRectMake(imageView_title.frame.size.width - 60, button_menu.frame.origin.y, 60, 45);
    button_receive.backgroundColor = [UIColor clearColor];
    [button_receive setImage:[UIImage imageFileName:@"button_receive.png"] forState:UIControlStateNormal];
    button_receive.tag = 4;
    [button_receive addTarget:self action:@selector(didClickButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button_receive];
    
    UIImageView *imageView_background = [[UIImageView alloc] initWithFrame:CGRectMake(0, imageView_title.frame.size.height, 320, 74)];
    imageView_background.image = [UIImage imageFileName:@"imageView_homeBackground.png"];
    [self.view addSubview:imageView_background];
    
    UIButton *button_personal = [UIButton buttonWithType:UIButtonTypeCustom];
    button_personal.frame = CGRectMake(imageView_background.frame.size.width/2 - 155, imageView_background.frame.origin.y + 25, 150, 39);
    button_personal.backgroundColor = [UIColor clearColor];
    [button_personal setImage:[UIImage imageFileName:@"button_personal.png"] forState:UIControlStateNormal];
    button_personal.tag = 2;
    [button_personal addTarget:self action:@selector(didClickButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button_personal];
    
    UIButton *button_company = [UIButton buttonWithType:UIButtonTypeCustom];
    button_company.frame = CGRectMake(imageView_background.frame.size.width/2 + 5, button_personal.frame.origin.y, 150, 39);
    button_company.backgroundColor = [UIColor clearColor];
    [button_company setImage:[UIImage imageFileName:@"button_company.png"] forState:UIControlStateNormal];
    button_company.tag = 3;
    [button_company addTarget:self action:@selector(didClickButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button_company];
    
    UITableView *tableView_home = [[UITableView alloc] initWithFrame:CGRectMake(imageView_background.frame.origin.x, imageView_background.frame.origin.y + imageView_background.frame.size.height, imageView_background.frame.size.width, self.view.frame.size.height - imageView_background.frame.size.height - imageView_title.frame.size.height - 45)];
    tableView_home.backgroundColor = RGB(227, 227, 227);
    tableView_home.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView_home.delegate = self;
    tableView_home.dataSource = self;
    [self.view addSubview:tableView_home];
    
    /*UIImageView *imageView_inputBackground = [[UIImageView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 50, 320, 50)];
    imageView_inputBackground.image = [UIImage imageFileName:@"imageView_inputBack.png"];
    [self.view addSubview:imageView_inputBackground];*/
    
    /*UIButton *button_inputText = [UIButton buttonWithType:UIButtonTypeCustom];
    button_inputText.frame = CGRectMake(imageView_inputBackground.frame.origin.x + 10, imageView_inputBackground.frame.origin.y + 5, 39, 39);
    button_inputText.backgroundColor = [UIColor clearColor];
    [button_inputText setImage:[UIImage imageFileName:@"button_inputText.png"] forState:UIControlStateNormal];
    [button_inputText addTarget:self action:@selector(didClickButton:) forControlEvents:UIControlEventTouchUpInside];
    button_inputText.tag = 5;
    [self.view addSubview:button_inputText];
    
    UIButton *button_downSpeak = [UIButton buttonWithType:UIButtonTypeCustom];
    button_downSpeak.frame = CGRectMake(button_inputText.frame.origin.x + button_inputText.frame.size.width + 18, button_inputText.frame.origin.y, 233, 37);
    button_downSpeak.backgroundColor = [UIColor clearColor];
    [button_downSpeak setImage:[UIImage imageFileName:@"button_downSpeak.png"] forState:UIControlStateNormal];
    [button_downSpeak addTarget:self action:@selector(didClickButton:) forControlEvents:UIControlEventTouchUpInside];
    button_downSpeak.tag = 6;
    [self.view addSubview:button_downSpeak];*/
}

- (void)didClickButton:(UIButton *)button
{
    switch (button.tag)
    {
        case 0:
        {
            [[RESideMenu sharedInstance] presentMenuViewController];
        }break;
        case 1:{
            //KWNDetailViewController *detail = [[KWNDetailViewController alloc] init];
            //[self pushViewController:detail];
            
            
        }break;
        case 2:{
            [RESideMenu sharedInstance].panGestureEnabled = NO;
            
            ChangeView_all *view_all = [[ChangeView_all alloc] initWithFrame:CGRectMake(0, 0, 320, [[UIScreen mainScreen] currentMode].size.height/2)];
            [view_all configureViewWihtTag:1];
            [self.view addSubview:view_all];
            [view_all showAnimated];
            
            [Model_space sharedModel].int_space = 1;
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receive_single:) name:@"didClickFinish_single" object:nil];
            
            
        }break;
        case 3:
        {
            [RESideMenu sharedInstance].panGestureEnabled = NO;
            ChangeView_all *view_all = [[ChangeView_all alloc] initWithFrame:CGRectMake(0, 0, 320, [[UIScreen mainScreen] currentMode].size.height/2)];
            [view_all configureViewWihtTag:2];
            [self.view addSubview:view_all];
            [view_all showAnimated];
            
            [Model_space sharedModel].int_space = 2;
            
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receive_single:) name:@"didClickFinish_single" object:nil];
            
        }break;
        case 4:
        {
            if([Model_space sharedModel].controller_chat)
            {
                KWNChatViewController *controller_chat = [Model_space sharedModel].controller_chat;
                [self presentViewController:controller_chat animated:YES completion:nil];
            }
            else
            {
                [UIUtils showAlterView:@"您还未提问" afterTime:1.5f];
            }
        }break;
        case 5:
        {
            _bool_sound = NO;
            if([Model_space sharedModel].string_space)
            {
                KWNTextSendViewController *textSend = [[KWNTextSendViewController alloc] init];
                [self.navigationController pushViewController:textSend animated:YES];
                [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveNotification_send) name:@"didClickSend" object:nil];
                [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveNotification_back) name:@"didClickBack" object:nil];
            }
            else
            {
                [RESideMenu sharedInstance].panGestureEnabled = NO;
                ChangeView_all *view_all = [[ChangeView_all alloc] initWithFrame:CGRectMake(0, 0, 320, [[UIScreen mainScreen] currentMode].size.height/2)];
                [view_all configureViewWihtTag:0];
                [self.view addSubview:view_all];
                [view_all showAnimated];
                [Model_space sharedModel].int_space = 0;
                
                [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveNotification) name:@"didClickFinish" object:nil];
                [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveNotification_send) name:@"didClickSend" object:nil];
                [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveNotification_back) name:@"didClickBack" object:nil];
            }
        }break;
        case 6:
        {
            _bool_sound = YES;
            if([Model_space sharedModel].string_space)
            {
                //[Model_space sharedModel].string_text =nil;
                //[Model_space sharedModel].model_sound = nil;
                
                KWNChatViewController *chat = [[KWNChatViewController alloc] init];
                [Model_space sharedModel].controller_chat = chat;
                [self presentViewController:chat animated:YES completion:nil];
            }
            else
            {
                //NSLog(@"%f",[[UIScreen mainScreen] currentMode].size.height);
                
                [RESideMenu sharedInstance].panGestureEnabled = NO;
                ChangeView_all *view_all = [[ChangeView_all alloc] initWithFrame:CGRectMake(0, 0, 320, [[UIScreen mainScreen] currentMode].size.height/2)];
                [view_all configureViewWihtTag:0];
                [self.view addSubview:view_all];
                [view_all showAnimated];
                [Model_space sharedModel].int_space = 0;
                
                [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveNotification) name:@"didClickFinish" object:nil];
            }
        }break;
        default:
            break;
    }
}

#pragma mark - 点击键盘 -
/**
 *  点击键盘
 */
- (void)notification_textClick:(NSNotification *)notification{
    _bool_sound = NO;
    if([Model_space sharedModel].string_space){
        KWNTextSendViewController *textSend = [[KWNTextSendViewController alloc] init];
        [self.navigationController pushViewController:textSend animated:YES];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveNotification_send) name:@"didClickSend" object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveNotification_back) name:@"didClickBack" object:nil];
    }else{
        [RESideMenu sharedInstance].panGestureEnabled = NO;
        ChangeView_all *view_all = [[ChangeView_all alloc] initWithFrame:CGRectMake(0, 0, 320, [[UIScreen mainScreen] currentMode].size.height/2)];
        [view_all configureViewWihtTag:0];
        [self.view addSubview:view_all];
        [view_all showAnimated];
        //[Model_space sharedModel].int_space = 0;
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveNotification) name:@"didClickFinish" object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveNotification_send) name:@"didClickSend" object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveNotification_back) name:@"didClickBack" object:nil];
    }
}

- (void)receiveNotification
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"didClickFinish" object:nil];
    
    if(_bool_sound)
    {
        //[Model_space sharedModel].string_text =nil;
        //[Model_space sharedModel].model_sound = nil;
        
        KWNSoundSendViewController *sound = [[KWNSoundSendViewController alloc] init];
        [self.navigationController pushViewController:sound animated:YES];
        //[Model_space sharedModel].string_text =nil;
        //[Model_space sharedModel].string_voicePath = nil;
        /*KWNChatViewController *chat = [[KWNChatViewController alloc] init];
        [Model_space sharedModel].controller_chat = chat;
        [self presentViewController:chat animated:YES completion:nil];*/
    }
    else
    {
        if([Model_space sharedModel].string_space)
        {
        
            //[Model_space sharedModel].string_text =nil;
            //[Model_space sharedModel].model_sound = nil;
            
            KWNTextSendViewController *textSend = [[KWNTextSendViewController alloc] init];
            [self.navigationController pushViewController:textSend animated:YES];
        }else{
            return;
        }
    }
}

- (void)receive_single:(NSNotification *)notification{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"didClickFinish_single" object:nil];
    
    [Model_space sharedModel].string_text =nil;
    [Model_space sharedModel].model_sound = nil;
    
    if([Model_space sharedModel].string_space)
    {
        KWNChatViewController *chat = [[KWNChatViewController alloc] init];
        [Model_space sharedModel].controller_chat = chat;
        [self presentViewController:chat animated:YES completion:nil];
    }
}

- (void)receiveNotification_send
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"didClickSend" object:nil];
    KWNChatViewController *chat = [[KWNChatViewController alloc] init];
    [Model_space sharedModel].controller_chat = chat;

    double delayInSeconds = 0.1;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [self presentViewController:chat animated:YES completion:nil];
    });
}

- (void)receiveNotification_back
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"didClickSend" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"didClickBack" object:nil];
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
    static NSString *CellIdentifier = @"Cell_Home";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle: 	UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.backgroundColor = [UIColor clearColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        UIImageView *imageView_one = [[UIImageView alloc] initWithFrame:CGRectMake(- 320, 0, 320, 260)];
        imageView_one.image = [UIImage imageFileName:@"5.png"];
        [cell addSubview:imageView_one];
        
        UIImageView *imageView_two = [[UIImageView alloc] initWithFrame:CGRectMake(- 320, imageView_one.frame.origin.y + imageView_one.frame.size.height, 320, 55)];
        imageView_two.image = [UIImage imageFileName:@"6.png"];
        [cell addSubview:imageView_two];
        
        double delayInSeconds = 0.5;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            [UIView animateWithDuration:0.5f animations:
             ^{
                 [UIView beginAnimations:nil context:nil];
                 [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
                 [UIView setAnimationDuration:0.2f];
                 [UIView setAnimationRepeatCount:1];
                 [UIView setAnimationBeginsFromCurrentState:YES];
                 [imageView_one setCenter:CGPointMake(imageView_one.center.x + 320, imageView_one.center.y)];
                 [UIView commitAnimations];
             }completion:^(BOOL finish){if(finish){
                 
             }}];
        });
        
        double delayInSeconds_two = 1.0;
        dispatch_time_t popTime_two = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds_two * NSEC_PER_SEC);
        dispatch_after(popTime_two, dispatch_get_main_queue(), ^(void){
            [UIView animateWithDuration:0.5f animations:
             ^{
                 [UIView beginAnimations:nil context:nil];
                 [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
                 [UIView setAnimationDuration:0.2f];
                 [UIView setAnimationRepeatCount:1];
                 [UIView setAnimationBeginsFromCurrentState:YES];
                 [imageView_two setCenter:CGPointMake(imageView_two.center.x + 320, imageView_two.center.y)];
                 [UIView commitAnimations];
             }completion:^(BOOL finish){if(finish){
                 
             }}];
        });
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return tableView.frame.size.height + 50;
}

/**
 *  发送语音消息的回调方法
 *
 *  @param voicePath        目标语音本地路径
 *  @param voiceDuration    目标语音时长
 *  @param sender           发送者的名字
 *  @param date             发送时间
 */
- (void)didSendVoice:(NSString *)voicePath voiceDuration:(NSString*)voiceDuration fromSender:(NSString *)sender onDate:(NSDate *)date {
    XHMessage *voiceMessage = [[XHMessage alloc] initWithVoicePath:voicePath voiceUrl:nil voiceDuration:voiceDuration sender:sender timestamp:date];
    
    [Model_space sharedModel].string_text = nil;
    [Model_space sharedModel].model_sound = voiceMessage;
    [Model_space sharedModel].string_voicePath = voicePath;
    //voiceMessage.avator = [UIImage imageNamed:@"11.png"];
    //[self addMessage:voiceMessage];
    //[self finishSendMessageWithBubbleMessageType:XHBubbleMessageMediaTypeVoice];
    
    _bool_sound = YES;
    if([Model_space sharedModel].string_space)
    {
        KWNSoundSendViewController *soundSend = [[KWNSoundSendViewController alloc] init];
        [self.navigationController pushViewController:soundSend animated:YES];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveNotification_send) name:@"didClickSend" object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveNotification_back) name:@"didClickBack" object:nil];
        
        
        /*[Model_space sharedModel].string_text =nil;
        [Model_space sharedModel].string_voicePath = nil;
        KWNChatViewController *chat = [[KWNChatViewController alloc] init];
        [Model_space sharedModel].controller_chat = chat;
        [self presentViewController:chat animated:YES completion:nil];*/
    }
    else
    {
        //NSLog(@"%f",[[UIScreen mainScreen] currentMode].size.height);
        [RESideMenu sharedInstance].panGestureEnabled = NO;
        ChangeView_all *view_all = [[ChangeView_all alloc] initWithFrame:CGRectMake(0, 0, 320, [[UIScreen mainScreen] currentMode].size.height/2)];
        [view_all configureViewWihtTag:0];
        [self.view addSubview:view_all];
        [view_all showAnimated];
        
        //[Model_space sharedModel].int_space = 0;
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveNotification_send) name:@"didClickSend" object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveNotification_back) name:@"didClickBack" object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveNotification) name:@"didClickFinish" object:nil];
    }
}

@end
