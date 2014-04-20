//
//  NotifyMessageView.m
//  ImBebe
//
//  Created by Doyang on 13-6-29.
//  Copyright (c) 2013年 Bebe Network Technology Co.Ltd. All rights reserved.
//

#import "TipsView.h"

@implementation TipsView

NSInteger const TAG_ACTIVITY_INDICATOR = 1001;

+ (TipsView *)createTipsView:(NSString *)text
{
    TipsView *tipsView = [[TipsView alloc] initWithMessage:text];
    return tipsView;
}

+ (TipsView *)createActivityIndicatorTipsView:(NSString *)dismissNotificationStr parent:(UIView *)parentView
{
    TipsView *tipsView = [[TipsView alloc] initWithActivityIndicator:dismissNotificationStr parent:parentView];
    return tipsView;
}

- (id)initWithActivityIndicator:(NSString *)dismissNotificationStr parent:(UIView *)parentView
{
    self = [super initWithFrame:CGRectMake(0, 0, 0, 0)];
    if (self)
    {
        CGRect applicationFrame = [UIScreen mainScreen].applicationFrame;
        [self setFrame:CGRectMake(0, 0, applicationFrame.size.width, applicationFrame.size.height)];
        [self setUserInteractionEnabled:YES];
        
        UIImageView *activityIndicatorBackgroundView = [[UIImageView alloc] initWithFrame:CGRectMake(applicationFrame.size.width / 2 - 25.0f, applicationFrame.size.height / 2 - 25.0f - 44.0f, 50.0f, 50.0f)];
        [activityIndicatorBackgroundView setImage:[[UIImage imageNamed:@"assets/bg_tips"] resizableImageWithCapInsets:UIEdgeInsetsMake(4.0f, 4.0f, 4.0f, 4.0f)]];
        [self addSubview:activityIndicatorBackgroundView];
        
        UIActivityIndicatorView *activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
        [activityIndicatorView setFrame:CGRectMake(applicationFrame.size.width / 2 - 10.0f, applicationFrame.size.height / 2 - 10.0f - 44.0f, 20.0f, 20.0f)];
        [self addSubview:activityIndicatorView];
        
        [activityIndicatorView startAnimating];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onDismiss) name:dismissNotificationStr object:nil];
    }
    return self;
}

- (id)initWithMessage:(NSString *)text
{
    self = [super initWithFrame:CGRectMake(0, 0, 0, 0)];
    if (self) {
        // Initialization code
        CGRect labelRect = CGRectMake(15.0f, 8.0f, 320.0f, 13.0f);
        UILabel *messageLabel = [[UILabel alloc] initWithFrame:labelRect];
        [messageLabel setTextColor:[UIColor whiteColor]];
        [messageLabel setBackgroundColor:[UIColor clearColor]];
        [messageLabel setTextAlignment:NSTextAlignmentCenter];
        [messageLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:13.0f]];
        CGSize trueSize = [text sizeWithFont:messageLabel.font constrainedToSize:CGSizeMake(labelRect.size.width, labelRect.size.height) lineBreakMode:NSLineBreakByWordWrapping];
        labelRect.size.width = trueSize.width;
        [messageLabel setText:text];
        [messageLabel setFrame:labelRect];
        
        CGRect imageRect = CGRectMake(0.0f, 0.0f, 320.0f, 29.0f);
        imageRect.size.width = trueSize.width + 30.0f;
        UIImageView *backgroundView = [[UIImageView alloc] initWithFrame:imageRect];
        [backgroundView setImage:[[UIImage imageNamed:@"assets/bg_tips"] resizableImageWithCapInsets:UIEdgeInsetsMake(4.0f, 4.0f, 4.0f, 4.0f)]];
        [self addSubview:backgroundView];
        [self addSubview:messageLabel];
        [self setFrame:imageRect];
    }
    return self;
}

- (void)showAutoDismiss:(CGFloat)timeInterval
{
    [self show];
    [NSTimer scheduledTimerWithTimeInterval:timeInterval target:self selector:@selector(onDismiss) userInfo:nil repeats:NO];
}

- (void)show
{
    CGRect parentViewFrame = [UIScreen mainScreen].applicationFrame;
    CGRect currentFrame = self.frame;
    currentFrame.origin.y = parentViewFrame.size.height / 2 - 25.0f;
    currentFrame.origin.x = (parentViewFrame.size.width - currentFrame.size.width) / 2;
    [self setFrame:currentFrame];
    [[[UIApplication sharedApplication] keyWindow] addSubview:self];
    [[[UIApplication sharedApplication] keyWindow] bringSubviewToFront:self];
}

- (void)showInView:(UIView *)parentView
{
    CGRect parentViewFrame = parentView.frame;
    CGRect currentFrame = self.frame;
    currentFrame.origin.y = parentViewFrame.size.height / 2 - 15.0f - 44.0f;
    currentFrame.origin.x = (parentViewFrame.size.width - currentFrame.size.width) / 2;
    [self setFrame:currentFrame];
    [parentView addSubview:self];
    [NSTimer scheduledTimerWithTimeInterval:2.0f target:self selector:@selector(onDismiss) userInfo:nil repeats:NO];
}

- (void)onDismiss
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    [self removeFromSuperview];
}
@end

void showTips(NSString *text)
{
    [[TipsView createTipsView:text] showAutoDismiss:2.0f];
    NSLog(@"----------showtips=%@", text);
}

void showSingleMessageBox(NSString *text)
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:text delegate:nil cancelButtonTitle:NSLocalizedString(@"kOk", @"") otherButtonTitles:nil, nil];
    [alert show];
}

void showActivityIndicator(UIView *parentView, NSString *dismissNotification)
{
    TipsView *tipsView = [TipsView createActivityIndicatorTipsView:dismissNotification parent:parentView];
    [tipsView setTag:TAG_ACTIVITY_INDICATOR];
    [parentView addSubview:tipsView];
}

void dismissActivityindicator(UIView *parentView)
{
    NSArray *array = [parentView subviews];
    for (UIView *subView in array)
    {
        if (TAG_ACTIVITY_INDICATOR == [subView tag])
        {
            [subView removeFromSuperview];
            break;
        }
    }
}
