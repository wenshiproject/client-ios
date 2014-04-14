//
//  AppDelegate.m
//  KaoLaPlatform
//
//  Created by Doyang on 14-4-4.
//  Copyright (c) 2014年 Onyx International Inc. All rights reserved.
//

#import "AppDelegate.h"
#import "Base/Constants.h"
#import "Macros.h"
#import "UserModel.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    NSDictionary *textAtrributeDic = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor], UITextAttributeTextColor, [UIColor clearColor], UITextAttributeTextShadowColor, nil];
    [[UINavigationBar appearance] setTitleTextAttributes:textAtrributeDic];
    
    if (IS_IOS_7)
    {
        [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:_color(232.0f) green:_color(231.0f) blue:_color(227.0f) alpha:1.0f]];
        [[UINavigationBar appearance] setTintColor:[UIColor colorWithRed:_color(111.0f) green:_color(145.0f) blue:_color(71.0f) alpha:1.0f]];
        [[UINavigationBar appearance] setBackgroundImage:_img(@"assets/bg_navigationbar") forBarMetrics:UIBarMetricsDefault];
    }
    else
    {
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleBlackOpaque;
        [[UINavigationBar appearance] setTintColor:[UIColor colorWithRed:_color(232.0f) green:_color(231.0f) blue:_color(227.0f) alpha:1.0f]];
        [[UINavigationBar appearance] setBackgroundImage:_img(@"assets/bg_navigationbar") forBarMetrics:UIBarMetricsDefault];
    }
    
    [UserModel sharedModel];
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
