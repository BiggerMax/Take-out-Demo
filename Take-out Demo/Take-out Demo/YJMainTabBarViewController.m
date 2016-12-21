//
//  YJMainTabBarViewController.m
//  Take-out Demo
//
//  Created by 袁杰 on 16/12/20.
//  Copyright © 2016年 袁杰. All rights reserved.
//

#import "YJMainTabBarViewController.h"
#import "YJBaseNavigationController.h"
#import "YJHomeViewController.h"
#import "YJCircleViewController.h"
#import "YJShoppingViewController.h"
#import "YJMyViewController.h"
@interface YJMainTabBarViewController ()

@end

@implementation YJMainTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addMainTabBarControllers];
    [self addNotification];
}

-(void)addMainTabBarControllers{
    [self addChildViewController:@"首页" viewController:[YJHomeViewController new] image:@"v2_home" selectedImage:@"v2_home_r"];
    [self addChildViewController:@"圈子" viewController:[YJCircleViewController new] image:@"v2_order" selectedImage:@"v2_order_r"];
    [self addChildViewController:@"购物车" viewController:[YJShoppingViewController new] image:@"shopCart" selectedImage:@"shopCart_r"];
    [self addChildViewController:@"我的" viewController:[YJMyViewController new] image:@"v2_my" selectedImage:@"v2_my_r"];
}

-(void)addNotification{
    [YJNotification addObserver:self selector:@selector(IncreaseShoppingCart) name:LFBShopCarBuyNumberDidChangeNotification object:nil];
}

-(void)IncreaseShopppingCart{
    UIViewController *shoppingVC = self.childViewControllers[2];
    NSInteger shoppingIndex = [yj]
}
-(void)addChildViewController:(NSString *)title viewController:(UIViewController *)controller image:(NSString *)image selectedImage:(NSString *)selectedImage {
    UITabBarItem *item = [[UITabBarItem alloc]init];
    item.image = [UIImage imageNamed:image];
    item.selectedImage = [UIImage imageNamed:selectedImage];
    item.title = title;
    controller.tabBarItem = item;
    controller.title = title;
    YJBaseNavigationController *navController = [[YJBaseNavigationController alloc]initWithRootViewController:controller];
    [self addChildViewController:navController];
    
}

@end