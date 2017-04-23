//
//  OrderData.m
//  Take-out Demo
//
//  Created by 袁杰 on 2017/4/12.
//  Copyright © 2017年 袁杰. All rights reserved.
//

#import "OrderData.h"

@implementation OrderData
+(void)loadOrderData:(CompleteBlock)complete{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"MyOrders" ofType:nil];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    OrderData *order = [OrderData mj_objectWithKeyValues:dic];
    complete(order.data,nil);
}

+(NSDictionary *)mj_objectClassInArray{
    return @{@"data":NSStringFromClass([Order class])};
}

@end

@implementation Order
+(NSDictionary *)mj_objectClassInArray{
    return @{@"order_goods":NSStringFromClass([OrderGoods class])};
}

@end
@implementation OrderGoods
//+(NSDictionary *)mj_objectClassInArray{
//    return @{@"phone":NSStringFromClass([])}
//}


@end
