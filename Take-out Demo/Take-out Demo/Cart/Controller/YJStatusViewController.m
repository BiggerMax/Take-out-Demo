//
//  YJStatusViewController.m
//  Take-out Demo
//
//  Created by 袁杰 on 2017/4/22.
//  Copyright © 2017年 袁杰. All rights reserved.
//

#import "YJStatusViewController.h"
#import "StatusCell.h"

@interface YJStatusViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@end

@implementation YJStatusViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationBar];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.delegate =self;
    self.tableView.dataSource = self;
    [self.tableView registerNib:[UINib nibWithNibName:@"StatusCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"statusCell"];
    self.tableView.rowHeight = 63;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
}
-(void)setNavigationBar
{
    self.navigationItem.title = @"订单状态";
	self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"关闭" style:UIBarButtonItemStyleDone target:self action:@selector(close:)];
}
-(void)close:(UIBarButtonItem *)btn{
	[self dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark --UITableView
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    StatusCell *cell = [tableView dequeueReusableCellWithIdentifier:@"statusCell" forIndexPath:indexPath];
    switch (indexPath.row) {
        case 0:
        {
            cell.timeLabel.text = @"16:38";
            cell.statusLabel.text = @"已完成";
            cell.topLine.hidden = YES;
            [cell.selectedBtn setImage:[UIImage imageNamed:@"order_grayMark"] forState:UIControlStateNormal];
        }
            break;
        case 1:
        {
            cell.timeLabel.text = @"16:19";
            cell.statusLabel.text = @"已发货";
            [cell.selectedBtn setImage:[UIImage imageNamed:@"order_grayMark"] forState:UIControlStateNormal];
        }
            break;
        case 2:
        {
            cell.timeLabel.text = @"15:38";
            cell.statusLabel.text = @"待发货";
            [cell.selectedBtn setImage:[UIImage imageNamed:@"order_grayMark"] forState:UIControlStateNormal];
        }
            break;
        case 3:
        {
            cell.timeLabel.text = @"15:38";
            cell.statusLabel.text = @"支付成功";
            [cell.selectedBtn setImage:[UIImage imageNamed:@"order_grayMark"] forState:UIControlStateNormal];
        }
            break;
        case 4:
        {
            cell.timeLabel.text = @"15:37";
            cell.statusLabel.text = @"订单提交成功";
            cell.bottomLine.hidden = YES;
            [cell.selectedBtn setImage:[UIImage imageNamed:@"order_yellowMark"] forState:UIControlStateNormal];
        }
            break;
        default:
            break;
    }
    
    return cell;
}
@end
