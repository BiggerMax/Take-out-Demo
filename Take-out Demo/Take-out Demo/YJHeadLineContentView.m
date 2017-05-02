//
//  YJHeadLineContentView.m
//  Take-out Demo
//
//  Created by 袁杰 on 16/12/22.
//  Copyright © 2016年 袁杰. All rights reserved.
//

#import "YJHeadLineContentView.h"
#import "YJHeadLineContentView.h"
@interface YJHeadLineContentView ()

@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UILabel *contentLabel;
@end
@implementation YJHeadLineContentView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.textColor = [UIColor redColor];
        _titleLabel.font = [UIFont systemFontOfSize:12];
        _titleLabel.layer.borderColor = [UIColor redColor].CGColor;
        _titleLabel.layer.borderWidth = 1;
        _titleLabel.layer.cornerRadius = 3;
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_titleLabel];
        
        
        _contentLabel = [[UILabel alloc]init];
        [_contentLabel sizeToFit];
        _contentLabel.font = [UIFont systemFontOfSize:12];
        _contentLabel.textColor = [UIColor colorWithRed:155/255.0 green:155/255.0 blue:155/255.0 alpha:1];
        [self addSubview:_contentLabel];
        
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self).offset(10);
            make.centerY.equalTo(self);
            make.width.mas_equalTo(100);
            make.height.mas_equalTo(18);
        }];
        [_contentLabel sizeToFit];
        [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(_titleLabel.mas_trailing).offset(10);
            make.centerY.equalTo(self);
        }];
        BmobQuery *query = [BmobQuery queryWithClassName:@"Annoucement"];
            [query findObjectsInBackgroundWithBlock:^(NSArray *array, NSError *error) {
                for (BmobObject *obj in array) {
                    self.titleLabel.text =  [obj objectForKey:@"title"];
                    self.contentLabel.text = [obj objectForKey:@"content"];
                }
            }];

    }
    return self;
}

-(void)setActRow:(ActRow *)actRow{
    BmobQuery *query = [BmobQuery queryWithClassName:@"Annoucement"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *array, NSError *error) {
        for (BmobObject *obj in array) {
            self.titleLabel.text =  [obj objectForKey:@"title"];
            self.contentLabel.text = [obj objectForKey:@"content"];
        }
    }];
//    self.titleLabel.text =  actRow.headline_detail.title;
//    self.contentLabel.text = actRow.headline_detail.content;
    
}
-(void)setAnnRow:(Annoucement *)annRow
    {
        self.titleLabel.text = annRow.title;
        self.contentLabel.text = annRow.content;
    }
@end

