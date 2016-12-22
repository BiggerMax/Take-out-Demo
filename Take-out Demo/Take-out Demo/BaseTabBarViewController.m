//
//  BaseTabBarViewController.m
//  Take-out Demo
//
//  Created by 袁杰 on 16/12/22.
//  Copyright © 2016年 袁杰. All rights reserved.
//

#import "BaseTabBarViewController.h"
#import "YJMainTabBarViewController.h"
#import "YJHomeViewController.h"
#import "YJShopCarTool.h"
#import "YJBaseNavigationController.h"

#define SCREENWEIGHT [UIScreen mainScreen].bounds.size.width
#define kTabBarHeight 49

@interface BaseTabBarViewController ()
@property(nonatomic,strong)UIView *tabBarView;
//记录上一次选中的按钮
@property(nonatomic,strong)BaseTabBarViewController *selectedLastBtn;
@end

@implementation BaseTabBarViewController
//单例
static BaseTabBarViewController *controller = nil;
+(BaseTabBarViewController *)sharedController{
    @synchronized (self) {
        if (controller == nil) {
            controller = [[self alloc] init];
            [controller buildTabBar];
        }
    }
}
@end
