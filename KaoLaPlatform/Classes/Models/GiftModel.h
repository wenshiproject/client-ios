//
//  GiftModel.h
//  KaoLaPlatform
//
//  Created by Doyang on 14-4-5.
//  Copyright (c) 2014年 Onyx International Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Gift : NSObject

@property (assign) int identify;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *description;


@end

@interface GiftModel : NSObject

@property (strong, nonatomic) NSDictionary *giftDic;

+ (GiftModel *)sharedModel;

@end
