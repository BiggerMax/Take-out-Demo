//
//  YJCategorySource.h
//  Take-out Demo
//
//  Created by 袁杰 on 17/2/22.
//  Copyright © 2017年 袁杰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YJGoods.h"

@class SuperMarketData;
@class Products;
@class ProductCategory;
@class YJGoods;

@interface YJCategorySource : NSObject
@property(nonatomic,copy)NSString *code;
@property(nonatomic,copy)NSString *msg;
@property(nonatomic,strong)SuperMarketData *data;
+(void)loadSupermarketData:(CompleteBlock)complete;
+(void)loadProductData:(CompleteBlock)complete;
@end


@interface SuperMarketData : NSObject
@property(nonatomic,strong)NSArray<ProductCategory *>*categories;
@property(nonatomic,strong)id products;
@end


@interface ProductCategory : NSObject
@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *sort;
@property (nonatomic, strong) NSArray <YJGoods *> *products;
@end
