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
#import "YJCategory.h"
#import "YJProducate.h"
@interface YJShoppingViewController ()<UITableViewDataSource,UITableViewDelegate>
{
	 NSMutableArray *_categories;
	
}
@property UITableView *sortTableView;
@property SuperMarketData *superMarketData;
@property YJProductsViewController *productsController;

@end

@implementation YJShoppingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//	[YJCategorySource loadCategoriesData:^(id data, NSError *error) {
//		//if (isNull(data) ) {
//			self.superMarketData = data;
//			self.categories = data;
//			[self.sortTableView reloadData];
//			[self.sortTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:YES];
//			
//		//}
//
//		
//	}];
//	[YJCategorySource loadProductData:^(id data, NSError *error) {
//		self.productsController.cateArray = data;
//	}];
	_categories = [[NSMutableArray alloc] initWithCapacity:1];
    [self buildSortTableView];
	[self loadData];
    [self buildProductsTableView];
	
    
}

-(void)buildSortTableView{
    self.sortTableView = ({
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.rowHeight = 40;
        tableView.showsVerticalScrollIndicator = NO;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableView.backgroundColor = [UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1.0];
        tableView;
    });
    [self.view addSubview:self.sortTableView];
    [self.sortTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view);
        make.leading.equalTo(self.view);
        make.bottom.equalTo(self.view);
        make.width.equalTo(self.view).multipliedBy(0.25);
    }];
}
-(void)buildProductsTableView{
    self.productsController = [YJProductsViewController new];
    [self addChildViewController:self.productsController];
    [self.view addSubview:self.productsController.view];
    self.delegate = self.productsController;
}
-(void)loadData{
    __weak typeof (self) weak = self;
    /*[YJCategorySource loadSupermarketData:^(id data, NSError *error) {
        weak.superMarketData = data;
        [weak.sortTableView reloadData];
        [weak.sortTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:YES];
        weak.productsController.superMarketData = data;
    }];
	*/
	[_categories removeAllObjects];
	BmobQuery *query = [BmobQuery queryWithClassName:@"Categories"];
	[query findObjectsInBackgroundWithBlock:^(NSArray *array, NSError *error) {
		for (BmobObject *obj in array) {
			YJCategory *model = [[YJCategory alloc] init];
			model._id = [obj objectForKey:@"id"];
			model.name = [obj objectForKey:@"name"];
			model.sort = [obj objectForKey:@"sort"];
			[_categories addObject:model];
		}
		[self.sortTableView reloadData];
		[weak.sortTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:YES];
		self.productsController.cateArray = _categories;
	}];

//	[YJCategorySource loadCategoriesData:^(id data, NSError *error) {
//		weak.superMarketData = data;
//		weak.categories = data;
//		[weak.sortTableView reloadData];
//		[weak.sortTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:YES];
//	}];
//	[YJCategorySource loadProductData:^(id data, NSError *error) {
//		weak.productsController.superMarketData = data;
//	}];
	
}
#pragma mark -- delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //return self.superMarketData.categories.count;
	return _categories.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    YJCategoryCell *cell = [YJCategoryCell cellWithTable:tableView];
	YJCategory *category = (YJCategory*)[_categories objectAtIndex:indexPath.row];
    //cell.categoryData = self.superMarketData.categories[indexPath.row];
	cell.titleLabel.text = category.name;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.delegate respondsToSelector:@selector(didTableView:clickIndexPath:)]) {
        [self.delegate didTableView:self.sortTableView clickIndexPath:indexPath];
    }
}

@end
