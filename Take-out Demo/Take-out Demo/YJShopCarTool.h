//
//  YJShopCarTool.h
//  Take-out Demo
//
//  Created by 袁杰 on 16/12/21.
//  Copyright © 2016年 袁杰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YJGoods.h"
@interface YJShopCarTool : NSObject
@property(nonatomic,strong) NSMutableArray <YJGoods *>*shopCar;

+(instancetype)sharedInstance;
-(void)addSupermarkProductToShopCar:(YJGoods *)goods;
-(void)removeFromProductShopCar:(YJGoods *)goods;
-(CGFloat)getShopCarGoodsPrice;
-(NSInteger)getShopCarGoodsNumber;
-(BOOL)isEmpty;
@end
