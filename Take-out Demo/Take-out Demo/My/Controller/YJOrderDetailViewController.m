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
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YJMyGoodsCell *cell =[tableView dequeueReusableCellWithIdentifier:@"MyGoodsCell"];
    return cell;
}
@end
