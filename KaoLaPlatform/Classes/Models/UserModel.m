//
//  UserModel.m
//  KaoLaPlatform
//
//  Created by Doyang on 14-4-11.
//  Copyright (c) 2014年 Onyx International Inc. All rights reserved.
//

#import "UserModel.h"

@implementation AddressInfo



@end

@implementation UserModel

static UserModel *sharedModel = nil;

+ (UserModel *)sharedModel
{
    if (nil == sharedModel)
    {
        sharedModel = [[UserModel alloc] init];
        [sharedModel initializer];
    }
    return sharedModel;
}

- (void)initializer
{
    self.addressInfoArray = [[NSMutableArray alloc] init];
    AddressInfo *info = [[AddressInfo alloc] init];
    info.name = @"欧阳名字";
    info.address = @"广东省广州市天河区天河路104号南方人才市场1楼103室";
    info.phoneNumber = @"13888000088";
    info.isDefault = 1;
    info.index = 1;
    [self.addressInfoArray addObject:info];
}
@end
