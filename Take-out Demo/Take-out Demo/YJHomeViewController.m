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
#import "YJAnimationRefreshHeader.h"
#import "ApiBLL.h"
@interface YJHomeViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property(nonatomic,strong)UICollectionView *collectionView;
@property(nonatomic,strong)YJHomeHeadData *homeHeadData;
@property(nonatomic,strong)YJHomeHeadView *homeHeadView;
@property(nonatomic,strong)NSArray<YJGoods *>*freshHots;
@end

@implementation YJHomeViewController
static NSString *homeCell = @"homeCell";
static NSString *expandCell = @"expandCell";

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [[BaseTabBarViewController sharedController] hidesTabBar:NO animated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [NSThread sleepForTimeInterval:1];
    [self addNotification];
    [self buildCollectionView];
    [self buildTableHeadView];
    [self bulidTableViewRefresh];
}
-(void)addNotification{
    [YJNotification addObserver:self selector:@selector(homeTableHeadViewHeightDidChange:) name:HomeTableHeadViewHeightDidChange object:nil];
}
-(void)homeTableHeadViewHeightDidChange:(NSNotification *)notification{
    CGFloat height = [notification.object floatValue];
    CGFloat room = 10;
    self.collectionView.mj_header.ignoredScrollViewContentInsetTop = height+10;
    self.homeHeadView.frame = CGRectMake(0, -height-room, Width, height);
    self.collectionView.contentInset = UIEdgeInsetsMake(height+room, 0, 100, 0);
    self.collectionView.contentOffset = CGPointMake(0, -height-room);
}
-(void)buildTableHeadView{
    __weak typeof (self) weakSelf = self;
    [YJHomeHeadData loadHeadData:^(YJHomeHeadData *data, NSError *error) {
        weakSelf.homeHeadData = data;
        self.homeHeadView = [[YJHomeHeadView alloc] initWIthHeadData:data];
        self.homeHeadView.callback = ^(HeadViewItemType type,NSInteger tag){
            [weakSelf showActityDetail:type tag:tag];
        };
        [self.collectionView addSubview:self.homeHeadView];
    }];
    [GoodsData loadGoodData:^(NSArray<YJGoods *> *data, NSError *error) {
        weakSelf.freshHots = data;
        [self.collectionView reloadData];
    }];
}

-(void)bulidTableViewRefresh{
    YJAnimationRefreshHeader *header = [YJAnimationRefreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRefeshData)];
    header.gifView.frame = CGRectMake(0, 0, 100, 100);
    _collectionView.mj_header = header;
    [_collectionView.mj_header beginRefreshing];
}
-(void)headerRefeshData{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [_collectionView.mj_header endRefreshing];
    });
}
-(void)buildCollectionView{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumLineSpacing = 8;
    layout.minimumInteritemSpacing = 8;
    layout.sectionInset = UIEdgeInsetsMake(0, HomeCollectionViewCellMargin, 0, HomeCollectionViewCellMargin);
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    _collectionView.backgroundColor = [UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1];
    [_collectionView registerClass:[YJHomeCategoryCell class] forCellWithReuseIdentifier:homeCell];
    [_collectionView registerClass:[YJHomeCell class] forCellWithReuseIdentifier:expandCell];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [self.view addSubview:_collectionView];
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}
- (void)showActityDetail:(HeadViewItemType)type tag:(NSInteger)tag{
    ActInfo *actInfo = self.homeHeadData.act_info[type];
    YJActivity *cativity = actInfo.act_rows[tag].activity;
    [self.navigationController pushViewController:[[YJWebViewController alloc] initWithActivity:cativity] animated:YES];
}
#pragma mark -- CollectionView
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (section == 0) {
        return self.homeHeadData.category.act_rows.count;
    }else{
        return self.freshHots.count;
    }
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        YJHomeCategoryCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:homeCell forIndexPath:indexPath];
        __weak typeof(self) weakSelf = self;
        cell.callBack = ^(YJGoods *goods){
            UIViewController *goodsVc = [[UIViewController alloc] init];
            goodsVc.title = goods.name;
            goodsVc.view.backgroundColor = [UIColor whiteColor];
            goodsVc.hidesBottomBarWhenPushed = YES;
            [weakSelf.navigationController pushViewController:goodsVc animated:YES];
        };
        cell.cellInfo = self.homeHeadData.category.act_rows[indexPath.row];
        return cell;
    }else{
 
    YJHomeCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:expandCell forIndexPath:indexPath];
    YJGoods *goods = self.freshHots[indexPath.row];
    cell.goods = goods;
     return cell;
    }
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGSize itemSize = CGSizeZero;
    if (indexPath.section == 0) {
        itemSize = CGSizeMake(Width, 300);
    }else if (indexPath.section == 1){
        itemSize = CGSizeMake((Width - HomeCollectionViewCellMargin * 2) * 0.5 - 4, 260);
    }
    return itemSize;
}
@end
