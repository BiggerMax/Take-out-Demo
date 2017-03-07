//
//  YJTableFootView.m
//  Take-out Demo
//
//  Created by 袁杰 on 17/3/7.
//  Copyright © 2017年 袁杰. All rights reserved.
//

#import "YJTableFootView.h"

@interface YJTableFootView()
@property(nonatomic,strong)UILabel *money;
@property(nonatomic,strong)UIButton *commitBtn;
@end
@implementation YJTableFootView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        _money = [[UILabel alloc] init];
        _money.font = [UIFont systemFontOfSize:15];
        _money.textColor = [UIColor redColor];
        [self addSubview:_money];
        
        _commitBtn = [[UIButton alloc] init];
        [_commitBtn setTitle:@"选好了" forState:UIControlStateNormal];
        [_commitBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_commitBtn addTarget:self action:@selector(commitBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_commitBtn];
        
        [_money mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self);
            make.width.equalTo(@100);
            make.leading.equalTo(self).offset(15);
            make.height.equalTo(@15);
        }];
        [_commitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self);
            make.trailing.equalTo(self);
            make.height.equalTo(self);
            make.width.equalTo(@100);
        }];
    }
    return self;
}

-(void)setSumMoney:(CGFloat)sumMoney{
    _sumMoney = sumMoney;
    self.money.text = [NSString stringWithFormat:@"共 ￥%.2lf",sumMoney];
}
-(void)commitBtnClick{
    if ([self.delegate respondsToSelector:@selector(didTableFootViewCommit)]) {
        [self.delegate didTableFootViewCommit];
    }
}

@end
