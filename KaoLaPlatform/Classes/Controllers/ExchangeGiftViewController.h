//
//  ExchangeGiftViewController.h
//  KaoLaPlatform
//
//  Created by Doyang on 14-4-10.
//  Copyright (c) 2014年 Onyx International Inc. All rights reserved.
//

#import "BaseViewController.h"
#import "ExchangeGiftTableViewCell.h"

@class ExchangeGiftTableViewOverlay;

@protocol ExchangeGiftTableViewOverlayDelegate <NSObject>

- (UIView *)overlayView:(ExchangeGiftTableViewOverlay *)view didHitTest:(CGPoint)point withEvent:(UIEvent *)event;

@end

@interface ExchangeGiftTableViewOverlay : UIView

@property (strong, nonatomic) id<ExchangeGiftTableViewOverlayDelegate> delegate;

@end

@interface ExchangeGiftViewController : BaseViewController<UITableViewDataSource, UITableViewDelegate, ExchangeGiftTableViewCellDelegate, ExchangeGiftTableViewOverlayDelegate>
{
    UINib *_nib;
}

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) ExchangeGiftTableViewOverlay *overlayView;
@property (strong, nonatomic) ExchangeGiftTableViewCell *coverViewShowingCell;
@end
