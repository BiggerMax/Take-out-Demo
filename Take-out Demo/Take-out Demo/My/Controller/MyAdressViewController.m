//
//  MyAdressViewController.m
//  Take-out Demo
//
//  Created by 袁杰 on 17/4/8.
//  Copyright © 2017年 袁杰. All rights reserved.
//

#import "MyAdressViewController.h"
#import "AdressCell.h"
#import "YJUserInfo.h"
#import "AddAdressViewController.h"
#import "ModifyAddressViewController.h"
#import "YJDataManager.h"
#import "AdressModel.h"
#import "AdressData.h"
@interface MyAdressViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView *tableView;
@property(nonatomic,strong) NSMutableArray<Adress *> *address;
@property UIRefreshControl *refreshControl;

@end

@implementation MyAdressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	self.address = [NSMutableArray<Adress *> new];
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    self.navigationController.navigationBar.hidden = FALSE;
    [self buildNavigationItem];
	[self loadAddressData];
    [self buildAddressTableView];
	[self setUpRefresh];
    [self buildBottonView];
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = false;
}

- (void)buildNavigationItem {
    self.navigationItem.title = @"我的收货地址";
}
- (void)buildAddressTableView {
    UITableView *tableView = [[UITableView alloc]init];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.backgroundColor = [UIColor clearColor];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.rowHeight = 80;
    [self.view addSubview:tableView];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(10);
        make.leading.trailing.equalTo(self.view);
        make.bottom.equalTo(self.view).offset(-60);
    }];
    self.tableView = tableView;
}
-(void)loadAddressData
{
	[self.address removeAllObjects];
	//__weak typeof(self) weakSelf = self;
	__block NSArray *addArray = [NSArray new];
	BmobUser *user = [BmobUser currentUser];
	NSString *username = user.username;
	BmobQuery *query = [BmobQuery queryWithClassName:@"_User"];
	[query whereKey:@"username" equalTo:username];
	[query findObjectsInBackgroundWithBlock:^(NSArray *array, NSError *error) {
		for (BmobObject *obj in array) {
			addArray = [NSArray arrayWithArray:[obj objectForKey:@"addressArray"]];
			for (NSDictionary *dic in addArray) {
				Adress *model = [Adress new];
				model.accept_name = [dic objectForKey:@"name"];
				model.telphone = [dic objectForKey:@"phone"];
				model.address = [dic objectForKey:@"address"];
				[self.address addObject:model];
			}
			[self.tableView reloadData];
		}
	}];
	
}
- (void)buildBottonView {
    UIView *bottonView = [[UIView alloc]init];
    bottonView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bottonView];
    [bottonView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.bottom.equalTo(self.view);
        make.height.mas_equalTo(60);
    }];
    UIButton *button = [[UIButton alloc]init];
    button.backgroundColor = [UIColor colorWithRed:253/255.0 green:212/255.0 blue:49/255.0 alpha:1.0];
    button.titleLabel.font = [UIFont systemFontOfSize:15];
    [button setTitle:@"+ 新增地址" forState:UIControlStateNormal];
    button.layer.cornerRadius = 5;
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(addAddressButtonCliked) forControlEvents:UIControlEventTouchUpInside];
    button.layer.masksToBounds = YES;
    [bottonView addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bottonView).offset(12);
        make.width.equalTo(bottonView).multipliedBy(0.7);
        make.centerX.equalTo(bottonView);
        make.bottom.equalTo(bottonView).offset(-12);
    }];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.address.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    AdressCell *cell = [AdressCell cellWithTable:tableView indexPath:indexPath callback:^(NSInteger tag) {
		NSLog(@"%ld",(long)tag);
		ModifyAddressViewController *modifyVC = [STORYBOARD instantiateViewControllerWithIdentifier:@"ModifyAddressViewController"];
		modifyVC.adress = self.address[tag];
		[self.navigationController pushViewController:modifyVC animated:YES];
    }];
    cell.address = self.address[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
	[MESSAGE sendMessage:@"ADDRESS" data:@{@"address":self.address[indexPath.row]}];
	[self.navigationController popViewControllerAnimated:YES];
}
-(void)addAddressButtonCliked
{
    AddAdressViewController *addAdressVC = [STORYBOARD instantiateViewControllerWithIdentifier:@"AddAdressViewController"];
    [self.navigationController pushViewController:addAdressVC animated:YES];
}
-(void)setUpRefresh{
	self.refreshControl = [[UIRefreshControl alloc] init];
	[self.refreshControl addTarget:self action:@selector(refreshClick:) forControlEvents:UIControlEventValueChanged];
	[self.tableView addSubview:self.refreshControl];
	
	// [self.refreshControl beginRefreshing];
	// [self refreshClick:self.refreshControl];
}
- (void)refreshClick:(UIRefreshControl *)refreshControl {
	dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
		[self.refreshControl endRefreshing];
	});
	[self loadAddressData];
	
	
}
@end
