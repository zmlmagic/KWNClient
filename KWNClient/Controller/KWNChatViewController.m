//
//  KWNChatViewController.m
//  KWNClient
//
//  Created by 张明磊 on 14-6-7.
//  Copyright (c) 2014年 张明磊. All rights reserved.
//

#import "KWNChatViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "Model_space.h"

static KWNChatViewController *controller_chat = nil;

@implementation KWNChatViewController

+ (KWNChatViewController *)sharedController;
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        controller_chat = [[self alloc] init];
    });
    return controller_chat;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = RGB(227, 227, 227);
    
    UIView *imageView_title = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44 + IOS7_SIZE)];
    imageView_title.backgroundColor = RGB(0, 143, 218);
    [self.view addSubview:imageView_title];
    
    UIImageView *imageView_titleText = [[UIImageView alloc] initWithFrame:CGRectMake(imageView_title.frame.size.width/2 - 35, IOS7_SIZE + 15, 70, 17)];
    imageView_titleText.image = [UIImage imageFileName:@"imageView_titleText.png"];
    [self.view addSubview:imageView_titleText];
    
    UIButton *button_menu = [UIButton buttonWithType:UIButtonTypeCustom];
    button_menu.frame = CGRectMake(0, IOS7_SIZE, 60, 45);
    [button_menu setImage:[UIImage imageFileName:@"button_back.png"] forState:UIControlStateNormal];
    button_menu.tag = 0;
    [button_menu addTarget:self action:@selector(didClickButton_chat:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button_menu];
    
    self.messageTableView.frame = CGRectMake(self.messageTableView.frame.origin.x, self.messageTableView.frame.origin.y + 50, self.messageTableView.frame.size.width, self.messageTableView.frame.size.height - 50);
    self.messageTableView.backgroundColor = [UIColor clearColor];
    
    // 设置自身用户名
    self.messageSender = @"self";
    [self loadDemoDataSource];
}

- (void)didClickButton_chat:(UIButton *)button
{
    switch (button.tag)
    {
        case 0:{
            [self dismissViewControllerAnimated:YES completion:nil];
        }break;
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (XHMessage *)getTextMessageWithBubbleMessageType:(XHBubbleMessageType)bubbleMessageType {
    if(bubbleMessageType == XHBubbleMessageTypeSending)
    {
        XHMessage *textMessage = [[XHMessage alloc] initWithText:[Model_space sharedModel].string_text sender:@"self" timestamp:[NSDate distantPast]];
        textMessage.avator = [UIImage imageNamed:@"11.png"];
        textMessage.bubbleMessageType = bubbleMessageType;
        return textMessage;
    }
    else
    {
        XHMessage *textMessage = [[XHMessage alloc] initWithText:[NSString stringWithFormat:@"你好，我是宁小辉律师，执业经验3年，擅长%@的问题。你的问题将由我来为你解答，请稍等5到10分钟。",[Model_space sharedModel].string_space] sender:@"sender" timestamp:[NSDate distantPast]];
        textMessage.avator = [UIImage imageNamed:@"10.png"];
        textMessage.bubbleMessageType = bubbleMessageType;
        return textMessage;
    }
}

- (XHMessage *)getTextMessageWithBubbleMessage_noType:(XHBubbleMessageType)bubbleMessageType
{
    XHMessage *textMessage = [[XHMessage alloc] initWithText:[NSString stringWithFormat:@"你好，你选择的领域是%@ ，请输入您要问的问题，我们将尽快分配律师为您解答 。",[Model_space sharedModel].string_space] sender:@"sender" timestamp:[NSDate distantPast]];
    textMessage.avator = [UIImage imageNamed:@"image_11.png"];
    textMessage.bubbleMessageType = bubbleMessageType;
    return textMessage;
}

- (XHMessage *)getVoiceMessageWithBubbleMessageType:(XHBubbleMessageType)bubbleMessageType {
    XHMessage *voiceMessage = [[XHMessage alloc] initWithVoicePath:nil voiceUrl:nil voiceDuration:@"1" sender:@"Jayson" timestamp:[NSDate date]];
    //voiceMessage.avator = [UIImage imageNamed:@"avator"];
    //voiceMessage.avatorUrl = @"http://www.pailixiu.com/jack/JieIcon@2x.png";
    voiceMessage.bubbleMessageType = bubbleMessageType;
    return voiceMessage;
}

- (NSMutableArray *)getTestMessages {
    NSMutableArray *messages = [[NSMutableArray alloc] init];
    if([Model_space sharedModel].string_text)
    {
        [messages addObject:[self getTextMessageWithBubbleMessageType:XHBubbleMessageTypeSending]];
        [messages addObject:[self getTextMessageWithBubbleMessageType:XHBubbleMessageTypeReceiving]];
    }
    else
    {
        [messages addObject:[self getTextMessageWithBubbleMessage_noType:XHBubbleMessageTypeReceiving]];
    }
    return messages;
}

- (void)loadDemoDataSource {
    WEAKSELF
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSMutableArray *messages = [weakSelf getTestMessages];
        dispatch_async(dispatch_get_main_queue(), ^{
            weakSelf.messages = messages;
            [weakSelf.messageTableView reloadData];
            [weakSelf scrollToBottomAnimated:NO];
        });
    });
}

#pragma mark - XHMessageTableViewCell delegate

- (void)multiMediaMessageDidSelectedOnMessage:(id<XHMessageModel>)message atIndexPath:(NSIndexPath *)indexPath onMessageTableViewCell:(XHMessageTableViewCell *)messageTableViewCell {
    UIViewController *disPlayViewController;
    switch (message.messageMediaType) {
        case XHBubbleMessageMediaTypeVideo:
        case XHBubbleMessageMediaTypePhoto: {

            
        }break;
        case XHBubbleMessageMediaTypeVoice:
        {
            //DLog(@"message : %@", message.voicePath);
            
            SystemSoundID soundID;
            AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath:message.voicePath], &soundID);  AudioServicesPlaySystemSound(soundID);
            
            [messageTableViewCell.messageBubbleView.animationVoiceImageView startAnimating];
            [messageTableViewCell.messageBubbleView.animationVoiceImageView performSelector:@selector(stopAnimating) withObject:nil afterDelay:3];
            
        }break;
        case XHBubbleMessageMediaTypeEmotion:
            DLog(@"facePath : %@", message.emotionPath);
            break;
        case XHBubbleMessageMediaTypeLocalPosition: {
            
            break;
        }
        default:
            break;
    }
    if (disPlayViewController) {
        [self.navigationController pushViewController:disPlayViewController animated:YES];
    }
}

- (void)didDoubleSelectedOnTextMessage:(id<XHMessageModel>)message atIndexPath:(NSIndexPath *)indexPath {
    /*DLog(@"text : %@", message.text);
    XHDisplayTextViewController *displayTextViewController = [[XHDisplayTextViewController alloc] init];
    displayTextViewController.message = message;
    [self.navigationController pushViewController:displayTextViewController animated:YES];*/
}

- (void)didSelectedAvatorAtIndexPath:(NSIndexPath *)indexPath {
    /*DLog(@"indexPath : %@", indexPath);
    XHProfileTableViewController *profileTableViewController = [[XHProfileTableViewController alloc] init];
    [self.navigationController pushViewController:profileTableViewController animated:YES];*/
}

- (void)menuDidSelectedAtBubbleMessageMenuSelecteType:(XHBubbleMessageMenuSelecteType)bubbleMessageMenuSelecteType {
    
}

#pragma mark - XHMessageTableViewController Delegate

- (BOOL)shouldLoadMoreMessagesScrollToTop {
    return NO;
}

- (void)loadMoreMessagesScrollTotop {
    if (!self.loadingMoreMessage) {
        self.loadingMoreMessage = YES;
        
        WEAKSELF
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            NSMutableArray *messages = [weakSelf getTestMessages];
            sleep(3);
            dispatch_async(dispatch_get_main_queue(), ^{
                [weakSelf insertOldMessages:messages];
                weakSelf.loadingMoreMessage = NO;
            });
        });
    }
}

/**
 *  发送文本消息的回调方法
 *
 *  @param text   目标文本字符串
 *  @param sender 发送者的名字
 *  @param date   发送时间
 */
- (void)didSendText:(NSString *)text fromSender:(NSString *)sender onDate:(NSDate *)date {
    XHMessage *textMessage = [[XHMessage alloc] initWithText:text sender:sender timestamp:date];
    textMessage.avator = [UIImage imageNamed:@"11.png"];
    [self addMessage:textMessage];
    [self finishSendMessageWithBubbleMessageType:XHBubbleMessageMediaTypeText];
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
    voiceMessage.avator = [UIImage imageNamed:@"11.png"];
    [self addMessage:voiceMessage];
    [self finishSendMessageWithBubbleMessageType:XHBubbleMessageMediaTypeVoice];
    [Model_space sharedModel].string_voicePath = voicePath;
}

/**
 *  是否显示时间轴Label的回调方法
 *
 *  @param indexPath 目标消息的位置IndexPath
 *
 *  @return 根据indexPath获取消息的Model的对象，从而判断返回YES or NO来控制是否显示时间轴Label
 */
- (BOOL)shouldDisplayTimestampForRowAtIndexPath:(NSIndexPath *)indexPath {
        return YES;
}

/**
 *  配置Cell的样式或者字体
 *
 *  @param cell      目标Cell
 *  @param indexPath 目标Cell所在位置IndexPath
 */
- (void)configureCell:(XHMessageTableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
        cell.messageBubbleView.displayTextView.textColor = [UIColor whiteColor];
}

/**
 *  协议回掉是否支持用户手动滚动
 *
 *  @return 返回YES or NO
 */
- (BOOL)shouldPreventScrollToBottomWhileUserScrolling {
    return YES;
}

@end
