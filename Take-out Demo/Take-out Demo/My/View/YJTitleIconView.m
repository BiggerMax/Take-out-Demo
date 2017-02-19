//
//  YJTitleIconView.m
//  Take-out Demo
//
//  Created by 袁杰 on 17/2/19.
//  Copyright © 2017年 袁杰. All rights reserved.
//

#import "YJTitleIconView.h"

@interface YJTitleIconView()
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UIImageView *iconView;
@end
@implementation YJTitleIconView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.font = [UIFont systemFontOfSize:12];
        [self addSubview:_titleLabel];
        //
        _iconView = [[UIImageView alloc] init];
        _iconView.contentMode = UIViewContentModeCenter;
        [self addSubview:_iconView];
        //
        [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.centerY.equalTo(self).offset(-10);
        }];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_iconView.mas_bottom).offset(3);
            make.leading.trailing.equalTo(self);
            make.height.mas_equalTo(15);
        }];
    }
    return self;
}
-(instancetype)initWithTitleLabel:(NSString *)title icon:(UIImage *)icon border:(BOOL)border{
    if (self = [super init]) {
        if (border) {
            self.layer.borderColor = GrayColor.CGColor;
            self.layer.borderWidth = 0.5;
        }
        self.titleLabel.text = title;
        self.iconView.image = icon;
    }
    return self;
}

@end
