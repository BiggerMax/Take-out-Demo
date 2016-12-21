//
//  YJShopCarTool.m
//  Take-out Demo
//
//  Created by 袁杰 on 16/12/21.
//  Copyright © 2016年 袁杰. All rights reserved.
//

#import "YJShopCarTool.h"
#import "NSString+Extension.h"
@implementation YJShopCarTool

+(instancetype)sharedInstance{
    static dispatch_once_t one;
    static YJShopCarTool *shopCarTool;
    dispatch_once(&one,^{
        if (shopCarTool == nil) {
            shopCarTool = [[YJShopCarTool alloc]init];
        }
    });
    return shopCarTool;
}

-(NSMutableArray<YJGoods *>*)shopCar{
    if (!_shopCar) {
        _shopCar = [NSMutableArray array];
    }
    return _shopCar;
}

#pragma 添加商品
-(void)addSupermarkProductToShopCar:(YJGoods *)goods{
    for (YJGoods *obj in self.shopCar ) {
        if (obj.gid == goods.gid) {
            return;
        }
    }
    [self.shopCar addObject:goods];
}

//删除商品
-(void)removeFromProductShopCar:(YJGoods *)goods{
    for (YJGoods *obj in self.shopCar) {
        if (goods.gid == obj.gid) {
            [self.shopCar removeObject:goods];
            [[NSNotificationCenter defaultCenter] postNotificationName:LFBShopCarDidRemoveProductNSNotification object:self userInfo:nil];
            return;
            
        }
    }
}

//获取商品数量
-(NSInteger)getShopCarGoodsNumber{
    __block NSInteger count = 0;
    [self.shopCar enumerateObjectsUsingBlock:^(YJGoods * obj, NSUInteger idx, BOOL * _Nonnull stop) {
        count += obj.userByNumber;
    }];
    return count;
}

//获取商品总价格
-(CGFloat)getShopCarGoodsPrice{
    __block CGFloat price = 0;
    [self.shopCar enumerateObjectsUsingBlock:^(YJGoods * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        price += [[obj.price cleanDecimalPointZear] doubleValue] * obj.userByNumber;
    }];
    return price;
}
-(BOOL)isEmpty{
    return self.shopCar.count == 0;
}
@end
