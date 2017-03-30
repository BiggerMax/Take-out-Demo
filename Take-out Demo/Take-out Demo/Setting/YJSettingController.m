//
//  YJSettingController.m
//  Take-out Demo
//
//  Created by 袁杰 on 17/3/28.
//  Copyright © 2017年 袁杰. All rights reserved.
//

#import "YJSettingController.h"
#define mainScreen [UIScreen mainScreen].bounds

@interface YJSettingController ()
@property UIView *logoutView;
@end

@implementation YJSettingController

- (void)viewDidLoad {
    [super viewDidLoad];
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
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = true;
    [_logoutView removeFromSuperview];
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
