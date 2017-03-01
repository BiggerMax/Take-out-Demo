//
//  YJGoodsCell.m
//  Take-out Demo
//
//  Created by 袁杰 on 17/2/22.
//  Copyright © 2017年 袁杰. All rights reserved.
//

#import "YJGoodsCell.h"
#import "YJBuyView.h"
@interface YJGoodsCell()
@property UIImageView *goodsIcon;
@property UILabel *refinedLabel;
@property UILabel *goodsName;
@property UILabel *heftLabel;
@property UILabel *priceLabel;
@property UILabel *dicountLabel;
@property YJBuyView *buyView;
@end
@implementation YJGoodsCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellStyleDefault;
        _goodsIcon = [[UIImageView alloc] init];
        _refinedLabel = [[UILabel alloc] init];
        _refinedLabel.font = [UIFont systemFontOfSize:11];
        _refinedLabel.layer.borderWidth = 1;
        _refinedLabel.layer.borderColor = [UIColor redColor].CGColor;
        _refinedLabel.layer.cornerRadius = 3;
        _refinedLabel.layer.masksToBounds = YES;
        _refinedLabel.textAlignment = NSTextAlignmentCenter;
        _refinedLabel.textColor = [UIColor redColor];
        _refinedLabel.text = @"精选";
        _refinedLabel.hidden = YES;
        
        _goodsName = [[UILabel alloc]init];
        _goodsName.font = [UIFont systemFontOfSize:15];
        _goodsName.textAlignment = NSTextAlignmentLeft;
        
        _heftLabel = [[UILabel alloc]init];
        _heftLabel.font = [UIFont systemFontOfSize:13];
        _heftLabel.textAlignment = NSTextAlignmentLeft;
        
        _priceLabel = [[UILabel alloc]init];
        _priceLabel.font = [UIFont systemFontOfSize:15];
        _priceLabel.textAlignment = NSTextAlignmentLeft;
        _priceLabel.textColor = [UIColor redColor];
        _buyView = [[YJBuyView alloc]init];
        
        [self addSubview:_goodsIcon];
        [self addSubview:_refinedLabel];
        [self addSubview:_goodsName];
        [self addSubview:_heftLabel];
        [self addSubview:_priceLabel];
        [self addSubview:_buyView];
        
        CGFloat height = 15;
        [_goodsIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.height.mas_equalTo(80);
            make.leading.equalTo(self).offset(10);
            make.centerY.equalTo(self);
        }];
        [_refinedLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(25);
            make.height.mas_equalTo(height);
            make.leading.equalTo(_goodsIcon.mas_trailing);
            make.top.equalTo(_goodsIcon);
        }];
        [_goodsName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(_refinedLabel.mas_trailing);
            make.top.equalTo(_goodsIcon);
            
        }];
        [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(_goodsIcon.mas_trailing);
            make.bottom.equalTo(_goodsIcon.mas_bottom);
            make.height.mas_equalTo(height);
            make.width.mas_equalTo(80);
        }];
        [_heftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(_goodsIcon.mas_trailing);
            make.bottom.equalTo(_priceLabel.mas_top);
            make.height.mas_equalTo(height);
            make.width.mas_equalTo(80);
        }];
        [_buyView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self).offset(-2);
            make.trailing.equalTo(self).offset(-2);
            make.width.mas_equalTo(65);
            make.height.mas_equalTo(25);
        }];
        
    }
    return self;
}
-(void)setGoods:(YJGoods*)goods{
    _goods = goods;
    if (self.goods.is_xf) {
        _refinedLabel.hidden = NO;
    }else{
        _refinedLabel.hidden = YES;
        [_goodsName mas_updateConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(_goodsIcon.mas_leading);
        }];
    }
    _buyView.goods = goods;
    _heftLabel.text = goods.specifics;
    _priceLabel.text = [NSString stringWithFormat:@"￥%@",goods.price];
    [_goodsIcon sd_setImageWithURL:[NSURL URLWithString:goods.img] placeholderImage:[UIImage imageNamed:@"v2_placeholder_full_size.png"]];
    _goodsName.text = goods.name;
}
-(void)setHighlighted:(BOOL)highlighted{
    
}
@end
