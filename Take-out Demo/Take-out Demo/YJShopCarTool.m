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
        if (<#condition#>) {
            <#statements#>
        }
    }
}
@end
