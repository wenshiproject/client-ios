//
//  BaseViewController.h
//  KaoLaPlatform
//
//  Created by Doyang on 14-4-8.
//  Copyright (c) 2014年 Onyx International Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Macros.h"

@interface BaseViewController : UIViewController


@property (strong, nonatomic) UIImageView *logoImageView;

- (void)setLogoViewVisible:(BOOL)isVisible;
@end
