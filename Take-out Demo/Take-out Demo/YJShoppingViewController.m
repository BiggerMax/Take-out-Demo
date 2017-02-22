//
//  YJShoppingViewController.m
//  Take-out Demo
//
//  Created by 袁杰 on 16/12/20.
//  Copyright © 2016年 袁杰. All rights reserved.
//

#import "YJShoppingViewController.h"
#import "YJCategorySource.h"
#import "YJCategoryCell.h"
#import "YJProductsViewController.h"
@interface YJShoppingViewController ()<UITableViewDataSource,UITableViewDelegate>
@property UITableView *sortTableView;
@property SuperMarketData *superMarketData;
@property YJProductsViewController *productsController;
@end

@implementation YJShoppingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self buildSortTableView];
}

-(void)buildSortTableView{
    self.sortTableView = ({
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.rowHeight = 40;
        tableView.showsVerticalScrollIndicator = NO;
        tableView.backgroundColor = [UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1.0];
        tableView;
    });
    [self.view addSubview:self.sortTableView];
    [self.sortTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view);
        make.leading.equalTo(self.view);
        make.bottom.equalTo(self.view);
        make.height.equalTo(self.view).multipliedBy(0.25);
    }];
}
-(void)buildProductsTableView{
    self
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.superMarketData.categories.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    YJCategoryCell *cell = [YJCategoryCell cellWithTable:tableView];
    cell.categoryData = self.superMarketData.categories[indexPath.row];
    return cell;
}
-(NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.delegate ]) {
        <#statements#>
    }
}

@end
