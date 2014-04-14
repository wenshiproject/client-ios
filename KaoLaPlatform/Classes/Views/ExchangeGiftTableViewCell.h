//
//  ExchangeGiftTableViewCell.h
//  KaoLaPlatform
//
//  Created by Doyang on 14-4-10.
//  Copyright (c) 2014年 Onyx International Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ExchangeGiftTableViewCell;

@protocol ExchangeGiftTableViewCellDelegate <NSObject>

@optional
- (void)exchangeGiftTableViewCellDidConverViewShow:(ExchangeGiftTableViewCell *)cell;
- (void)exchangeGiftTableViewCellDidCoverViewDismiss:(ExchangeGiftTableViewCell *)cell;
@end

@interface ExchangeGiftTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIView *coverView;
@property (strong, nonatomic) IBOutlet UIButton *exchangeButton;
@property (strong, nonatomic) IBOutlet UIImageView *mainImageView;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *subTitleLabel;
@property (strong, nonatomic) id<ExchangeGiftTableViewCellDelegate> delegate;
- (IBAction)onExchangeButtonClicked:(id)sender;
@property (assign) BOOL isCoverViewHidden;

- (void)setCoverViewVisible:(BOOL)visible;
@end
