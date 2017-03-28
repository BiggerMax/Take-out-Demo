//
//  YJSettingController.m
//  Take-out Demo
//
//  Created by 袁杰 on 17/3/28.
//  Copyright © 2017年 袁杰. All rights reserved.
//

#import "YJSettingController.h"

@interface YJSettingController ()

@end

@implementation YJSettingController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    self.navigationController.title = @"设置";
    self.navigationController.navigationBar.hidden = false;
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = true;
}


@end
