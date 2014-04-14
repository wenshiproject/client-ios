//
//  MainPageViewController.m
//  KaoLaPlatform
//
//  Created by Doyang on 14-4-8.
//  Copyright (c) 2014年 Onyx International Inc. All rights reserved.
//

#import "MainPageViewController.h"
#import "WidgetUtil.h"
#import "NotificationConst.h"

@interface MainPageViewController ()

@end

@implementation MainPageViewController

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
    NSString *url = @"http://apimobile.4399.co.kr/passport/inquiry/?client_id=102&channel_id=channel_0&not_show_back=1";
    NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc] initWithURL: [NSURL URLWithString:url]];
//    [urlRequest setValue: @"Mozilla/5.0 (iPad; CPU OS 5_1 like Mac OS X) AppleWebKit/534.46 (KHTML, like Gecko) Version/5.1 Mobile/9B176 Safari/7534.48.3" forHTTPHeaderField: @"User-Agent"];
//    NSString *url = @"http://www.baidu.com";
    [self.webView loadRequest:urlRequest];
//    [self.webView setKeyboardDisplayRequiresUserAction:NO];
//    self.webView set
//    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self setLogoViewVisible:YES];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self setLogoViewVisible:NO];
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

@end
