//
//  YJUserShopCarTool.h
//  Take-out Demo
//
//  Created by 袁杰 on 17/3/1.
//  Copyright © 2017年 袁杰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YJGoods.h"
@interface YJUserShopCarTool : NSObject
@property(nonatomic,strong)NSMutableArray<YJGoods *>*shopCar;
+(instancetype)sharedInstance;
- (void)addSupermarkProductToShopCar:(YJGoods *)goods;
- (void)removeFromProductShopCar:(YJGoods*)goods;
- (CGFloat)getShopCarGoodsPrice ;
- (NSInteger)getShopCarGoodsNumber;
- (BOOL)isEmpty;
@end
