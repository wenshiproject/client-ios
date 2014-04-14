//
//  RootViewController.h
//  KaoLaPlatform
//
//  Created by Doyang on 14-4-4.
//  Copyright (c) 2014年 Onyx International Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LeftBarView.h"
#import "UserCenterViewController.h"
#import "MainPageViewController.h"
#import "FavorViewController.h"
#import "SettingViewController.h"

@interface RootViewController : UINavigationController<LeftBarViewDelegate>
{
    BOOL _leftBarAnimationLock;
    BOOL _leftBarShowing;
}

@property (strong, nonatomic) UserCenterViewController *userCenterViewController;
@property (strong, nonatomic) MainPageViewController *mainPageViewController;
@property (strong, nonatomic) FavorViewController *favorViewController;
@property (strong, nonatomic) SettingViewController *settingViewController;
@end
