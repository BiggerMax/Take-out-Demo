//
//  YJUserInfo.h
//  Take-out Demo
//
//  Created by 袁杰 on 17/4/8.
//  Copyright © 2017年 袁杰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AdressData.h"
@interface YJUserInfo : NSObject
@property(nonatomic,strong)NSMutableArray *allAdress;
+(instancetype)shareInstance;
@property(nonatomic,strong)Adress *defaultAddress;
@end
