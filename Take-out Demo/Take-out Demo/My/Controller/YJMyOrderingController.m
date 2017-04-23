//
//  YJMyOrderingController.m
//  Take-out Demo
//
//  Created by 袁杰 on 17/4/4.
//  Copyright © 2017年 袁杰. All rights reserved.
//

#import "YJMyOrderingController.h"
#import "MyOrderTableViewCell.h"
#import "OrderData.h"
#import "YJOrderDetailViewController.h"
@interface YJMyOrderingController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) UITableView *tableView;

@end

@implementation YJMyOrderingController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigation];
    [self layoutTableView];
    [self loadOrderData];
    
}
-(void)setNavigation
{
    self.automaticallyAdjustsScrollViewInsets = false;
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    self.navigationController.navigationBar.hidden = FALSE;
}
-(void)layoutTableView
{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.rowHeight = 127;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[MyOrderTableViewCell class] forCellReuseIdentifier:@"orderCell"];
    [self.view addSubview:self.tableView];
    
}
-(void)loadOrderData
{
    __weak typeof (self) weakSelf = self;
    [OrderData loadOrderData:^(id data, NSError *error)
    {
        weakSelf.oderData = data;
        [weakSelf.tableView reloadData];
    }];
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = TRUE;
}
#pragma mark -- UITableView
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.oderData.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyOrderTableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"MyOrderTableViewCell" owner:nil options:nil] lastObject];
    cell.selectionStyle = UITableViewCellSelectionStyleBlue;
    cell.order = self.oderData[indexPath.row];
    return cell;
}
-(NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    YJOrderDetailViewController *orderDetailVC = [STORYBOARD instantiateViewControllerWithIdentifier:@"YJOrderDetailViewController"];
    orderDetailVC.orderData.order_goods = self.oderData[indexPath.row];
    [self.navigationController pushViewController:orderDetailVC animated:YES];
    
    return indexPath;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
@end
