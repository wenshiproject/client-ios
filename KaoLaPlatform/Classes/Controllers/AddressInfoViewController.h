//
//  AddressInfoViewController.h
//  KaoLaPlatform
//
//  Created by Doyang on 14-4-11.
//  Copyright (c) 2014年 Onyx International Inc. All rights reserved.
//

#import "BaseViewController.h"
#import "AddressInfoTableViewCell.h"

@interface AddressInfoViewController : BaseViewController<UITableViewDataSource, UITableViewDelegate>
{
    UINib *_nib;
}
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end
