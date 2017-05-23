//
//  OrderData.h
//  Take-out Demo
//
//  Created by 袁杰 on 2017/4/12.
//  Copyright © 2017年 袁杰. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Order;
@class OrderGoods;
@interface OrderData : NSObject
@property(nonatomic,copy)NSArray<Order *> *data;


+(void)loadOrderData:(CompleteBlock)complete;
@end

@interface Order : NSObject
@property(nonatomic,copy)NSString *create_time;
@property(nonatomic,copy)NSString *textStatus;
@property(nonatomic,copy)NSString *user_pay_amount;
@property(nonatomic,assign)int buy_num;
@property(nonatomic,copy)NSString *order_no;
@property(nonatomic,copy)NSString *accept_name;
@property(nonatomic,copy)NSString *comment;
@property(nonatomic,copy)NSString *mobile;
@property(nonatomic,copy)NSString *address;
@property(nonatomic,strong)NSArray<NSDictionary *> *order_goods;
@end

@interface OrderGoods : NSObject
@property(nonatomic,copy)NSString *img;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *goods_nums;
@property(nonatomic,copy)NSString *goods_price;

@end
