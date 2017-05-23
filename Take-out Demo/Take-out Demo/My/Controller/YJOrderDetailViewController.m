//
//  YJOrderDetailViewController.m
//  Take-out Demo
//
//  Created by 袁杰 on 2017/4/16.
//  Copyright © 2017年 袁杰. All rights reserved.
//

#import "YJOrderDetailViewController.h"
#import "YJMyGoodsCell.h"
@interface YJOrderDetailViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UILabel *receiverName;
@property (strong, nonatomic) IBOutlet UILabel *receiverAddress;
@property (strong, nonatomic) IBOutlet UILabel *order_no;
@property (strong, nonatomic) IBOutlet UILabel *creat_time;
@property (strong, nonatomic) IBOutlet UILabel *comment;
@property (strong, nonatomic) IBOutlet UIButton *deleteBtn;

@end

@implementation YJOrderDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationBar];
	[self loadHeaderView];
    [self loadTableView];
}
-(void)setNavigationBar
{
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    self.navigationController.title = self.orderData.order_no;
    self.navigationController.navigationBar.hidden = false;
}
-(void)loadHeaderView
{
	self.receiverName.text = self.orderData.accept_name;
	self.order_no.text = self.orderData.order_no;
	self.creat_time.text = self.orderData.create_time;
	self.receiverAddress.text = self.orderData.address;
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = false;
}
-(void)loadTableView{
    [self.tableView registerNib:[UINib nibWithNibName:@"YJMyGoodsCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"MyGoodsCell"];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

#pragma mark -- UITableView
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	if (section == 0) {
		return self.orderData.order_goods.count;
	}else{
		return 3;
	}
	
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YJMyGoodsCell *cell =[tableView dequeueReusableCellWithIdentifier:@"MyGoodsCell"];
	if (indexPath.section == 0) {
				cell.goodsName.text = [self.orderData.order_goods[indexPath.row] objectForKey:@"pname"];
		NSString *nums = [NSString stringWithFormat:@"×%@",[self.orderData.order_goods[indexPath.row] objectForKey:@"num"]];
		cell.goodsCount.text = nums;
		NSString *price = [self.orderData.order_goods[indexPath.row] objectForKey:@"price"];
//		cell.goodsPrice.text = [NSString stringWithFormat:@"%ld",([price integerValue]*[nums intValue])];
		cell.goodsPrice.text = [NSString stringWithFormat:@"¥%@",price];
		}else{
		switch (indexPath.row) {
			case 0:
			{
				cell.goodsName.text = @"配送费";
				cell.goodsPrice.text = @"￥0";

			}
    break;
			case 1:
			{
				cell.goodsName.text = @"服务费";
				cell.goodsPrice.text = @"￥0";
			}
				break;
			case 2:
			{
				cell.goodsName.text = @"¥总价";
				cell.goodsPrice.text = self.orderData.user_pay_amount;
			}
			default:
    break;
		}
			}
	    return cell;
}
@end
