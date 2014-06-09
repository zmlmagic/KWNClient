//
//  ChangeView_all.m
//  KWNClient
//
//  Created by 张明磊 on 14-6-7.
//  Copyright (c) 2014年 张明磊. All rights reserved.
//

#import "ChangeView_all.h"
#import "Model_space.h"
#import "RESideMenu.h"

@interface BackgroundView : UIView

@property (nonatomic, assign) AlertViewBackgroundStyle style;

@end

@implementation BackgroundView
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    switch (self.style)
    {
        case AlertViewBackgroundStyleGradient:
        {
            size_t locationsCount = 2;
            CGFloat locations[2] = {0.0f, 1.0f};
            CGFloat colors[8] = {0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.75f};
            CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
            CGGradientRef gradient = CGGradientCreateWithColorComponents(colorSpace, colors, locations, locationsCount);
            CGColorSpaceRelease(colorSpace);
            
            CGPoint center = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
            CGFloat radius = MIN(self.bounds.size.width, self.bounds.size.height) ;
            CGContextDrawRadialGradient (context, gradient, center, 0, center, radius, kCGGradientDrawsAfterEndLocation);
            CGGradientRelease(gradient);
            break;
        }
        case AlertViewBackgroundStyleSolid:
        {
            [[UIColor colorWithWhite:0 alpha:0.5] set];
            CGContextFillRect(context, self.bounds);
            break;
        }
    }
}

@end

@interface ChangeView_all ()

@property (weak, nonatomic) UIButton *button_before;
@property (weak, nonatomic) UIButton *button_current;

@end

@implementation ChangeView_all

- (id)init{
    self = [super init];
    if(self){
        
    }
    return self;
}

- (void)configureViewWihtTag:(NSInteger )tag
{
    switch (tag)
    {
        case 0:
        {
            _transitionStyle = AlertViewTransitionStyleBounce;
            
            BackgroundView *view_back = [[BackgroundView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
            [view_back setBackgroundColor:[UIColor clearColor]];
            [view_back setStyle:AlertViewBackgroundStyleGradient];
            [self addSubview:view_back];
            _view_background = view_back;
            
            UIView *view_con = [[UIView alloc] initWithFrame:CGRectMake(160 - 139, 30, 278, 418)];
            [self addSubview:view_con];
            view_con.layer.shadowColor = [UIColor blackColor].CGColor;
            view_con.layer.shadowOffset = CGSizeMake(5, 5);
            view_con.layer.shadowOpacity = 0.5;
            view_con.layer.shadowRadius = 2.0;
            _view_content = view_con;
            
            UIImageView *imageView_back = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 278, 418)];
            imageView_back.image = [UIImage imageFileName:@"0.png"];
            [_view_content addSubview:imageView_back];
            
            for (int i = 0; i < 8; i++)
            {
                UIButton *button_select = [UIButton buttonWithType:UIButtonTypeCustom];
                button_select.frame = CGRectMake(38, 82 + i*33, 80, 22);
                [button_select setImage:[UIImage imageFileName:@"noSelect.png"] forState:UIControlStateNormal];
                [button_select setImage:[UIImage imageFileName:@"select.png"] forState:UIControlStateSelected];
                button_select.tag = i;
                button_select.selected = NO;
                [button_select addTarget:self action:@selector(didClickButton_select:)forControlEvents:UIControlEventTouchUpInside];
                [_view_content addSubview:button_select];
                
                UIButton *button_one = [UIButton buttonWithType:UIButtonTypeCustom];
                button_one.frame = CGRectMake(40 + 130, 82 + i*33, 80, 22);
                [button_one setImage:[UIImage imageFileName:@"noSelect.png"] forState:UIControlStateNormal];
                [button_one setImage:[UIImage imageFileName:@"select.png"] forState:UIControlStateSelected];
                button_one.tag = i + 8;
                button_one.selected = NO;
                [button_one addTarget:self action:@selector(didClickButton_select:)forControlEvents:UIControlEventTouchUpInside];
                [_view_content addSubview:button_one];
            }
            
            UIButton *button_right = [UIButton buttonWithType:UIButtonTypeCustom];
            button_right.frame = CGRectMake(_view_content.frame.size.width/2 - 111, 350, 222, 53);
            [button_right setImage:[UIImage imageFileName:@"3.png"] forState:UIControlStateNormal];
            button_right.tag = 20;
            [button_right addTarget:self action:@selector(didClickButton_select:)forControlEvents:UIControlEventTouchUpInside];
            [_view_content addSubview:button_right];
            
        }break;
        case 1:
        {
            _transitionStyle = AlertViewTransitionStyleBounce;
            
            BackgroundView *view_back = [[BackgroundView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
            [view_back setBackgroundColor:[UIColor clearColor]];
            [view_back setStyle:AlertViewBackgroundStyleGradient];
            [self addSubview:view_back];
            _view_background = view_back;
            
            UIView *view_con = [[UIView alloc] initWithFrame:CGRectMake(160 - 139, 30, 278, 418)];
            [self addSubview:view_con];
            view_con.layer.shadowColor = [UIColor blackColor].CGColor;
            view_con.layer.shadowOffset = CGSizeMake(5, 5);
            view_con.layer.shadowOpacity = 0.5;
            view_con.layer.shadowRadius = 2.0;
            _view_content = view_con;
            
            UIImageView *imageView_back = [[UIImageView alloc] initWithFrame:CGRectMake(0, 50, 278, 289)];
            imageView_back.image = [UIImage imageFileName:@"1.png"];
            [_view_content addSubview:imageView_back];
            
            for (int i = 0; i < 4; i++)
            {
                UIButton *button_select = [UIButton buttonWithType:UIButtonTypeCustom];
                button_select.frame = CGRectMake(38, 30+82 + i*33, 80, 22);
                [button_select setImage:[UIImage imageFileName:@"noSelect.png"] forState:UIControlStateNormal];
                [button_select setImage:[UIImage imageFileName:@"select.png"] forState:UIControlStateSelected];
                button_select.tag = i;
                button_select.selected = NO;
                [button_select addTarget:self action:@selector(didClickButton_select:)forControlEvents:UIControlEventTouchUpInside];
                [_view_content addSubview:button_select];
                
                UIButton *button_one = [UIButton buttonWithType:UIButtonTypeCustom];
                button_one.frame = CGRectMake(40 + 127, 30+82 + i*33, 80, 22);
                [button_one setImage:[UIImage imageFileName:@"noSelect.png"] forState:UIControlStateNormal];
                [button_one setImage:[UIImage imageFileName:@"select.png"] forState:UIControlStateSelected];
                button_one.tag = i + 4;
                button_one.selected = NO;
                [button_one addTarget:self action:@selector(didClickButton_select:)forControlEvents:UIControlEventTouchUpInside];
                [_view_content addSubview:button_one];
            }
            
            UIButton *button_right = [UIButton buttonWithType:UIButtonTypeCustom];
            button_right.frame = CGRectMake(_view_content.frame.size.width/2 - 111, 260, 222, 53);
            [button_right setImage:[UIImage imageFileName:@"3.png"] forState:UIControlStateNormal];
            button_right.tag = 20;
            [button_right addTarget:self action:@selector(didClickButton_select:)forControlEvents:UIControlEventTouchUpInside];
            [_view_content addSubview:button_right];
            
        }break;
        
        case 2:
        {
            _transitionStyle = AlertViewTransitionStyleBounce;
            
            BackgroundView *view_back = [[BackgroundView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
            [view_back setBackgroundColor:[UIColor clearColor]];
            [view_back setStyle:AlertViewBackgroundStyleGradient];
            [self addSubview:view_back];
            _view_background = view_back;
            
            UIView *view_con = [[UIView alloc] initWithFrame:CGRectMake(160 - 139, 30, 278, 418)];
            [self addSubview:view_con];
            view_con.layer.shadowColor = [UIColor blackColor].CGColor;
            view_con.layer.shadowOffset = CGSizeMake(5, 5);
            view_con.layer.shadowOpacity = 0.5;
            view_con.layer.shadowRadius = 2.0;
            _view_content = view_con;
            
            UIImageView *imageView_back = [[UIImageView alloc] initWithFrame:CGRectMake(0, 50, 278, 289)];
            imageView_back.image = [UIImage imageFileName:@"2.png"];
            [_view_content addSubview:imageView_back];
            
            for (int i = 0; i < 4; i++)
            {
                UIButton *button_select = [UIButton buttonWithType:UIButtonTypeCustom];
                button_select.frame = CGRectMake(38, 30+82 + i*33, 80, 22);
                [button_select setImage:[UIImage imageFileName:@"noSelect.png"] forState:UIControlStateNormal];
                [button_select setImage:[UIImage imageFileName:@"select.png"] forState:UIControlStateSelected];
                button_select.tag = i + 8;
                button_select.selected = NO;
                [button_select addTarget:self action:@selector(didClickButton_select:)forControlEvents:UIControlEventTouchUpInside];
                [_view_content addSubview:button_select];
                
                UIButton *button_one = [UIButton buttonWithType:UIButtonTypeCustom];
                button_one.frame = CGRectMake(40 + 127, 30+82 + i*33, 80, 22);
                [button_one setImage:[UIImage imageFileName:@"noSelect.png"] forState:UIControlStateNormal];
                [button_one setImage:[UIImage imageFileName:@"select.png"] forState:UIControlStateSelected];
                button_one.tag = i + 12;
                button_one.selected = NO;
                [button_one addTarget:self action:@selector(didClickButton_select:)forControlEvents:UIControlEventTouchUpInside];
                [_view_content addSubview:button_one];
            }
            
            UIButton *button_right = [UIButton buttonWithType:UIButtonTypeCustom];
            button_right.frame = CGRectMake(_view_content.frame.size.width/2 - 111, 260, 222, 53);
            [button_right setImage:[UIImage imageFileName:@"3.png"] forState:UIControlStateNormal];
            button_right.tag = 20;
            [button_right addTarget:self action:@selector(didClickButton_select:)forControlEvents:UIControlEventTouchUpInside];
            [_view_content addSubview:button_right];
        }break;
        default:
            break;
    }
}

- (void)didClickButton_select:(UIButton *)button
{
    _button_before = _button_current;
    switch (button.tag)
    {
        case 0:{
        
            [Model_space sharedModel].string_space = @"个人 - 交通肇事";
        }break;
        case 1:{
            [Model_space sharedModel].string_space = @"个人 - 婚姻家庭";
        }break;
        case 2:{
            [Model_space sharedModel].string_space = @"个人 - 劳动争议";
        }break;
        case 3:{
            [Model_space sharedModel].string_space = @"个人 - 人身伤害";
        }break;
        case 4:{
            [Model_space sharedModel].string_space = @"个人 - 房屋买卖";
        }break;
        case 5:{
            [Model_space sharedModel].string_space = @"个人 - 保险理赔";
        }break;
        case 6:{
            [Model_space sharedModel].string_space = @"个人 - 债务追讨";
        }break;
        case 7:{
            [Model_space sharedModel].string_space = @"个人 - 其他";
        }break;
        case 8:{
            [Model_space sharedModel].string_space = @"企业 - 注册公司";
        }break;
        case 9:{
            [Model_space sharedModel].string_space = @"企业 - 股权期权";
        }break;
        case 10:{
            [Model_space sharedModel].string_space = @"企业 - 商标专利";
        }break;
        case 11:{
            [Model_space sharedModel].string_space = @"企业 - 财务会计";
        }break;
        case 12:{
            [Model_space sharedModel].string_space = @"企业 - 债务追讨";
        }break;
        case 13:{
            [Model_space sharedModel].string_space = @"企业 - 合同纠纷";
        }break;
        case 14:{
            [Model_space sharedModel].string_space = @"企业 - 侵权维权";
        }break;
        case 15:{
            [Model_space sharedModel].string_space = @"企业 - 其他";
        }break;
        case 20:{
            [self dismissAnimated];
            [RESideMenu sharedInstance].panGestureEnabled = YES;
            
            [[NSNotificationCenter defaultCenter] postNotificationName:@"didClickFinish" object:nil];
            
            
        }break;
        default:
            break;
    }
     _button_current = button;
    _button_current.selected = YES;
    _button_before.selected = NO;
}

#pragma mark - 弹出视图 -
/**
 弹出视图
 **/
- (void)showAnimated
{
    void (^dismissComplete)(void) = ^{
        
    };
    [self transitionInCompletion:dismissComplete];
    [self showBackgroundAnimated];
}


#pragma mark - 收回视图 -
/**
 收回视图
 **/
- (void)dismissAnimated
{
    void (^dismissComplete)(void) = ^{
        //_view_content = nil;
        //_view_recive = nil;
        
    };
    [self transitionOutCompletion:dismissComplete];
    [self hideBackgroundAnimated];
}


#pragma mark - 弹出动画 -
- (void)showBackgroundAnimated
{
    _view_background.alpha = 0;
    [UIView animateWithDuration:0.3
                     animations:^{
                         _view_background.alpha = 1;
                     }];
    
}

#pragma mark - 隐藏动画 -
/**
 隐藏动画
 **/
- (void)hideBackgroundAnimated
{
    [UIView animateWithDuration:0.3
                     animations:^{
                         _view_background.alpha = 0;
                     }
                     completion:^(BOOL finished) {
                         [_view_background removeFromSuperview];
                         [self removeFromSuperview];
                     }];
}

#pragma  mark - in动画 -
/**
 in动画
 **/
- (void)transitionInCompletion:(void(^)(void))completion
{
    switch (self.transitionStyle) {
        case AlertViewTransitionStyleSlideFromBottom:
        {
            CGRect rect = _view_content.frame;
            CGRect originalRect = rect;
            rect.origin.y = self.bounds.size.height;
            _view_content.frame = rect;
            [UIView animateWithDuration:0.3
                             animations:^{
                                 _view_content.frame = originalRect;
                             }
                             completion:^(BOOL finished) {
                                 if (completion) {
                                     completion();
                                 }
                             }];
        }
            break;
        case AlertViewTransitionStyleSlideFromTop:
        {
            CGRect rect = _view_content.frame;
            CGRect originalRect = rect;
            rect.origin.y = -rect.size.height;
            _view_content.frame = rect;
            [UIView animateWithDuration:0.3
                             animations:^{
                                 _view_content.frame = originalRect;
                             }
                             completion:^(BOOL finished) {
                                 if (completion) {
                                     completion();
                                 }
                             }];
        }
            break;
        case AlertViewTransitionStyleFade:
        {
            _view_content.alpha = 0;
            [UIView animateWithDuration:0.3
                             animations:^{
                                 _view_content.alpha = 1;
                             }
                             completion:^(BOOL finished) {
                                 if (completion) {
                                     completion();
                                 }
                             }];
        }
            break;
        case AlertViewTransitionStyleBounce:
        {
            CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
            animation.values = @[@(0.01), @(1.2), @(0.9), @(1)];
            animation.keyTimes = @[@(0), @(0.4), @(0.6), @(1)];
            animation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear], [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear], [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
            animation.duration = 0.5;
            [animation setValue:completion forKey:@"handler"];
            [_view_content.layer addAnimation:animation forKey:@"bouce"];
        }
            break;
        case AlertViewTransitionStyleDropDown:
        {
            CGFloat y = _view_content.center.y;
            CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position.y"];
            animation.values = @[@(y - self.bounds.size.height), @(y + 20), @(y - 10), @(y)];
            animation.keyTimes = @[@(0), @(0.5), @(0.75), @(1)];
            animation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut], [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear], [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
            animation.duration = 0.4;
            [animation setValue:completion forKey:@"handler"];
            [_view_content.layer addAnimation:animation forKey:@"dropdown"];
        }
            break;
        default:
            break;
    }
}


#pragma  mark - out动画 -
/**
 out动画
 **/
- (void)transitionOutCompletion:(void(^)(void))completion
{
    switch (self.transitionStyle) {
        case AlertViewTransitionStyleSlideFromBottom:
        {
            CGRect rect = _view_content.frame;
            rect.origin.y = self.bounds.size.height;
            [UIView animateWithDuration:0.3
                                  delay:0
                                options:UIViewAnimationOptionCurveEaseIn
                             animations:^{
                                 _view_content.frame = rect;
                             }
                             completion:^(BOOL finished) {
                                 if (completion) {
                                     completion();
                                 }
                             }];
        }break;
        case AlertViewTransitionStyleSlideFromTop:
        {
            CGRect rect = _view_content.frame;
            rect.origin.y = -rect.size.height;
            [UIView animateWithDuration:0.3
                                  delay:0
                                options:UIViewAnimationOptionCurveEaseIn
                             animations:^{
                                 _view_content.frame = rect;
                             }
                             completion:^(BOOL finished) {
                                 if (completion) {
                                     completion();
                                 }
                             }];
        }
            break;
        case AlertViewTransitionStyleFade:
        {
            [UIView animateWithDuration:0.25
                             animations:^{
                                 _view_content.alpha = 0;
                             }
                             completion:^(BOOL finished) {
                                 if (completion) {
                                     completion();
                                 }
                             }];
        }
            break;
        case AlertViewTransitionStyleBounce:
        {
            CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
            animation.values = @[@(1), @(1.2), @(0.01)];
            animation.keyTimes = @[@(0), @(0.4), @(1)];
            animation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut], [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
            animation.duration = 0.35;
            [animation setValue:completion forKey:@"handler"];
            [_view_content.layer addAnimation:animation forKey:@"bounce"];
            
            _view_content.transform = CGAffineTransformMakeScale(0.01, 0.01);
        }
            break;
        case AlertViewTransitionStyleDropDown:
        {
            CGPoint point = _view_content.center;
            point.y += self.bounds.size.height;
            [UIView animateWithDuration:0.3
                                  delay:0
                                options:UIViewAnimationOptionCurveEaseIn
                             animations:^{
                                 _view_content.center = point;
                                 CGFloat angle = ((CGFloat)arc4random_uniform(100) - 50.f) / 100.f;
                                 _view_content.transform = CGAffineTransformMakeRotation(angle);
                             }
                             completion:^(BOOL finished) {
                                 if (completion) {
                                     completion();
                                 }
                             }];
        }break;
        default:
            break;
    }
}

@end
