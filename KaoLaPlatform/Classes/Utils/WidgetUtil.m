//
//  WidgetUtil.m
//  KaoLaPlatform
//
//  Created by Doyang on 14-4-4.
//  Copyright (c) 2014年 Onyx International Inc. All rights reserved.
//

#import "WidgetUtil.h"

@implementation WidgetUtil


+ (UIBarButtonItem *)createWithTarget:(id)target action:(SEL)action title:(NSString *)title imageNormal:(NSString *)normalImageName imagePressed:(NSString *)pressedImageName
{
    UIEdgeInsets imageInsets = UIEdgeInsetsMake(20.0f, 15.0f, 10.0f, 10.0f);
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *normalImage = [_img(normalImageName) resizableImageWithCapInsets:imageInsets];
    UIImage *pressedImage = [_img(pressedImageName) resizableImageWithCapInsets:imageInsets];
    CGRect buttonRect = CGRectMake(0, 0, normalImage.size.width, normalImage.size.height);
    [button setFrame:buttonRect];
    [button setBackgroundImage:normalImage forState:UIControlStateNormal];
    [button setBackgroundImage:pressedImage forState:UIControlStateHighlighted];
    [button setTitle:title forState:UIControlStateNormal];
    [button.titleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:13.0f]];
    button.titleLabel.textAlignment = NSTextAlignmentCenter;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

@end
