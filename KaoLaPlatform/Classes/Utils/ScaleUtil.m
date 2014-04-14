//
//  ScaleUtil.m
//  KaoLaPlatform
//
//  Created by Doyang on 14-4-5.
//  Copyright (c) 2014年 Onyx International Inc. All rights reserved.
//

#import "ScaleUtil.h"

@implementation ScaleUtil

+ (CGFloat)offsetStatusBar
{
    if ([[[UIDevice currentDevice] systemVersion] floatValue] > 7.0f)
    {
        return 20.0f;
    }
    else
    {
        return 0.0f;
    }
}
@end
