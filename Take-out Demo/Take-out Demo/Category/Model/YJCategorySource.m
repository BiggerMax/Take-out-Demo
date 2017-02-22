//
//  YJCategorySource.m
//  Take-out Demo
//
//  Created by 袁杰 on 17/2/22.
//  Copyright © 2017年 袁杰. All rights reserved.
//

#import "YJCategorySource.h"

@implementation YJCategorySource
+(void)loadSupermarketData:(CompleteBlock)complete{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"supermarket" ofType:nil];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    YJCategorySource *source = [YJCategorySource mj_objectWithKeyValues:json];
    SuperMarketData *supermarketData = source.data;
    for (NSInteger i = 0; i < supermarketData.categories.count; i++) {
        ProductCategory *category = supermarketData.categories[i];
        NSArray *productsArr = supermarketData.products[category.id];
        category.products = [YJGoods mj_objectArrayWithKeyValuesArray:productsArr];
    }
    complete(supermarketData,nil);
}

@end

@implementation SuperMarketData

+(NSDictionary *)mj_objectClassInArray{
    return @{@"categories":NSStringFromClass([ProductCategory class])};
}

@end
@implementation ProductCategory

+(NSDictionary *)mj_objectClassInArray{
    return @{@"products":NSStringFromClass([YJGoods class])};
}

@end
