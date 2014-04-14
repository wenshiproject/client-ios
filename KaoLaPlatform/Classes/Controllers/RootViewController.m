//
//  RootViewController.m
//  KaoLaPlatform
//
//  Created by Doyang on 14-4-4.
//  Copyright (c) 2014年 Onyx International Inc. All rights reserved.
//

#import "RootViewController.h"
#import "WidgetUtil.h"
#import "ScaleUtil.h"
#import "NotificationConst.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _leftBarAnimationLock = NO;
    _leftBarShowing = NO;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onLeftBarShowOrDismiss:) name:kViewLeftBarShowOrDismiss object:nil];
    
    LeftBarView *leftBarView = [[LeftBarView alloc] init];
    [leftBarView setDelegate:self];
    [self.view addSubview:leftBarView];
    [self.view sendSubviewToBack:leftBarView];
    
    self.mainPageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"mainPageViewController"];
    self.userCenterViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"userCenterViewController"];
    self.favorViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"favorViewController"];
    self.settingViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"settingViewController"];
    
    [self setViewControllers:[NSArray arrayWithObjects:self.mainPageViewController, nil]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)onLeftBarShowOrDismiss:(NSNotification *)notification
{
    if (_leftBarAnimationLock)
        return;
    
    _leftBarAnimationLock = YES;
    
    CGFloat disX = _leftBarShowing ? -90.0f : 90.0f;
    
    void (^animations) (void) = ^{
        for (UIView *view in self.view.subviews)
        {
            if ([view isKindOfClass:NSClassFromString(@"UINavigationTransitionView")])
            {
                CGRect rect = view.frame;
                rect.origin.x += disX;
                [view setFrame:rect];
            }
        }
        
        CGRect rect = self.navigationBar.frame;
        rect.origin.x += disX;
        [self.navigationBar setFrame:rect];
    };
    
    void (^completion) (BOOL) = ^(BOOL finished) {
        _leftBarAnimationLock = NO;
        _leftBarShowing = !_leftBarShowing;
    };
    [UIView animateWithDuration:0.2f animations:animations completion:completion];
}

- (void)onButtonClicked:(id)sender
{
    
}


#pragma mark - LeftBarViewDelegate
- (void)onBarItemSelected:(NSUInteger)index
{
    [self onLeftBarShowOrDismiss:nil];
    
    if (kTagLeftBarButtonUserCenter == index)
    {
        [self setViewControllers:[NSArray arrayWithObjects:self.userCenterViewController, nil]];
    }
    else if (kTagLeftBarButtonMainPage == index)
    {
        [self setViewControllers:[NSArray arrayWithObjects:self.mainPageViewController, nil]];
    }
    else if (kTagLeftBarButtonFavor == index)
    {
        [self setViewControllers:[NSArray arrayWithObjects:self.favorViewController, nil]];
    }
    else if (kTagLeftBarButtonSetting == index)
    {
        [self setViewControllers:[NSArray arrayWithObjects:self.settingViewController, nil]];
    }
}
@end
