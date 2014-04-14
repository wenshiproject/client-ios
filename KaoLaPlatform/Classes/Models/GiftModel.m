//
//  GiftModel.m
//  KaoLaPlatform
//
//  Created by Doyang on 14-4-5.
//  Copyright (c) 2014年 Onyx International Inc. All rights reserved.
//

#import "GiftModel.h"

@implementation GiftModel

static GiftModel *shardModel = nil;

@synthesize giftDic;

+ (GiftModel *)sharedModel
{
    if (nil == shardModel)
    {
        shardModel = [[GiftModel alloc] init];
    }
    return shardModel;
}

@end
