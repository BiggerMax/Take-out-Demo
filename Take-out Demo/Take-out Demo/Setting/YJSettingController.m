//
//  YJSettingController.m
//  Take-out Demo
//
//  Created by 袁杰 on 17/3/28.
//  Copyright © 2017年 袁杰. All rights reserved.
//

#import "YJSettingController.h"
#import "AppDelegate.h"
#import "YJDataManager.h"
@interface YJSettingController ()
@property UIView *logoutView;
@property NSArray *dataArray;
@property AppDelegate *delegate;
@property (strong, nonatomic) IBOutlet UILabel *phoneLabel;
@end
#define mainScreen [UIScreen mainScreen].bounds
@implementation YJSettingController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    self.automaticallyAdjustsScrollViewInsets = false;
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    self.navigationController.title = @"设置";
    self.navigationController.navigationBar.hidden = false;
    _logoutView = [[UIView alloc] initWithFrame:CGRectMake(0, mainScreen.size.height-50, mainScreen.size.width, 50)];
    _logoutView.backgroundColor = [COLOR parse:@"#FFD300"];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"退出登录" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(logout) forControlEvents:UIControlEventTouchUpInside];
    //button.backgroundColor = [COLOR parse:@"#FFD300"];
    
    button.frame = CGRectMake((mainScreen.size.width-100)/2, 0, 100, 50);
    [_logoutView addSubview:button];
    [[[UIApplication sharedApplication].delegate window] addSubview:[self logoutView]];
//    if (!self.delegate.isLogin) {
//        self.delegate.isLogin = YES;
//    }
    BOOL islogin = (BOOL)[CONFIG get:ISLOGIN];
    _logoutView.hidden = !islogin;
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = true;
    [_logoutView removeFromSuperview];
}
-(void)loadData{
    self.dataArray = [YJDataManager getData:login];
    BOOL isBool = isNull([CONFIG get:@"PHONE"]);
    NSString *phone = [NSString stringWithFormat:@"%@",[CONFIG get:@"PHONE"]];
    //
    self.phoneLabel.text = isBool?@"请登录":phone;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 5;
    }else{
        return 20;
    }
}
-(void)logout{
    [DIALOG confirm:@"是否退出登录" yesTitle:@"退出" noTitle:@"返回" callback:^(BOOL ok) {
        [self.navigationController popViewControllerAnimated:YES];
        [CONFIG set:@"PHONE" value:nil];
        [CONFIG set:ISLOGIN value:NO];
        [MESSAGE sendMessage:@"USERNAME" data:@{@"userName":@"注册或登录"}];
    }];
}
//-(UIView *)logoutView{
//    UIView *logoutView = [[UIView alloc] initWithFrame:CGRectMake(0, mainScreen.size.height-50, mainScreen.size.width, 50)];
//    logoutView.backgroundColor = [UIColor orangeColor];
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//    [button setTitle:@"退出登录" forState:UIControlStateNormal];
//    button.backgroundColor = [UIColor orangeColor];
//
//    button.frame = CGRectMake((mainScreen.size.width-100)/2, 0, 100, 50);
//    [logoutView addSubview:button];
//    return logoutView;
//}
@end
