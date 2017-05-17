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
    [self loadTableView];
}
-(void)setNavigationBar
{
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    self.navigationController.title = self.orderData.order_no;
    self.navigationController.navigationBar.hidden = false;
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
		return 2;
	}else{
		return 3;
	}
	
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YJMyGoodsCell *cell =[tableView dequeueReusableCellWithIdentifier:@"MyGoodsCell"];
	if (indexPath.section == 0) {
		switch (indexPath.row) {
			case 0:
			{
				cell.goodsName.text = @"油炸小丸子";
				cell.goodsCount.text = @"×1";
				cell.goodsPrice.text = @"￥10";
			}
				break;
			case 1:
			{
				cell.goodsName.text = @"牛肉面";
				cell.goodsCount.text = @"×1";
				cell.goodsPrice.text = @"￥15";
			}
			default:
				break;
		}
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
				cell.goodsName.text = @"总价";
				cell.goodsPrice.text = @"￥25";
			}
			default:
    break;
		}
			}
	    return cell;
}
@end
