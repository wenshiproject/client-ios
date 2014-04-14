//
//  UserCenterViewController.h
//  KaoLaPlatform
//
//  Created by Doyang on 14-4-8.
//  Copyright (c) 2014年 Onyx International Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseTabViewController.h"

@interface UserCenterViewController : BaseTabViewController<UITableViewDataSource, UITableViewDelegate>
{
    NSArray *_titleArray;
    NSArray *_iconsArray;
    NSIndexPath *_selectedIndexPath;
}

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end
