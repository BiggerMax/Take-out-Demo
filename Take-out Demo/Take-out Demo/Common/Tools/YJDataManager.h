//
//  YJDataManager.h
//  Take-out Demo
//
//  Created by 袁杰 on 2017/4/16.
//  Copyright © 2017年 袁杰. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef enum {
    hotSale,//首页热卖
    freshSale,//新鲜热卖
    footerBanner,//滚动条
    myAdress,//收货地址
    categoty,
    user,
    homeHeadData,
	produteData,
	categories
}DataType;

typedef enum {
    registe,
    changePSW
}UpdateType;

@interface YJDataManager : NSObject
+(BOOL)openDB;
+(NSArray *)getData:(DataType)type;
+(void)updateData:(UpdateType)type record:(NSDictionary *)record callback:(void(^)(NSArray *array,BOOL isError))callback;
+(NSArray *)fillData:(DataType)type;
@end
