//
//  YJShoppingCell.m
//  Take-out Demo
//
//  Created by 袁杰 on 17/3/1.
//  Copyright © 2017年 袁杰. All rights reserved.
//

#import "YJShoppingCell.h"
#import <UIButton+WebCache.h>
#import "YJShopCarTool.h"
#import "YJBuyView.h"

@interface YJShoppingCell()
@property(nonatomic,strong) UIButton *selectedBtn;
@property(nonatomic,strong) UIImageView *shoppingIcon;
@property(nonatomic,strong) UILabel *siftLabel;
@property(nonatomic,strong) UILabel *shoppingName;
@property(nonatomic,strong) UILabel *moneyLabel;
@property(nonatomic,strong) YJBuyView *buyView;
@end
@implementation YJShoppingCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        _selectedBtn = [UIButton new];
        _selectedBtn.selected = YES;
        [_selectedBtn setImage:[UIImage imageNamed:@"v2_noselected"] forState:UIControlStateNormal];
        [_selectedBtn setImage:[UIImage imageNamed:@"v2_selected"] forState:UIControlStateSelected];
        [_selectedBtn addTarget:self action:@selector(shoppingSelectedClick:) forControlEvents:UIControlEventTouchUpInside];
        
        _shoppingIcon = [UIImageView new];
        _siftLabel = [UILabel new];
        _siftLabel.font = [UIFont systemFontOfSize:11];
        _siftLabel.layer.borderWidth = 1;
        _siftLabel.layer.borderColor = [UIColor redColor].CGColor;
        _siftLabel.textColor = [UIColor redColor];
        _siftLabel.layer.cornerRadius = 3;
        _siftLabel.layer.masksToBounds = YES;
        _siftLabel.textAlignment = NSTextAlignmentCenter;
        _siftLabel.text = @"精选";
        _siftLabel.hidden = YES;
        
        _shoppingName = [UILabel new];
        _shoppingName.font = [UIFont systemFontOfSize:15];
        _shoppingName.textAlignment = NSTextAlignmentLeft;
        
        _moneyLabel = [UILabel new];
        _moneyLabel.font = [UIFont systemFontOfSize:15];
        _moneyLabel.textAlignment = NSTextAlignmentLeft;
        _moneyLabel.textColor = [UIColor redColor];
        
        _buyView = [YJBuyView new];
        
        [self addSubview:_selectedBtn];
        [self addSubview:_siftLabel];
        [self addSubview:_shoppingName];
        [self addSubview:_shoppingIcon];
        [self addSubview:_moneyLabel];
        [self addSubview:_buyView];
        
        [_selectedBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.width.mas_equalTo(15);
            make.leading.equalTo(self).offset(10);
            make.centerY.equalTo(self);
        }];
        [_shoppingIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.width.mas_equalTo(50);
            make.leading.equalTo(_selectedBtn.mas_trailing).offset(5);
            make.centerY.equalTo(self);
        }];
        [_siftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(25);
            make.height.mas_equalTo(15);
            make.top.equalTo(_shoppingIcon);
            make.leading.equalTo(_shoppingIcon.mas_trailing).offset(5);
        }];
        [_shoppingName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(_siftLabel.mas_trailing);
            make.trailing.equalTo(self);
            make.height.mas_equalTo(15);
            make.top.equalTo(_shoppingIcon);
        }];
        [_moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(_siftLabel);
            make.width.mas_equalTo(80);
            make.bottom.equalTo(_shoppingIcon.mas_bottom);
            make.height.mas_equalTo(15);
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
-(void)shoppingSelectedClick:(UIButton *)btn{
    if (btn.selected) {
        btn.selected = NO;
        [[YJShopCarTool sharedInstance]removeFromProductShopCar:self.goods];
        [[NSNotificationCenter defaultCenter] postNotificationName:LFBShopCarBuyNumberDidChangeNotification object:nil];
    }else{
        btn.selected = YES;
        [[YJShopCarTool sharedInstance]addSupermarkProductToShopCar:self.goods];
        [[NSNotificationCenter defaultCenter] postNotificationName:LFBShopCarBuyNumberDidChangeNotification object:nil];
    }
}

-(void)setGoods:(YJGoods *)goods{
    _goods = goods;
    if (self.goods.is_xf) {
        _siftLabel.hidden = NO;
    }else{
        _siftLabel.hidden = YES;
        [_shoppingName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(_shoppingIcon.mas_trailing);
        }];
    }
    _buyView.goods = goods;
    _moneyLabel.text = [NSString stringWithFormat:@"￥%@",goods.price];
    [_shoppingIcon sd_setImageWithURL:[NSURL URLWithString:goods.img] placeholderImage:[UIImage imageNamed: @"v2_placeholder_half_size"]];
    _shoppingName.text = goods.name;
}
@end
