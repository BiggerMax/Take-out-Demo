//
//  YJHomeCategoryCell.m
//  Take-out Demo
//
//  Created by 袁杰 on 16/12/23.
//  Copyright © 2016年 袁杰. All rights reserved.
//

#import "YJHomeCategoryCell.h"

@interface YJHomeCategoryCell ()

@end
@implementation YJHomeCategoryCell

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        _titleView = [[YJHomeCellTitleView alloc] init];
        [self addSubview:_titleView];
        _sortImage = [[UIImageView alloc] init];
        [self addSubview:_sortImage];
        _goodsView = [[YJHomeCellGoodsView alloc]init];
        [self addSubview:_goodsView];
        
        [_titleView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.trailing.leading.equalTo(self);
            make.height.mas_offset(30);
        }];
        [_sortImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_titleView.mas_bottom);
            make.leading.equalTo(self).offset(10);
            make.trailing.equalTo(self).offset(-10);
            make.height.equalTo(@100);
        }];
        [_goodsView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_sortImage.mas_bottom);
            make.leading.trailing.equalTo(self);
            make.bottom.equalTo(self);
        }];
    }
    return self;
}
- (void)setCellInfo:(ActRow *)cellInfo{
    self.titleView.actRow = cellInfo;
    //self.goodsView.actRow = cellInfo;
    [self.sortImage sd_setImageWithURL:[NSURL URLWithString:cellInfo.activity.img] placeholderImage:[UIImage imageNamed:cellInfo.category_detail.name]];
}

- (void)setCellback:(ClickedCallBack)callback{
    _callBack = callback;
    self.goodsView.callBack = callback;
}
@end
