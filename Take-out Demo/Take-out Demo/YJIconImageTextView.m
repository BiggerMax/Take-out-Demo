//
//  YJIconImageTextView.m
//  Take-out Demo
//
//  Created by 袁杰 on 16/12/22.
//  Copyright © 2016年 袁杰. All rights reserved.
//

#import "YJIconImageTextView.h"

@interface YJIconImageTextView()
@property(nonatomic,strong)UIImageView *imageView;
@property(nonatomic,strong)UILabel *label;
@property(nonatomic,strong)UIImage *placeHolder;
@end
@implementation YJIconImageTextView

-(instancetype)init{
    if (self = [super init]) {
        self.imageView = [[UIImageView alloc]init];
        self.imageView.userInteractionEnabled = NO;
        [self addSubview:self.imageView];
        
        self.label = [[UILabel alloc]init];
        self.label.userInteractionEnabled = NO;
        self.label.font = [UIFont systemFontOfSize:12];
        self.label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.label];
        [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self);
            make.trailing.equalTo(self);
            make.bottom.equalTo(self);
            make.height.mas_equalTo(20);
        }];
        [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.mas_equalTo(5);
            make.top.mas_equalTo(5);
            make.trailing.mas_equalTo(-5);
            make.bottom.equalTo(self.label.mas_top).offset(-5);
        }];
    }
    return self;
}

+(instancetype)IconImageTextView:(NSString *)image title:(NSString *)title placeHolder:(UIImage *)placeHolder{
    YJIconImageTextView *view = [[self alloc] init];
    [view.imageView sd_setImageWithURL:[NSURL URLWithString:image] placeholderImage:placeHolder];
    view.label.text = title;
    return view;
}

@end
