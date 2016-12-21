//
//  YJGoods.m
//  Take-out Demo
//
//  Created by 袁杰 on 16/12/21.
//  Copyright © 2016年 袁杰. All rights reserved.
//

#import "YJGoods.h"

@implementation GoodsData
+(void)loadGoodData:(CompleteBlock)complete{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"首页新鲜热卖" ofType:nil];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    GoodsData *goodsData = [GoodsData mj_objectWithKeyValues:json];
    complete(goodsData.data,nil);
}

+(NSDictionary *)mj_objectClassInArray{
    return @{@"data":NSStringFromClass([YJGoods class])};
}
@end

@implementation YJGoods

+(NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"gid" : @"id"};
}

@end
