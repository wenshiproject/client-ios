//
//  WidgetUtil.h
//  KaoLaPlatform
//
//  Created by Doyang on 14-4-4.
//  Copyright (c) 2014年 Onyx International Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Macros.h"

@interface WidgetUtil : NSObject


+ (UIBarButtonItem *)createWithTarget:(id)target action:(SEL)action title:(NSString *)title imageNormal:(NSString *)normalImageName imagePressed:(NSString *)pressedImageName;
@end
