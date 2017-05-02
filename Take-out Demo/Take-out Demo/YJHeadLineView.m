//
//  YJHeadLineView.m
//  Take-out Demo
//
//  Created by 袁杰 on 16/12/22.
//  Copyright © 2016年 袁杰. All rights reserved.
//

#import "YJHeadLineView.h"
#import "YJHeadLinePageVIew.h"

@interface YJHeadLineView()
@property(nonatomic,strong)UIImageView *headlineImageView;
@property(nonatomic,strong)YJHeadLinePageVIew *pageView;
@end
@implementation YJHeadLineView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        self.layer.borderColor = [UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1.0].CGColor;
        self.layer.borderWidth = 1;
        _headlineImageView = [[UIImageView alloc]init];
        _headlineImageView.contentMode = UIViewContentModeScaleToFill;
        _headlineImageView.image = [UIImage imageNamed:@"sale.png"];
        [self addSubview:_headlineImageView];
        _pageView = [YJHeadLinePageVIew new];
        UIView *line = [[UIView alloc]init];
        line.backgroundColor = [UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1.0];
        [self addSubview:line];
        [self addSubview:_pageView];
        [_headlineImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(80);
            make.height.equalTo(self);
            make.leading.equalTo(self);
            make.top.equalTo(self);
        }];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).offset(5);
            make.leading.equalTo(_headlineImageView.mas_trailing).offset(5);
            make.bottom.equalTo(self).offset(-5);
            make.width.mas_equalTo(1);
        }];
        [_pageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(_headlineImageView.mas_trailing);
            make.top.equalTo(self);
            make.height.equalTo(self);
            make.trailing.equalTo(self);
        }];
    }
    return self;
}

-(void)setHeadLine:(ActInfo *)headLine{
    self.pageView.headLine = headLine;
    
}

-(void)setCallBack:(ClikedCallback)callBack{
    self.pageView.callBack = callBack;
}
@end
