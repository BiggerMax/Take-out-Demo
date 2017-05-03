//
//  YJHomeCell.m
//  Take-out Demo
//
//  Created by 袁杰 on 16/12/22.
//  Copyright © 2016年 袁杰. All rights reserved.
//

#import "YJHomeCell.h"
#import "YJDiscountPriceView.h"
#import "YJBuyView.h"
@interface YJHomeCell()
/** 背景图 */
@property (nonatomic,strong) UIImageView *backImageView;
/** 商品的图片 */
@property (nonatomic,strong) UIImageView *goodsImageView;
/** 商品名字的图片 */
@property (nonatomic,strong) UILabel *nameLabel;
/** 精选的图片 */
@property (nonatomic,strong) UIImageView *fineImageView;
/** 买一赠一的图片 */
@property (nonatomic,strong) UIImageView *giveImageView;
/** 商品单位的图片 */
@property (nonatomic,strong) UILabel *specificsLabel;
/** 折扣 */
@property (nonatomic,strong) YJDiscountPriceView *discountPriceView;
/** 选择数量 */
@property (nonatomic,strong) YJBuyView *buyView;

@property (nonatomic,assign) YJHomeCellType type;

@end
@implementation YJHomeCell
-(instancetype)initWithFrame:(CGRect)frame{
    if ([super initWithFrame:frame]) {
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cellTapgesture)];
        [self addGestureRecognizer:tap];
        self.backgroundColor = [UIColor whiteColor];
        _backImageView = [[UIImageView alloc]init];
        _backImageView.contentMode = UIViewContentModeCenter;
        _goodsImageView = [[UIImageView alloc]init];
        _nameLabel = [[UILabel alloc]init];
        _nameLabel.font = [UIFont systemFontOfSize:14];
        _fineImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"jingxuan.png"]];
        
        //_giveImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"buyOne.png"]];
        
//        _specificsLabel = [[UILabel alloc]init];
//        _specificsLabel.font = [UIFont systemFontOfSize:12];
//        _specificsLabel.textColor = [UIColor darkGrayColor];
        _discountPriceView = [[YJDiscountPriceView alloc]init];
        _buyView = [[YJBuyView alloc]init];
        
        [self addSubview:_backImageView];
        [self addSubview:_goodsImageView];
        [self addSubview:_nameLabel];
        [self addSubview:_fineImageView];
        //[self addSubview:_giveImageView];
        //[self addSubview:_specificsLabel];
        [self addSubview:_buyView];
        [self addSubview:_discountPriceView];
        
        [_backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        [_goodsImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.leading.trailing.equalTo(self);
            make.height.with.equalTo(self.mas_width);
        }];
        [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_goodsImageView.mas_bottom).offset(2);
            make.leading.equalTo(self).offset(5);
            make.width.equalTo(self.mas_width).offset(-2);
            make.height.equalTo(@12);
        }];
        [_fineImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_nameLabel.mas_bottom).offset(3);
            make.leading.equalTo(_nameLabel);
            make.width.mas_equalTo(25);
            make.height.mas_equalTo(13);
        }];
//        [_giveImageView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(_fineImageView);
//            make.leading.equalTo(_fineImageView.mas_trailing).offset(10);
//            make.width.mas_equalTo(30);
//            make.height.mas_equalTo(13);
//        }];
//        [_specificsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(_giveImageView.mas_bottom);
//            make.leading.equalTo(_nameLabel);
//            
//        }];
        
        [_buyView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self).offset(-2);
            make.trailing.equalTo(self).offset(-2);
            make.width.mas_equalTo(65);
            make.height.mas_equalTo(25);
        }];
        [_discountPriceView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(_buyView).offset(3);
            make.leading.equalTo(self);
            make.trailing.equalTo(_buyView);
        }];

    }
    return self;
}

-(void)setGoods:(YJGoods *)goods{
    _goods = goods;
    _buyView.goods = goods;
    [_goodsImageView sd_setImageWithURL:[NSURL URLWithString:goods.img] placeholderImage:[UIImage imageNamed:@"v2_placeholder_square"]];
    _nameLabel.text = goods.name;
    //_specificsLabel.text = goods.specifics;
    _discountPriceView.goods = goods;
//    if ([goods.pm_desc isEqualToString:@"买一赠一"]) {
//        self.giveImageView.hidden = NO;
//    }else{
//        self.giveImageView.hidden = YES;
//    }
}

-(void)setMinusNeverShow:(BOOL)minusNeverShow{
    _buyView.minusNeverShow = YES;

}

-(void)cellTapgesture{
    if (self.callBack) {
        self.callBack(self.goods);
    }
}
@end
