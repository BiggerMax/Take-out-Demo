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
    login
}DataType;
@interface YJDataManager : NSObject
+(BOOL)openDB;
+(NSArray *)getData:(DataType)type;
+(NSArray *)updateData:(DataType)type;
@end
