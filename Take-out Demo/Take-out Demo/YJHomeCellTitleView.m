//
//  YJHomeCellTitleView.m
//  Take-out Demo
//
//  Created by 袁杰 on 16/12/23.
//  Copyright © 2016年 袁杰. All rights reserved.
//

#import "YJHomeCellTitleView.h"
#import "UIColor+YJExpand.h"

@interface YJHomeCellTitleView ()
@property(nonatomic,strong)UIView *lineView;
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UILabel *moreLabel;
@end
@implementation YJHomeCellTitleView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        _lineView = [[UIView alloc] init];
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.text = @"优选水果";
        _titleLabel.font = [UIFont systemFontOfSize:15];
        [_titleLabel sizeToFit];
        
        _moreLabel = [[UILabel alloc]init];
        _moreLabel.font = [UIFont systemFontOfSize:12];
        _moreLabel.textAlignment = NSTextAlignmentRight;
        _moreLabel.text = @"更多 >";
        [_moreLabel sizeToFit];
        
        [self addSubview:_lineView];
        [self addSubview:_titleLabel];
        [self addSubview:_moreLabel];
        
        [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(3);
            make.height.mas_equalTo(15);
            make.leading.equalTo(self).offset(10);
            make.centerY.equalTo(self);
        }];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(_lineView);
            make.leading.equalTo(_lineView).offset(10);
            make.height.mas_equalTo(15);
        }];
        [_moreLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.trailing.equalTo(self).offset(10);
            make.centerY.equalTo(_lineView);
            make.height.mas_equalTo(15);
        }];

    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
}

-(void)setActRow:(ActRow *)actRow{
    UIColor *color = [UIColor getColor:actRow.category_detail.category_color];
    _lineView.backgroundColor = color;
    _titleLabel.textColor = color;
    _titleLabel.text = actRow.category_detail.name;
}

-(void)setTitleViewInfo:(ActRow *)titleViewInfo{
    
}
@end
