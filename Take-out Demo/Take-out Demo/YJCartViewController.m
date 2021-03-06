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
#import "YJShopCarTool.h"
#import "YJAddressView.h"
#import "YJLightingView.h"
#import "YJShoppingCell.h"
#import "YJPayView.h"
#import "MyAdressViewController.h"
#import "OneKit.h"
#import "YJStatusViewController.h"
#import "YJLoginViewController.h"
@interface YJCartViewController ()<UITableViewDelegate,UITableViewDataSource,YJTableFootViewDelegate>
@property UITableView *tableView;
@property YJDefaultView *defaultView;
@property YJAddressView *address;
@property NSArray *dataList;
@property UIView *headView;
@property (nonatomic,strong) YJTableFootView *footView;
@property Adress *selectAddress;
@end

@implementation YJCartViewController

-(void)dealloc{
	[YJNotification removeObserver:self];
}
- (void)viewDidLoad {
	[super viewDidLoad];
	self.selectAddress = [Adress new];
	self.title = @"购物车";
	self.view.backgroundColor = [UIColor colorWithRed:0.94 green:0.94 blue:0.94 alpha:1.00];
	[self buildNotification];
	[self buildTableView];
	[self buildDefaultView];
}
-(void)buildNotification{
	[YJNotification addObserver:self selector:@selector(IncreaseShoppingCart) name:LFBShopCarBuyNumberDidChangeNotification object:nil];
	[YJNotification addObserver:self selector:@selector(didRemoveGoods) name:LFBShopCarDidRemoveProductNSNotification object:nil];
}
-(void)IncreaseShoppingCart{
	self.footView.sumMoney = [[YJShopCarTool sharedInstance] getShopCarGoodsPrice];
}
-(void)didRemoveGoods{
	self.footView.sumMoney = [[YJShopCarTool sharedInstance] getShopCarGoodsPrice];
}
-(void)buildTableView{
	self.tableView = ({
		UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
		tableView.backgroundColor = [UIColor whiteColor];
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
	self.address = [[YJAddressView alloc] initWithFrame:CGRectMake(0, 10, Width, 50)];
	UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(chooseAdress:)];
	[self.address addGestureRecognizer:tap];
	YJLightingView *lightning = [[YJLightingView alloc] initWithFrame:CGRectMake(0, 70, Width, 30)];
	//YJPayView *payView = [[YJPayView alloc] initWithFrame:CGRectMake(0, 70, Width, 30)];
	//payView.backgroundColor = [UIColor yellowColor];
	[self.headView addSubview:self.address];
	
	//[self.headView addSubview:payView];
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
	if ([[YJShopCarTool sharedInstance] isEmpty]) {
		self.defaultView.hidden = NO;
		self.tableView.hidden = YES;
	}else{
		BmobUser *user = [BmobUser currentUser];
		if (user) {
			self.defaultView.hidden = YES;
			self.tableView.hidden = NO;
			__weak typeof (self) weakSelf = self;
			[SVProgressHUD showWithStatus:@"加载中"];
			dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
				
				NSString *username = user.username;
				BmobQuery *query = [BmobQuery queryWithClassName:@"_User"];
				[query whereKey:@"username" equalTo:username];
				[query findObjectsInBackgroundWithBlock:^(NSArray *array, NSError *error) {
					for (BmobUser *user in array) {
						Adress *model = [Adress new];
						model.accept_name = [user objectForKey:@"accpet_name"];
						model.telphone = user.mobilePhoneNumber;
						model.address = [user objectForKey:@"address"];
						self.address.defaultAdress = model;
						self.selectAddress = model;
					}
					[MESSAGE receiveMessage:@"ADDRESS" callback:^(NSDictionary *data) {
						if (data) {
							Adress *address = [Adress new];
							address = [data objectForKey:@"address"];
							dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
								self.address.defaultAdress = address;
								self.selectAddress = address;
							});
							
						}
					}];
					
				}];
				
				weakSelf.dataList = [YJShopCarTool sharedInstance].shopCar;
				weakSelf.footView.sumMoney = [[YJShopCarTool sharedInstance]getShopCarGoodsPrice];
				[weakSelf.tableView reloadData];
				[SVProgressHUD dismiss];
			});
			
		}else{
			UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
			YJLoginViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"YJLoginViewController"];
			UINavigationController *navigatinCotroller = [[UINavigationController alloc] initWithRootViewController:loginViewController];
			loginViewController.hidesBottomBarWhenPushed = YES;
			[self presentViewController:navigatinCotroller animated:YES completion:nil];
			
			
		}
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
	[DIALOG confirm:@"确认支付?" yesTitle:@"确认" noTitle:@"取消" callback:^(BOOL ok) {
		if (ok) {
			BmobUser *user = [BmobUser currentUser];
			BmobObject *object = [BmobObject objectWithClassName:@"Orders"];
			[object setObject:self.selectAddress.accept_name forKey:@"truename"];
			[object setObject:user.username forKey:@"uname"];
			NSMutableArray<NSDictionary *> *list = [NSMutableArray<NSDictionary *> new];
			for (YJGoods *goods in self.dataList) {
				[list addObject:@{@"pid":goods.gid,@"pname":goods.name,@"price":goods.price,@"num":[NSString stringWithFormat:@"%ld",(long)goods.userByNumber]}];
			}
			[object setObject:@"已付款" forKey:@"state"];
			[object setObject:list forKey:@"list"];
			[object setObject:@([self.selectAddress.telphone integerValue]) forKey:@"phone"];
			[object setObject:self.selectAddress.address forKey:@"address"];
			[object setObject:[NSNumber numberWithFloat:self.footView.sumMoney] forKey:@"total_price"];
			[object saveInBackgroundWithResultBlock:^(BOOL isSuccessful, NSError *error) {
				if (isSuccessful) {
					NSLog(@"%@",object);
					[[[YJShopCarTool sharedInstance] shopCar]removeAllObjects];
					YJStatusViewController *statusVC = [YJStatusViewController new];
					statusVC.view.backgroundColor = [UIColor whiteColor];
					[statusVC setHidesBottomBarWhenPushed:YES];
					[self.navigationController pushViewController:statusVC animated:YES];
					
				} else if (error){
					NSLog(@"%@",error);
				} else {
					NSLog(@"Unknow error");
				}
			}];
			
		}
	}];
}
-(void)chooseAdress:(UITapGestureRecognizer *)tapGes{
	MyAdressViewController *myAdresVC = [MyAdressViewController new];
	[myAdresVC setHidesBottomBarWhenPushed:YES];
	[self.navigationController pushViewController:myAdresVC animated:YES];
}
@end
