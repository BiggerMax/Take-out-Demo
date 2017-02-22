//
//  CategoryData.h
//  Take-out Demo
//
//  Created by 袁杰 on 17/2/22.
//  Copyright © 2017年 袁杰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YJGoods.h"
@interface CategoryData : NSObject
@property (nonatomic, copy) NSString *ID;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *sort;
@property(nonatomic,strong)NSArray<YJGoods*> *products;
@end
