//
//  YJGoods.h
//  Take-out Demo
//
//  Created by 袁杰 on 16/12/21.
//  Copyright © 2016年 袁杰. All rights reserved.
//

#import <Foundation/Foundation.h>
@class YJGoods;

@interface GoodsData : NSObject
@property(nonatomic,copy)NSString *code;
@property(nonatomic,copy)NSString *msg;
@property(nonatomic,strong)NSArray<YJGoods *>*data;

+(void)loadGoodData:(CompleteBlock)complete;

@end

@interface YJGoods : NSObject

@property(nonatomic,copy)NSString *gid;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *brand_id;

@property(nonatomic,copy)NSString *market_price;
@property(nonatomic,copy)NSString *cid;
@property(nonatomic,copy)NSString *category_id;

@property (nonatomic,copy) NSString *partner_price;
@property (nonatomic,copy) NSString *brand_name;
@property (nonatomic,copy) NSString *pre_img;
@property (nonatomic,copy) NSString *pre_imgs;
/// 参数
//详情
@property (nonatomic,copy) NSString *specifics;
@property (nonatomic,copy) NSString *product_id;
//经销商id
@property (nonatomic,copy) NSString *dealer_id;
/// 当前价格
@property (nonatomic,copy) NSString *price;
/// 库存
@property (nonatomic,assign) NSInteger number;
/// 买一赠一
@property (nonatomic,copy) NSString *pm_desc;
@property (nonatomic,assign) NSInteger had_pm;
@property (nonatomic,copy) NSString *img;
/// 是不是精选 0 : 不是, 1 : 是
@property (nonatomic,assign) NSInteger is_xf;

//购物车添加次数
@property(nonatomic,assign)NSInteger userByNumber;
@end
