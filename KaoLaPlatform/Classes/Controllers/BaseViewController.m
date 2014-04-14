//
//  BaseViewController.m
//  KaoLaPlatform
//
//  Created by Doyang on 14-4-8.
//  Copyright (c) 2014年 Onyx International Inc. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

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
    UIBarButtonItem *backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:_text(@"kStrBack") style:UIBarButtonItemStyleBordered target:self action:@selector(onBackBarButtonClicked)];
    self.navigationItem.backBarButtonItem = backBarButtonItem;
    
    [self.view setBackgroundColor:[UIColor colorWithRed:_color(247.0f) green:_color(247.0f) blue:_color(245.0f) alpha:1.0f]];
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

- (void)onBackBarButtonClicked
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)setLogoViewVisible:(BOOL)isVisible
{
    if (isVisible)
    {
        UIImage *image = _img(@"assets/logo");
        self.logoImageView = [[UIImageView alloc] initWithImage:image];
        CGFloat x = (320.0f - image.size.width) / 2.0f;
        CGFloat y = (44.0f - image.size.height) / 2.0f;
        [self.logoImageView setFrame:CGRectMake(x, y, image.size.width, image.size.height)];
        [self.navigationController.navigationBar addSubview:self.logoImageView];
    }
    else
    {
        [self.logoImageView removeFromSuperview];
    }
}

@end
