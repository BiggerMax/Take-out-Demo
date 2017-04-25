//
//  YJFooterBannerData.m
//  Take-out Demo
//
//  Created by 袁杰 on 17/2/19.
//  Copyright © 2017年 袁杰. All rights reserved.
//

#import "YJFooterBannerData.h"

@implementation YJFooterBannerData
+(void)loadFooterBannerData:(CompleteBlock)complete{
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"footerBanner" ofType:nil];
//    NSData *data = [NSData dataWithContentsOfFile:path];
//    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
//    YJFooterBannerData *footerData = [YJFooterBannerData mj_objectWithKeyValues:dict];
//    complete(footerData.data,nil);
    BmobQuery *query = [BmobQuery queryWithClassName:@"footBanner"];
    NSMutableArray *dic = [NSMutableArray new];
    [query findObjectsInBackgroundWithBlock:^(NSArray *array, NSError *error) {
        for (BmobObject *obj in array)
        {
            [dic addObject:[obj objectForKey:@"img"]];
        }
         complete(dic,nil);
    }];
   
}

//+(NSDictionary *)mj_objectClassInArray{
//    return @{@"data":NSStringFromClass([YJActivity class])};
//}
@end
