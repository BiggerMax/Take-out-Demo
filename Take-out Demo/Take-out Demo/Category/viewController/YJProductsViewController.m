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
@interface YJProductsViewController ()<UITableViewDelegate,UITableViewDataSource>
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
    self.view = [[UIView alloc] initWithFrame:CGRectMake(Width * 0.25, 0, Width * 0.75, Height)];
    [self builtTableView];
}
-(void)builtTableView{
    
}


@end
