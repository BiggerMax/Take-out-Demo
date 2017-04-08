//
//  AdressData.h
//  Take-out Demo
//
//  Created by 袁杰 on 17/4/8.
//  Copyright © 2017年 袁杰. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Adress;

@interface AdressData : NSObject
@property (nonatomic) NSInteger code;
@property (nonatomic,copy) NSString *msg;
@property (nonatomic,copy) NSArray<Adress *> *data;

+(void)loadAdressData:(CompleteBlock)complete;
@end

@interface Adress : NSObject
@property (nonatomic,copy) NSString *accept_name;
@property (nonatomic,copy) NSString *telphone;
@property (nonatomic,copy) NSString *province_name;
@property (nonatomic,copy) NSString *city_name;
@property (nonatomic,copy) NSString *address;
@property (nonatomic,copy) NSString *lng;
@property (nonatomic,copy) NSString *lat;
@property (nonatomic,copy) NSString *gender;

@end
