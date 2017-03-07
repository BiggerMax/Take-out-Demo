//
//  YJCartViewController.m
//  Take-out Demo
//
//  Created by 袁杰 on 16/12/20.
//  Copyright © 2016年 袁杰. All rights reserved.
//

#import "YJCartViewController.h"
#import "YJDefaultView.h"
#import "YJTableFootView.h"
#import "YJUserShopCarTool.h"

@interface YJCartViewController ()
@property UITableView *view;
@property NSArray *dataList;
@property UIView *headView;
@property (nonatomic,strong) YJTableFootView *footView;
@end

@implementation YJCartViewController

-(void)dealloc{
    [YJNotification removeObserver:self];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"购物车";
    [self buildNotification];
}
-(void)buildNotification{
    [YJNotification addObserver:self selector:@selector(IncreaseShoppingCart) name:LFBShopCarBuyNumberDidChangeNotification object:nil];
    [YJNotification addObserver:self selector:@selector(didRemoveGoods) name:LFBShopCarDidRemoveProductNSNotification object:nil];
}
-(void)IncreaseShoppingCart{
    self.footView.sumMoney = [[YJUserShopCarTool sharedInstance] getShopCarGoodsPrice];
}
-(void)didRemoveGoods{
    self.footView.sumMoney = [[YJUserShopCarTool sharedInstance] getShopCarGoodsPrice];
}

@end
