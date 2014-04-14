//
//  LeftBarView.m
//  KaoLaPlatform
//
//  Created by Doyang on 14-4-8.
//  Copyright (c) 2014年 Onyx International Inc. All rights reserved.
//

#import "LeftBarView.h"

@implementation LeftBarView

- (id)init
{
    self = [super init];
    if (self)
    {
        UIImage *backgroundImage = _img2(@"assets/bg_leftbar", @"assets/bg_leftbar_568");
        UIImageView *backgroundImageView = [[UIImageView alloc] initWithImage:backgroundImage];
        [backgroundImageView setFrame:CGRectMake(0, 20.0f, backgroundImage.size.width, backgroundImage.size.height)];
        [self addSubview:backgroundImageView];
        
        [self setBackgroundColor:[UIColor colorWithRed:_color(232.0f) green:_color(231.0f) blue:_color(227.0f) alpha:1.0f]];
        self.buttons = [[NSMutableArray alloc] init];
        CGRect applicationFrame = [UIScreen mainScreen].applicationFrame;
        [self setFrame:CGRectMake(0, 0, applicationFrame.size.width, SCREEN_HEIGHT)];
        [self addButton:kTagLeftBarButtonMainPage normalImage:@"assets/ic_mainpage_normal" highLightAndSelectedImage:@"assets/ic_mainpage_highlight"];
        [self addButton:kTagLeftBarButtonUserCenter normalImage:@"assets/ic_usercenter_normal" highLightAndSelectedImage:@"assets/ic_usercenter_highlight"];
        [self addButton:kTagLeftBarButtonFavor normalImage:@"assets/ic_favor_normal" highLightAndSelectedImage:@"assets/ic_favor_highlight"];
        [self addButton:kTagLeftBarButtonSetting normalImage:@"assets/ic_setting_normal" highLightAndSelectedImage:@"assets/ic_setting_highlight"];
        
        for (UIButton *button in self.buttons)
        {
            if ([button tag] != kTagLeftBarButtonMainPage)
            {
                [button setSelected:NO];
                [button setUserInteractionEnabled:YES];
            }
            else
            {
                [button setSelected:YES];
                [button setUserInteractionEnabled:NO];
            }
        }
    }
    return self;
}

#pragma mark - Private
- (void)addButton:(NSInteger)tag normalImage:(NSString *)normalImageStr highLightAndSelectedImage:(NSString *)highLightImageStr
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *normalImage = _img(normalImageStr);
    UIImage *highLightImage = _img(highLightImageStr);
    [button setBackgroundImage:normalImage forState:UIControlStateNormal];
    [button setBackgroundImage:highLightImage forState:UIControlStateHighlighted];
    [button setBackgroundImage:highLightImage forState:UIControlStateSelected];
    [button setTag:tag];
    [button addTarget:self action:@selector(onButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [button setFrame:CGRectMake(25.0f, 20.0f + [self.buttons count] * 90.0f + 25.0f, normalImage.size.width, normalImage.size.height)];
    [self addSubview:button];
    [self.buttons addObject:button];
}

- (void)onButtonClicked:(id)sender
{
    UIButton *clickedButton = (UIButton *)sender;
    NSUInteger tag = [clickedButton tag];
    for (UIButton *button in self.buttons)
    {
        if ([button tag] != tag)
        {
            [button setSelected:NO];
            [button setUserInteractionEnabled:YES];
        }
        else
        {
            [button setSelected:YES];
            [button setUserInteractionEnabled:NO];
        }
    }
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(onBarItemSelected:)])
    {
        [self.delegate onBarItemSelected:tag];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
