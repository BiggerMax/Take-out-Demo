//
//  YJMyOrderingController.m
//  Take-out Demo
//
//  Created by 袁杰 on 17/4/4.
//  Copyright © 2017年 袁杰. All rights reserved.
//

#import "YJMyOrderingController.h"

@interface YJMyOrderingController ()

@end

@implementation YJMyOrderingController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    self.navigationController.navigationBar.hidden = FALSE;
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = TRUE;
}


@end
