//
//  YJMyHeadView.m
//  Take-out Demo
//
//  Created by 袁杰 on 17/2/16.
//  Copyright © 2017年 袁杰. All rights reserved.
//

#import "YJMyHeadView.h"

@implementation YJMyHeadView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.image = [UIImage imageNamed:@"v2_my_avatar_bg"];
        UIButton *button = [[UIButton alloc] init];
        [button setImage:[UIImage imageNamed:@"v2_my_settings_icon"] forState:UIControlStateNormal];
        [self addSubview:button];
        
        UIImageView *avatarView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"v2_my_avatar"]];
        [self addSubview:avatarView];
        //
        UILabel *phoneLabel = [[UILabel alloc] init];
        phoneLabel.backgroundColor = [UIColor cyanColor];
        phoneLabel.text = @"手机号码";
        phoneLabel.textColor = [UIColor whiteColor];
        [self addSubview:phoneLabel];
        
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).offset(10);
            make.trailing.equalTo(self).offset(5);
            make.width.and.height.mas_equalTo(50);
        }];
        
        [avatarView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self).offset(-10);
            make.leading.mas_equalTo(10);
        }];
        
        [phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(avatarView.mas_right).offset(5);
            make.top.equalTo(avatarView);
            make.height.mas_equalTo(@30);
        }];
    }
    return self;
}

@end
