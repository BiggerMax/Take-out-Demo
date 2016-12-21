//
//  YJSelectedAdressViewController.m
//  Take-out Demo
//
//  Created by 袁杰 on 16/12/21.
//  Copyright © 2016年 袁杰. All rights reserved.
//  导航栏统一样式

#import "YJSelectedAdressViewController.h"
#import "UIBarButtonItem+Button.h"
@interface YJSelectedAdressViewController ()

@end

@implementation YJSelectedAdressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self buildNavigationBar];
}

-(void)buildNavigationBar{
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItem:@"扫一扫" image:@"icon_black_scancode" target:self action:@selector(LeftBarButtonItemClicked) type:LeftItemButton];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonItem:@"搜索" image:@"icon_search" target:self action:@selector(RightBarButtonItemClicked) type:RightItemButton];
    self.navigationController.navigationBar.barTintColor = GeneralColor;
}

-(void)LeftBarButtonItemClicked{
    
}

-(void)RightBarButtonItemClicked{
    
}
@end
