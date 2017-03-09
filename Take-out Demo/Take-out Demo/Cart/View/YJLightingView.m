//
//  YJLightingView.m
//  Take-out Demo
//
//  Created by 袁杰 on 17/3/9.
//  Copyright © 2017年 袁杰. All rights reserved.
//

#import "YJLightingView.h"

@implementation YJLightingView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        
        UIView *lines = [[UIView alloc] init];
        lines.backgroundColor = GeneralColor;
        
        UILabel *lighningLabel = [UILabel new];
        lighningLabel.text = @"购物清单";
        lighningLabel.font = [UIFont systemFontOfSize:15];
        [lighningLabel sizeToFit];
        [self addSubview:lines];
        [self addSubview:lighningLabel];
        
        [lines mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(3);
            make.height.mas_equalTo(15);
            make.leading.equalTo(self).offset(10);
            make.centerY.equalTo(self);
        }];
        [lighningLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(lines).offset(5);
            make.centerY.equalTo(self);
        }];
    }
    return self;
}

@end
