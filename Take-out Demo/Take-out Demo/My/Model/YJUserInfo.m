//
//  YJUserInfo.m
//  Take-out Demo
//
//  Created by 袁杰 on 17/4/8.
//  Copyright © 2017年 袁杰. All rights reserved.
//

#import "YJUserInfo.h"


@implementation YJUserInfo
+(instancetype)shareInstance{
    static dispatch_once_t onceToken;
    static YJUserInfo *userInfo;
    dispatch_once(&onceToken, ^{
        userInfo = [[YJUserInfo alloc] init];
        [AdressData loadAdressData:^(NSArray *allAdress, NSError *error) {
            if (allAdress != nil) {
                userInfo.allAdress = [allAdress mutableCopy];
                userInfo.defaultAddress = allAdress[0];
            }
        }];
    });
    return userInfo;
}
-(Adress *)defaultAddress
{
    return _defaultAddress;
}
@end
