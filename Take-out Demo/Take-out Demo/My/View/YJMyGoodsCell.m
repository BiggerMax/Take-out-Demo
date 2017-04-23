//
//  YJMyGoodsCell.m
//  Take-out Demo
//
//  Created by 袁杰 on 2017/4/21.
//  Copyright © 2017年 袁杰. All rights reserved.
//

#import "YJMyGoodsCell.h"

@implementation YJMyGoodsCell

-(void)setOrderGoods:(OrderGoods *)orderGoods
{
    self.goodsName.text = [NSString stringWithFormat:@"%@",orderGoods.name];
    self.goodsCount.text = [NSString stringWithFormat:@"\"×\"%@",orderGoods.goods_nums];
    self.goodsPrice.text = [NSString stringWithFormat:@"\"￥\"%@",orderGoods.goods_price];
}

@end
