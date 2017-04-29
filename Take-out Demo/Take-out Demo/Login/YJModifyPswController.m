//
//  YJModifyPswController.m
//  Take-out Demo
//
//  Created by 袁杰 on 2017/4/19.
//  Copyright © 2017年 袁杰. All rights reserved.
//

#import "YJModifyPswController.h"

@interface YJModifyPswController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>

@property(nonatomic,strong)UITableView *tableView;
@property UITextField *textField1;
@property UITextField *textField2;
@property UITextField *textField3;
@end

@implementation YJModifyPswController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    self.navigationController.title = @"设置";
    self.navigationController.navigationBar.hidden = false;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"提交" style:UIBarButtonItemStylePlain target:self action:@selector(commit)];
    
    self.navigationItem.title = NSLocalizedString(@"changepsw", nil);
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"submit"] style:UIBarButtonItemStylePlain target:self action:@selector(comfirm:)];
    self.navigationItem.rightBarButtonItem = rightBtn;
    [self.tabBarController.tabBar setHidden:YES];
    //
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    self.tableView.separatorInset = UIEdgeInsetsMake(0, 20, 0, 20);
    self.tableView.rowHeight = 80.0f;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellID"];
    [self.view addSubview:self.tableView];
    self.tableView.tableHeaderView = [self setHeaderView];
    [self.tableView reloadData];

}

#pragma mark --UITableView
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
//    switch (indexPath.row) {
//        case 0:
//        {
//            cell.titileLabel.text = NSLocalizedString(@"currentpsw", nil);
//            if(!_textField1){
//                _textField1 = [[UITextField alloc] initWithFrame:CGRectMake(20, 40, self.view.frame.size.width, 40)];
//                self.textField1.keyboardType = UIKeyboardTypeASCIICapable;
//                _textField1.secureTextEntry = YES;
//                _textField1.font = [UIFont systemFontOfSize:16.0f];
//                _textField1.placeholder = NSLocalizedString(@"currentpsw", nil);
//                [cell addSubview:_textField1];
//            }
//        }
//            break;
//        case 1:
//        {
//            cell.titileLabel.text = NSLocalizedString(@"newpsw", nil);
//            if(!_textField2){
//                _textField2 = [[UITextField alloc] initWithFrame:CGRectMake(20, 40, self.view.frame.size.width, 40)];
//                _textField2.font = [UIFont systemFontOfSize:16.0f];
//                _textField2.placeholder = NSLocalizedString(@"newpsw", nil);
//                _textField2.secureTextEntry = YES;
//                [cell addSubview:_textField2];
//            }
//        }
//            break;
//        case 2:
//        {
//            cell.titileLabel.text = NSLocalizedString(@"confirmpsw", nil);
//            if(!_textField3){
//                _textField3 = [[UITextField alloc] initWithFrame:CGRectMake(20, 40, self.view.frame.size.width, 40)];
//                _textField3.font = [UIFont systemFontOfSize:16.0f];
//                _textField3.placeholder = NSLocalizedString(@"confirmpsw", nil);
//                _textField3.secureTextEntry = YES;
//                [cell addSubview:_textField3];
//            }
//        }
//    }
    return cell;
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = false;
}
-(UIView *)setHeaderView{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 20)];
    return headerView;
}
@end
