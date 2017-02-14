//
//  YJHomeViewController.m
//  Take-out Demo
//
//  Created by 袁杰 on 16/12/20.
//  Copyright © 2016年 袁杰. All rights reserved.
//

#import "YJHomeViewController.h"
#import "YJGoods.h"
#import "YJHomeHeadData.h"
#import "YJWebViewController.h"
#import "YJHomeCell.h"
#import "YJHomeCategoryCell.h"
#import "YJHomeHeadView.h"
@interface YJHomeViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property(nonatomic,strong)UICollectionView *collectionView;
@property(nonatomic,strong)YJHomeHeadData *homeHeadData;
@property(nonatomic,strong)YJHomeHeadView *homeHeadView;
@property(nonatomic,strong)NSArray<YJGoods *>*freshHots;
@end

@implementation YJHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
