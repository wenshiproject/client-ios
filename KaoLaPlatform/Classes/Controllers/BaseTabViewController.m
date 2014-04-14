//
//  BaseTabViewController.m
//  KaoLaPlatform
//
//  Created by Doyang on 14-4-8.
//  Copyright (c) 2014年 Onyx International Inc. All rights reserved.
//

#import "BaseTabViewController.h"
#import "NotificationConst.h"
#import "WidgetUtil.h"

@interface BaseTabViewController ()

@end

@implementation BaseTabViewController

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
    
    UIBarButtonItem *leftItem = [WidgetUtil createWithTarget:self action:@selector(onLeftBarButtonClicked:) title:nil imageNormal:@"assets/ic_leftbar_normal" imagePressed:@"assets/ic_leftbar_highlight"];
    self.navigationItem.leftBarButtonItem = leftItem;

    self.navigationController.navigationBar.translucent = IS_IOS_7 ? YES : NO;
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

- (void)onLeftBarButtonClicked:(id)sender
{
    [[NSNotificationCenter defaultCenter] postNotificationName:kViewLeftBarShowOrDismiss object:nil];
}

@end
