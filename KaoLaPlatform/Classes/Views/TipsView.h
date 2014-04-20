//
//  NotifyMessageView.h
//  ImBebe
//
//  Created by Doyang on 13-6-29.
//  Copyright (c) 2013年 Bebe Network Technology Co.Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TipsView : UIView

@end

void showTips(NSString *text);
void showSingleMessageBox(NSString *text);
void showActivityIndicator(UIView *parentView, NSString *dismissNotification);
void dismissActivityindicator(UIView *parentView);