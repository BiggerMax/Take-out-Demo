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
        self.avatarImage = [UIImage imageNamed:@"v2_my_avatar"];
        _avartarBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_avartarBtn setImage:_avatarImage forState:UIControlStateNormal];
        [_avartarBtn addTarget:self action:@selector(changeAvatar) forControlEvents:UIControlEventTouchDown];
        [self addSubview:_avartarBtn];
        
        UILabel *nameLabel = [[UILabel alloc] init];
       // nameLabel.backgroundColor = [UIColor cyanColor];
        nameLabel.text = @"测试用专用昵称";
        nameLabel.textColor = [UIColor whiteColor];
        [self addSubview:nameLabel];
        
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).offset(10);
            make.trailing.equalTo(self).offset(5);
            make.width.and.height.mas_equalTo(50);
        }];
        
        [_avartarBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self);
            make.leading.mas_equalTo(10);
            make.width.and.height.mas_equalTo(70);
            make.top.equalTo(self).offset(40);
        }];
        
        [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(_avartarBtn.mas_centerY);
            make.left.equalTo(_avartarBtn.mas_right).offset(5);
           // make.top.equalTo(avatarView);
            make.height.mas_equalTo(@30);
        }];
    }
    return self;
}

@end
