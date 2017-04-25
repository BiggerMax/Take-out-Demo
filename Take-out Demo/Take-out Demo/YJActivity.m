//
//  YJActivity.m
//  Take-out Demo
//
//  Created by 袁杰 on 16/12/22.
//  Copyright © 2016年 袁杰. All rights reserved.
//

#import "YJActivity.h"

@implementation HeadResource
+(void)loadHeadData:(CompleteBlock)complete{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"首页焦点按钮" ofType:nil];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    HeadResource *headResource = [HeadResource mj_objectWithKeyValues:json];
    complete(headResource.data,nil);
}
@end

@implementation HeadData

+(NSDictionary *)mj_objectClassInArray{
    return @{
             @"focus":NSStringFromClass([YJActivity class]),
             @"activities":NSStringFromClass([YJActivity class]),
             @"icons":NSStringFromClass([YJActivity class])
             };
}

@end

@implementation YJActivity

+(NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"aid":@"id"};
}
+(void)loadBannerData:(CompleteBlock)complete{
    BmobQuery *query = [BmobQuery queryWithClassName:@"banner"];
    NSMutableArray *dic = [NSMutableArray new];
    [query findObjectsInBackgroundWithBlock:^(NSArray *array, NSError *error) {
        for (BmobObject *obj in array)
        {
            [dic addObject:[obj objectForKey:@"img"]];
        }
        complete(dic,nil);
    }];

}
@end

@implementation ExtParams


@end
