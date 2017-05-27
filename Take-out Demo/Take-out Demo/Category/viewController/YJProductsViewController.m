//
//  YJProductsViewController.m
//  Take-out Demo
//
//  Created by 袁杰 on 17/2/22.
//  Copyright © 2017年 袁杰. All rights reserved.
//

#import "YJProductsViewController.h"
#import "YJGoods.h"
#import "YJGoodsCell.h"
#import "YJAnimationRefreshHeader.h"
#import "YJProducate.h"
@interface YJProductsViewController ()<UITableViewDelegate,UITableViewDataSource>
{
	NSMutableArray *_productArray;
}
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSArray *dataList;
@property(nonatomic,strong)UIImageView *tableFooterView;
@end

@implementation YJProductsViewController

-(UIImageView *)tableFooterView{
    if (!_tableFooterView) {
        _tableFooterView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"v2_common_footer"]];
        _tableFooterView.frame = CGRectMake(0, 0, Width*0.75, 70);
        _tableFooterView.contentMode = UIViewContentModeCenter;
    }
    return _tableFooterView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //
	[self loadData];
    self.view = [[UIView alloc] initWithFrame:CGRectMake(Width * 0.25, 0, Width * 0.75, Height)];
    [self builtTableView];

}
-(void)loadData
{
	_productArray = [NSMutableArray new];
	BmobQuery *productQuery = [BmobQuery queryWithClassName:@"Products"];
	[productQuery orderByAscending:@"sort"];
	[productQuery findObjectsInBackgroundWithBlock:^(NSArray *array, NSError *error) {
		for (BmobObject *obj  in array) {
			YJProducate *model = [[YJProducate alloc] init];
			model.pid = [obj objectForKey:@"pid"];
			model.pname = [obj objectForKey:@"pname"];
			model.sort = [obj objectForKey:@"sort"];
			model.store_nums = [obj objectForKey:@"store_nums"];
			model.spercifics = [obj objectForKey:@"spercifics"];
			model.store_nums = [obj objectForKey:@"store_nums"];
			model.price = [obj objectForKey:@"price"];
			model.img = [obj objectForKey:@"img"];
			[_productArray addObject:model];
		}
		NSLog(@"%@",_productArray);
		[self.tableView reloadData];
	}];
}
-(void)builtTableView{
    _tableView = [UITableView new];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.showsVerticalScrollIndicator = NO;
    _tableView.contentInset = UIEdgeInsetsMake(0, 0, 120, 0);
    _tableView.tableFooterView = _tableFooterView;
    [self.view addSubview:_tableView];
    
    //
    YJAnimationRefreshHeader *header = [YJAnimationRefreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRefreshData)];
    _tableView.mj_header = header;
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

-(void)headerRefreshData{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [_tableView.mj_header endRefreshing];
    });
}


#pragma mark -- tableView
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.superMarketData.categories.count;
	//return _cateArray.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.superMarketData.categories[section].products.count;
	
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    YJGoodsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[YJGoodsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.goods = self.superMarketData.categories[indexPath.section].products[indexPath.row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 85;
}
-(void)didTableView:(UITableView *)tableView clickIndexPath:(NSIndexPath *)indexPath{
    [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:indexPath.row] animated:YES scrollPosition:UITableViewScrollPositionTop];
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
}
@end
