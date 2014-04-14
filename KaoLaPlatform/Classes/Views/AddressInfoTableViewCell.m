//
//  AddressInfoTableViewCell.m
//  KaoLaPlatform
//
//  Created by Doyang on 14-4-11.
//  Copyright (c) 2014年 Onyx International Inc. All rights reserved.
//

#import "AddressInfoTableViewCell.h"
#import "Macros.h"
#import "UserModel.h"

@implementation AddressInfoTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [self initializer];
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
    
    [self initializer];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)initializer
{
    UIImage *backgroundImage = [_img(@"assets/bg_address_info") resizableImageWithCapInsets:UIEdgeInsetsMake(45.0f, 10.0f, 10.0f, 70.0f)];
    [self.centerBackgroundImageView setImage:backgroundImage];
    
    [self.nameTitleLabel setText:_text(@"kStrConsigneeName")];
    [self.addressTitleLabel setText:_text(@"kStrDeliveryAddress")];
}

#pragma mark - Public
- (void)setData:(AddressInfo *)info
{
    [self.titleLabel setText:[NSString stringWithFormat:@"%@%d", _text(@"kStrAddressInfo"), info.index]];
    [self.nameLabel setText:info.name];
    [self.addressLabel setText:info.address];
    
    CGSize contentTrueSize = [info.address sizeWithFont:self.addressLabel.font constrainedToSize:CGSizeMake(205.0f, 100.0f) lineBreakMode:NSLineBreakByWordWrapping];
    [self.addressLabel setFrame:CGRectMake(self.addressLabel.frame.origin.x, self.addressLabel.frame, contentTrueSize.width, contentTrueSize.height)];
}

@end
