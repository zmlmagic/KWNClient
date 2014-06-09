//
//  KWNTextSendViewController.m
//  KWNClient
//
//  Created by 张明磊 on 14-6-8.
//  Copyright (c) 2014年 张明磊. All rights reserved.
//

#import "KWNTextSendViewController.h"
#import "Model_space.h"
#import "ChangeView_all.h"

@interface KWNTextSendViewController ()<UITableViewDataSource,UITableViewDelegate,UITextViewDelegate>

@property (weak, nonatomic) UILabel *label_space;
@property (weak, nonatomic) UITextView *textContent;

@end

@implementation KWNTextSendViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self){
        
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    [self UI_text];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)UI_text{
    self.view.backgroundColor = RGB(227, 227, 227);
    
    UIView *imageView_title = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44 + IOS7_SIZE)];
    imageView_title.backgroundColor = RGB(0, 143, 218);
    [self.view addSubview:imageView_title];
    
    UIImageView *imageView_titleText = [[UIImageView alloc] initWithFrame:CGRectMake(imageView_title.frame.size.width/2 - 35, IOS7_SIZE + 15, 70, 17)];
    imageView_titleText.image = [UIImage imageFileName:@"text_0.png"];
    [self.view addSubview:imageView_titleText];
    
    UIButton *button_menu = [UIButton buttonWithType:UIButtonTypeCustom];
    button_menu.frame = CGRectMake(0, IOS7_SIZE, 60, 45);
    [button_menu setImage:[UIImage imageFileName:@"button_back.png"] forState:UIControlStateNormal];
    button_menu.tag = 0;
    [button_menu addTarget:self action:@selector(click_textSend:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button_menu];
    
    UITableView *tableView_home = [[UITableView alloc] initWithFrame:CGRectMake(imageView_title.frame.origin.x, imageView_title.frame.origin.y + imageView_title.frame.size.height, imageView_title.frame.size.width, self.view.frame.size.height - imageView_title.frame.size.height )];
    tableView_home.backgroundColor = [UIColor clearColor];
    tableView_home.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView_home.delegate = self;
    tableView_home.dataSource = self;
    [self.view addSubview:tableView_home];
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
    static NSString *CellIdentifier = @"Cell_Share";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle: 	UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.backgroundColor = [UIColor clearColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        UIImageView *imageView_input = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 128)];
        imageView_input.image = [UIImage imageFileName:@"text_1.png"];
        [cell addSubview:imageView_input];
        
        UITextView *input = [[UITextView alloc] initWithFrame:CGRectMake(10, 18, 300, 112)];
        input.backgroundColor = [UIColor clearColor];
        input.textColor = [UIColor grayColor];
        input.text = @"请输入您要问的问题";
        input.font = [UIFont systemFontOfSize:16.0f];
        input.autocorrectionType = UITextAutocorrectionTypeNo;
        input.autocapitalizationType = UITextAutocapitalizationTypeNone;
        [cell addSubview:input];
        input.delegate = self;
        _textContent = input;
        
        UIButton *button_two = [UIButton buttonWithType:UIButtonTypeCustom];
        button_two.frame = CGRectMake(imageView_input.frame.origin.x, imageView_input.frame.origin.y + imageView_input.frame.size.height, 320, 51);
        button_two.backgroundColor = [UIColor clearColor];
        [button_two setImage:[UIImage imageFileName:@"text_2.png"] forState:UIControlStateNormal];
        [button_two addTarget:self action:@selector(click_textSend:)forControlEvents:UIControlEventTouchUpInside];
        button_two.tag = 1;
        [cell addSubview:button_two];
        
        UILabel *label_space = [[UILabel alloc] initWithFrame:CGRectMake(200, 11, 150, 30)];
        [label_space setBackgroundColor:[UIColor clearColor]];
        [label_space setTextColor:[UIColor blackColor]];
        label_space.font = [UIFont systemFontOfSize:14.0f];
        label_space.text = [Model_space sharedModel].string_space;
        [button_two addSubview:label_space];
        _label_space = label_space;
        
        UIImageView *imageView_three = [[UIImageView alloc] initWithFrame:CGRectMake(button_two.frame.origin.x, button_two.frame.origin.y + button_two.frame.size.height, 320, 40)];
        imageView_three.image = [UIImage imageFileName:@"text_3.png"];
        [cell addSubview:imageView_three];
        
        UIButton *button_four = [UIButton buttonWithType:UIButtonTypeCustom];
        button_four.frame = CGRectMake(9, imageView_three.frame.origin.y + imageView_three.frame.size.height, 302, 53);
        button_four.backgroundColor = [UIColor clearColor];
        [button_four setImage:[UIImage imageFileName:@"text_4.png"] forState:UIControlStateNormal];
        [button_four addTarget:self action:@selector(click_textSend:)forControlEvents:UIControlEventTouchUpInside];
        button_four.tag = 2;
        [cell addSubview:button_four];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return tableView.frame.size.height;
}

- (void)click_textSend:(UIButton *)button{
    switch (button.tag)
    {
        case 0:
        {
            [self popViewController];
             [[NSNotificationCenter defaultCenter] postNotificationName:@"didClickBack"object:nil];
            
        }break;
        case 1:
        {
            ChangeView_all *view_all = [[ChangeView_all alloc] initWithFrame:CGRectMake(0, 0, 320, [[UIScreen mainScreen] currentMode].size.height/2)];
            [view_all configureViewWihtTag:[Model_space sharedModel].int_space];
            [self.view addSubview:view_all];
            [view_all showAnimated];
            
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveNotification_text) name:@"didClickFinish" object:nil];
        
        }break;
        case 2:
        {
            if([_textContent.text length] == 0)
            {
                [UIUtils showAlterView:@"内容不能为空" afterTime:1.5f];
            }
            else
            {
                [Model_space sharedModel].string_text = _textContent.text;
                [self popViewController];
                
                [[NSNotificationCenter defaultCenter] postNotificationName:@"didClickSend"object:nil];
                
            }
        }break;
        default:
            break;
    }
}

- (void)receiveNotification_text
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"didClickFinish" object:nil];
    _label_space.text = [Model_space sharedModel].string_space;
}

- (void)textViewDidBeginEditing:(UITextView *)textView
{
    if([textView.text isEqualToString:@"请输入您要问的问题"])
    {
        textView.text = nil;
    }
    UIButton *button_back = [UIButton buttonWithType:UIButtonTypeCustom];
    button_back.frame = CGRectMake(0, 0, 320, 300);
    button_back.backgroundColor = [UIColor blackColor];
    button_back.alpha = 0.2;
    [self.view addSubview:button_back];
    [button_back addTarget:self action:@selector(didClickbutton_back:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didClickbutton_back:(UIButton *)button
{
    [button removeFromSuperview];
    [self.view endEditing:YES];
}

@end
