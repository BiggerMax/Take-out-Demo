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
#import "YJAddressView.h"
#import "YJLightingView.h"
#import "YJShoppingCell.h"
@interface YJCartViewController ()<UITableViewDelegate,UITableViewDataSource,YJTableFootViewDelegate>
@property UITableView *tableView;
@property YJDefaultView *defaultView;
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
    [self buildTableView];
    [self buildDefaultView];
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
-(void)buildTableView{
    self.tableView = ({
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.rowHeight = 80;
        tableView.backgroundColor = [UIColor clearColor];
        tableView;
    });
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    [self buildTableHeadView];
    [self buildTableFootView];
}
-(void)buildTableHeadView{
    self.headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Width, 100)];
    YJAddressView *address = [[YJAddressView alloc] initWithFrame:CGRectMake(0, 10, Width, 50)];
    YJLightingView *lightning = [[YJLightingView alloc] initWithFrame:CGRectMake(0, 70, Width, 30)];
    [self.headView addSubview:address];
    [self.headView addSubview:lightning];
    self.tableView.tableHeaderView = self.headView;
}
-(void)buildTableFootView{
    _footView = [[YJTableFootView alloc] initWithFrame:CGRectMake(0, 0, Width, 50)];
    _footView.delegate = self;
    self.tableView.tableFooterView = _footView;
}
-(void)buildDefaultView{
    _defaultView = [[YJDefaultView alloc] init];
    _defaultView.hidden = YES;
    [self.view addSubview:_defaultView];
    [_defaultView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.width.equalTo(self.view);
        make.height.mas_equalTo(170);
    }];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if ([[YJUserShopCarTool sharedInstance] isEmpty]) {
        self.defaultView.hidden = NO;
        self.tableView.hidden = YES;
    }else{
        self.defaultView.hidden = YES;
        self.tableView.hidden = NO;
        __weak typeof (self) weakSelf = self;
        [SVProgressHUD showWithStatus:@"加载中"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            weakSelf.dataList = [YJUserShopCarTool sharedInstance].shopCar;
            weakSelf.footView.sumMoney = [[YJUserShopCarTool sharedInstance]getShopCarGoodsPrice];
            [weakSelf.tableView reloadData];
            [SVProgressHUD dismiss];
        });
    }
}

#pragma mark -- Delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataList.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"ID";
    YJShoppingCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[YJShoppingCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.goods = self.dataList[indexPath.row];
    return cell;
}
-(void)didTableFootViewCommit{
    UIViewController *moneyVC = [UIViewController new];
    moneyVC.view.backgroundColor = [UIColor whiteColor];
    moneyVC.title = [NSString stringWithFormat:@"%.2lf",[[YJUserShopCarTool sharedInstance] getShopCarGoodsPrice]];
    [self.navigationController pushViewController:moneyVC animated:YES];
}
@end
