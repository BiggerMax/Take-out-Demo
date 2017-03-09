//
//  YJAddressView.m
//  Take-out Demo
//
//  Created by 袁杰 on 17/3/9.
//  Copyright © 2017年 袁杰. All rights reserved.
//

#import "YJAddressView.h"

@interface YJAddressView()
@property(nonatomic,strong)UILabel *addressLabel;
@property(nonatomic,strong)UIImageView *arrows;
@end
@implementation YJAddressView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        
        _addressLabel = [[UILabel alloc] init];
        _addressLabel.font = [UIFont systemFontOfSize:15];
        _addressLabel.textColor = [UIColor redColor];
        _addressLabel.text = @"点击确定你的位置";
        [_addressLabel sizeToFit];
        [self addSubview:_addressLabel];
        
        _arrows = [UIImageView new];
        _arrows.image = [UIImage imageNamed:@"icon_go"];
        [self addSubview:_arrows];
        
        [_addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self).offset(10);
            make.centerY.equalTo(self);
        }];
        [_arrows mas_makeConstraints:^(MASConstraintMaker *make) {
            make.trailing.equalTo(self).offset(-10);
            make.centerY.equalTo(self);
        }];
    }
    return self;
}


@end
