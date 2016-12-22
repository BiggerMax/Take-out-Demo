//
//  YJBuyView.m
//  Take-out Demo
//
//  Created by 袁杰 on 16/12/22.
//  Copyright © 2016年 袁杰. All rights reserved.
//

#import "YJBuyView.h"
#import "YJShopCarTool.h"
#import "YJProgressHUDManager.h"

@interface YJBuyView ()
@property(nonatomic,strong)UIButton *addBtn;
@property(nonatomic,strong)UIButton *cutBtn;
@property(nonatomic,strong)UILabel *countLabel;
@property(nonatomic,strong)UILabel *OOSLabel;
@property(nonatomic,assign)NSInteger goodsIndex;
@end
@implementation YJBuyView

-(instancetype)init{
    self = [super init];
    if (!self) {
        return nil;
    }
    _addBtn = [[UIButton alloc]init];
    [_addBtn setImage:[UIImage imageNamed:@"v2_increase"] forState:UIControlStateNormal];
    [_addBtn addTarget:self action:@selector(addButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_addBtn];
    
    _cutBtn = [[UIButton alloc]init];
    [_cutBtn setImage:[UIImage imageNamed:@"v2_reduce"] forState:UIControlStateNormal];
    [_cutBtn addTarget:self action:@selector(cutButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_cutBtn];
    
    _countLabel = [[UILabel alloc]init];
    _countLabel.text = @"0";
    _countLabel.font = [UIFont systemFontOfSize:14];
    _countLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_countLabel];
    
    [_cutBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self);
        make.top.equalTo(self);
        make.bottom.equalTo(self);
        make.width.mas_equalTo(self.mas_height);
    }];
    [_countLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(_cutBtn.mas_trailing).offset(3);
        make.top.equalTo(self);
        make.bottom.equalTo(self);
        make.trailing.equalTo(_addBtn.mas_leading).offset(-2);
    }];
    [_addBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(self);
        make.top.equalTo(self);
        make.bottom.equalTo(self);
        make.width.mas_equalTo(self.mas_height);
    }];
    [_OOSLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    return self;
}

-(void)setGoodsIndex:(NSInteger)goodsIndex{
    _goodsIndex = goodsIndex;
    if (self.minusNeverShow) {
        self.cutBtn.hidden = YES;
        self.countLabel.hidden = YES;
    }else{
            self.countLabel.text = [NSString stringWithFormat:@"%ld",goodsIndex];
            self.cutBtn.hidden = NO;
            self.countLabel.hidden = NO;
        }
}

-(void)setGoods:(YJGoods *)goods{
    _goods = goods;
    if (goods.number <= 0) {
        [self supplementLabelShow:YES];
    }else{
        [self supplementLabelShow:NO];
    }
    self.goodsIndex = goods.userByNumber;
}

//补货Label
-(void)supplementLabelShow:(BOOL)is{
    if (is) {
        self.OOSLabel.hidden = NO;
        self.countLabel.hidden = YES;
        self.addBtn.hidden = YES;
        self.cutBtn.hidden = YES;
    }else{
        self.OOSLabel.hidden = YES;
        self.countLabel.hidden = NO;
        self.addBtn.hidden = NO;
        self.cutBtn.hidden = NO;
    }
}

//增加点击的商品数量
-(void)addButtonClick:(UIButton *)btn{
    if (self.goodsIndex >= self.goods.number) {
        [[NSNotificationCenter defaultCenter] postNotificationName:HomeGoodsInventoryProblem object:self.goods.name];
        NSString *statuStr = [NSString stringWithFormat:@"%@ 库存不足了 先买这么多，过段时间再来看看吧~",self.goods.name];
        [YJProgressHUDManager showImage:[UIImage imageNamed:@"v2_orderSuccess"] status:statuStr];
        return;
    }
    self.goodsIndex++;
    self.goods.userByNumber = self.goodsIndex;
    self.countLabel.text = [NSString stringWithFormat:@"%ld",self.goodsIndex];
    [[YJShopCarTool sharedInstance] addSupermarkProductToShopCar:self.goods];
    [[NSNotificationCenter defaultCenter] postNotificationName:LFBShopCarBuyNumberDidChangeNotification object:nil];
}

//点击减少商品数量
-(void)cutButtonClick:(UIButton *)btn{
    if (self.goodsIndex <= 0) {
        return;
    }
    self.goodsIndex--;
    self.goods.userByNumber = self.goodsIndex;
    if (self.goodsIndex == 0) {
        [[YJShopCarTool sharedInstance] removeFromProductShopCar:self.goods];
    }else{
        self.countLabel.text = [NSString stringWithFormat:@"%ld",self.goodsIndex];
    }
    [[NSNotificationCenter defaultCenter] postNotificationName:LFBShopCarBuyNumberDidChangeNotification object:nil];
}
@end
