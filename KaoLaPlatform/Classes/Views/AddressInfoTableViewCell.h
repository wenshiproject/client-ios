//
//  AddressInfoTableViewCell.h
//  KaoLaPlatform
//
//  Created by Doyang on 14-4-11.
//  Copyright (c) 2014年 Onyx International Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AddressInfo;

@interface AddressInfoTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *centerBackgroundImageView;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *nameTitleLabel;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *addressTitleLabel;
@property (strong, nonatomic) IBOutlet UILabel *addressLabel;
@property (strong, nonatomic) IBOutlet UIView *bottomBar;


- (void)setData:(AddressInfo *)info;
@end
