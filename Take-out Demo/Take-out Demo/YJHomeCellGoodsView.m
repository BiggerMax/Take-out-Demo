//
//  YJHomeCellGoodsView.m
//  Take-out Demo
//
//  Created by 袁杰 on 16/12/23.
//  Copyright © 2016年 袁杰. All rights reserved.
//

#import "YJHomeCellGoodsView.h"

#define maxCount 3
@implementation YJHomeCellGoodsView
-(instancetype)initWithFrame:(CGRect)frame{
    if ([super initWithFrame:frame]) {
        
    }
    return self;
}

-(instancetype)init{
    if (self = [super init]) {
        for (int i = 0; i < maxCount; i++) {
            YJHomeCell *homeCell = [[YJHomeCell alloc]init];
            homeCell.layer.borderWidth = 0.5;
            homeCell.layer.borderColor = GrayColor.CGColor;
            [self addSubview:homeCell];
        }
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    CGFloat cellHeight = self.frame.size.height;
    CGFloat cellWidth = self.frame.size.width / 3;
    CGFloat index = 0;
    for (YJHomeCell *cell in self.subviews) {
        cell.frame = CGRectMake(cellWidth * index, 0, cellWidth, cellHeight);
        index ++;
    }
}

-(void)setActRow:(ActRow *)actRow{
    for (int i = 0; i < self.subviews.count; i++) {
        YJHomeCell *cell = self.subviews[i];
        cell.minusNeverShow = YES;
        cell.goods = actRow.category_detail.goods[i];
    }
}
@end
