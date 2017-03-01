//
//  YJUserShopCarTool.m
//  Take-out Demo
//
//  Created by 袁杰 on 17/3/1.
//  Copyright © 2017年 袁杰. All rights reserved.
//

#import "YJUserShopCarTool.h"
#import "NSString+Extension.h"
@implementation YJUserShopCarTool
+(instancetype)sharedInstance{
    static dispatch_once_t one;
    static YJUserShopCarTool *shopCarTool;
    dispatch_once(&one, ^{
        if (shopCarTool == nil) {
            shopCarTool = [[YJUserShopCarTool alloc] init];
        }
    });
    return shopCarTool;
}

-(NSMutableArray<YJGoods *> *)shopCar{
    if (!_shopCar) {
        _shopCar = [NSMutableArray array];
    }
    return _shopCar;
}

-(void)addSupermarkProductToShopCar:(YJGoods *)goods{
    for (YJGoods *obj in self.shopCar) {
        if (obj.gid == goods.gid) {
            return;
        }
    }
    [self.shopCar addObject:goods];
}

-(void)removeFromProductShopCar:(YJGoods *)goods{
    for (YJGoods *obj in self.shopCar) {
        if (goods.gid == obj.gid) {
            [self.shopCar removeObject:goods];
            [[NSNotificationCenter defaultCenter] postNotificationName:LFBShopCarDidRemoveProductNSNotification object:self userInfo:nil];
            return;
        }
    }
}

-(NSInteger)getShopCarGoodsNumber{
    __block NSInteger count = 0;
    [self.shopCar enumerateObjectsUsingBlock:^(YJGoods * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        count += obj.userByNumber;
    }];
    return count;
}

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
