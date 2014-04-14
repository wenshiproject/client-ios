//
//  UserModel.h
//  KaoLaPlatform
//
//  Created by Doyang on 14-4-11.
//  Copyright (c) 2014年 Onyx International Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AddressInfo : NSObject

@property (strong, nonatomic) NSString *address;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *phoneNumber;
@property (assign) NSInteger isDefault;
@property (assign) NSInteger index;
@end

@interface UserModel : NSObject

@property (strong, nonatomic) NSMutableArray *addressInfoArray;

+ (UserModel *)sharedModel;
@end
