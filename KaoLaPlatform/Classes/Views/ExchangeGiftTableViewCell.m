//
//  ExchangeGiftTableViewCell.m
//  KaoLaPlatform
//
//  Created by Doyang on 14-4-10.
//  Copyright (c) 2014年 Onyx International Inc. All rights reserved.
//

#import "ExchangeGiftTableViewCell.h"

@implementation ExchangeGiftTableViewCell

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
    if (self.isCoverViewHidden)
    {
        [super setSelected:selected animated:animated];
    }
    // Configure the view for the selected state
}


- (void)initializer
{
    self.isCoverViewHidden = NO;
    
    UISwipeGestureRecognizer *swipeGestureRecognier = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handlerSwipeGesture:)];
    [self addGestureRecognizer:swipeGestureRecognier];
    
}

- (void)handlerSwipeGesture:(UISwipeGestureRecognizer *)recognizer
{
    switch (recognizer.direction) {
        case UISwipeGestureRecognizerDirectionRight:
        {
            [self setCoverViewVisible:YES];
        }
            break;
            
        default:
            break;
    }
}

- (void)setCoverViewVisible:(BOOL)visible
{
    CGRect toRect;
    if (visible)
    {
        toRect = CGRectMake(0, 0, 320.0f, self.frame.size.height);
    }
    else
    {
        toRect = CGRectMake(-320.0f, 0, 320.0f, self.frame.size.height);
    }
    
    void (^animations) (void) = ^ {
        [self.coverView setFrame:toRect];
    };
    
    void (^completion) (BOOL) = ^(BOOL completion) {
        
        self.isCoverViewHidden = !visible;
        
        if(self.delegate)
        {
            if (visible && [self.delegate respondsToSelector:@selector(exchangeGiftTableViewCellDidConverViewShow:)])
            {
                [self.delegate exchangeGiftTableViewCellDidConverViewShow:self];
            }
            else if (!visible && [self.delegate respondsToSelector:@selector(exchangeGiftTableViewCellDidCoverViewDismiss:)])
            {
                [self.delegate exchangeGiftTableViewCellDidCoverViewDismiss:self];
            }
        }
    };
    
    [UIView animateWithDuration:0.2f animations:animations completion:completion];
}
- (IBAction)onExchangeButtonClicked:(id)sender {
}
@end
