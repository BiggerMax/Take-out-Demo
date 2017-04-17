//
//  AdressModel.h
//  Take-out Demo
//
//  Created by 袁杰 on 2017/4/16.
//  Copyright © 2017年 袁杰. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AdressModel : NSObject
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *accept_name;
@property (nonatomic) NSString *telphone;
@property (nonatomic,copy) NSString *province_name;
@property (nonatomic,copy) NSString *city_name;
@property (nonatomic,copy) NSString *address;
@property (nonatomic,copy) NSString *lng;
@property (nonatomic,copy) NSString *lat;
@property (nonatomic,copy) NSString *gender;
@end
