//
//  YJModifyPswController.m
//  Take-out Demo
//
//  Created by 袁杰 on 2017/4/19.
//  Copyright © 2017年 袁杰. All rights reserved.
//

#import "YJModifyPswController.h"
#import "Cell2.h"

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
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"提交" style:UIBarButtonItemStylePlain target:self action:@selector(comfirm:)];
    
    self.navigationItem.title = @"修改密码";
    [self.tabBarController.tabBar setHidden:YES];
    //
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    self.tableView.separatorInset = UIEdgeInsetsMake(0, 20, 0, 20);
    self.tableView.rowHeight = 80.0f;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[Cell2 class] forCellReuseIdentifier:@"cellID"];
    [self.view addSubview:self.tableView];
    self.tableView.tableHeaderView = [self setHeaderView];
    [self.tableView reloadData];

}

#pragma mark --UITableView
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    Cell2 *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    switch (indexPath.row) {
        case 0:
        {
            cell.titileLabel.text = @"旧密码";
            if(!_textField1){
                _textField1 = [[UITextField alloc] initWithFrame:CGRectMake(20, 40, self.view.frame.size.width, 40)];
                self.textField1.keyboardType = UIKeyboardTypeASCIICapable;
                _textField1.secureTextEntry = YES;
                _textField1.font = [UIFont systemFontOfSize:16.0f];
                _textField1.placeholder = @"旧密码";
                [cell addSubview:_textField1];
            }
        }
        break;
        case 1:
        {
            cell.titileLabel.text = @"新密码";
            if(!_textField2){
                _textField2 = [[UITextField alloc] initWithFrame:CGRectMake(20, 40, self.view.frame.size.width, 40)];
                self.textField2.keyboardType = UIKeyboardTypeASCIICapable;
                _textField2.secureTextEntry = YES;
                _textField2.font = [UIFont systemFontOfSize:16.0f];
                _textField2.placeholder = @"新密码";
                [cell addSubview:_textField2];
            }
        }
            break;
        case 2:
        {
            cell.titileLabel.text = @"确认密码";
            if(!_textField3){
                _textField3 = [[UITextField alloc] initWithFrame:CGRectMake(20, 40, self.view.frame.size.width, 40)];
                _textField3.font = [UIFont systemFontOfSize:16.0f];
                _textField3.placeholder = @"确认密码";
                _textField3.secureTextEntry = YES;
                [cell addSubview:_textField3];
            }
        }
            break;
    }
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
-(void)comfirm:(UIBarButtonItem *)item{
    [CONFIG set:@"newPassword" value:self.textField3.text];
    if (self.textField1.text.length <=0) {
        [DIALOG alert:@"旧密码错误"];
        return;
    }

    if(self.textField2.text.length <= 0){
        [DIALOG alert:@"新密码不能为空"];
        return;
    }
    
    if (![self.textField3.text isEqualToString:self.textField2.text]) {
        [DIALOG alert:@"两次输入不一致"];
        return;
    }
    NSString *userName = [CONFIG get:@"USERNAME"];
    NSString *newPsw = self.textField2.text;
    BmobUser *user = [BmobUser currentUser];
    [user updateCurrentUserPasswordWithOldPassword:self.textField1.text newPassword:newPsw block:^(BOOL isSuccessful, NSError *error) {
        if (isSuccessful) {
            [BmobUser loginWithUsernameInBackground:userName password:newPsw block:^(BmobUser *user, NSError *error) {
                if (error) {
                    [DIALOG alert:@"修改失败"];
                    return ;
                } else if(user){
                    [DIALOG alert:@"修改成功" callback:^{
                        [self.navigationController popViewControllerAnimated:YES];
                    }];
                }
            }];
            
        }else {
            [DIALOG alert:@"修改失败，检查后重新输入"];
        }
    }];

}
@end
