//
//  LeftBarView.h
//  KaoLaPlatform
//
//  Created by Doyang on 14-4-8.
//  Copyright (c) 2014年 Onyx International Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TagConst.h"
#import "Macros.h"


@protocol LeftBarViewDelegate <NSObject>

@optional
- (void)onBarItemSelected:(NSUInteger)index;

@end

@interface LeftBarView : UIView

@property (strong, nonatomic) NSMutableArray *buttons;
@property (strong, nonatomic) id<LeftBarViewDelegate> delegate;

@end
