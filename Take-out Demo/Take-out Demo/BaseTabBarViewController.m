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
#import "YJCartViewController.h"
#import "YJShoppingViewController.h"
#import "YJMyViewController.h"
#import "BaseTabBatButton.h"

#define kTabBarHeight 49

@interface BaseTabBarViewController ()
@property(nonatomic,strong)UIView *tabBarView;
//记录上一次选中的按钮
@property(nonatomic,strong)BaseTabBatButton *selectedLastBtn;
@end

@implementation BaseTabBarViewController
//单例
static BaseTabBarViewController *controller = nil;
+(BaseTabBarViewController *)sharedController{
    @synchronized (self) {
        if (controller == nil) {
            controller = [[self alloc] init];
            [controller buildTabBar];
            NSArray *titles = @[@"首页",@"分类",@"购物车",@"我的"];
            NSArray *vcs = @[[[YJHomeViewController alloc]init],[[YJShoppingViewController alloc]init],[[YJCartViewController alloc]init],[[YJMyViewController alloc]init]];
            NSArray *images = @[@"v2_home",@"v2_order",@"shopCart",@"v2_my"];
            NSArray *selectedImages = @[@"v2_home_r",@"v2_order_r",@"shopCart_r",@"v2_my_r"];
            [controller addchileVc:vcs titlle:titles images:images selectedImages:selectedImages tabBarNavChildVC:[[YJBaseNavigationController alloc]init]];
        }
    }
    return controller;
}

+(instancetype)allocWithZone:(struct _NSZone *)zone{
    @synchronized (self) {
        if (controller == nil) {
            controller = [super allocWithZone:zone];
            return controller;
        }
    }
    return nil;
}

-(void)buildTabBar{
    self.tabBar.hidden =YES;
    CGFloat tabBarViewY = self.view.frame.size.height - 49;
    _tabBarView = [[UIView alloc]initWithFrame:CGRectMake(0,tabBarViewY,Width,49)];
    _tabBarView.userInteractionEnabled = YES;
    _tabBarView.backgroundColor = [UIColor whiteColor];
    _tabBarView.alpha = 0.98;
    [self.view addSubview:_tabBarView];
}

-(void)addchileVc:(NSArray *)childVccs titlle:(NSArray *)titles images:(NSArray *)images selectedImages:(NSArray *)selectedImages tabBarNavChildVC:(YJBaseNavigationController *)tabBarNavChildVC{
    for (int i = 0; i < childVccs.count; i++) {
        UINavigationController *tabBarNavChildVC = [[UINavigationController alloc]initWithRootViewController:childVccs[i]];
        [self addChildViewController:tabBarNavChildVC];
        [self creatButtonWithNormalName:images[i] andSelectName:selectedImages[i] andTitle:titles[i] andTag:i andIndex:childVccs.count];
    }
    BaseTabBatButton *button = self.tabBarView.subviews[0];
    [self changeViewController:button];
}

-(void)changeViewController:(BaseTabBatButton *)sender{
    sender.enabled = NO;
    if (_selectedLastBtn != sender) {
        _selectedLastBtn.enabled = YES;
    }
    _selectedLastBtn = sender;
    self.selectedViewController = self.viewControllers[sender.tag];
}

#pragma mark 创建一个按钮
-(void)creatButtonWithNormalName:(NSString *)normal andSelectName:(NSString *)seleted andTitle:(NSString *)title andTag:(int)tag andIndex:(NSInteger)index{
    BaseTabBatButton *customButton = [BaseTabBatButton buttonWithType:UIButtonTypeCustom];
    customButton.tag = tag;
    NSInteger count = index;
    CGFloat buttonW = _tabBarView.frame.size.width / count;
    CGFloat buttonH = _tabBarView.frame.size.height;
    customButton.frame = CGRectMake(buttonW * tag, 0, buttonW, buttonH);
    [customButton setImage:[UIImage imageNamed:normal] forState:UIControlStateNormal];
    [customButton setImage:[UIImage imageNamed:seleted] forState:UIControlStateDisabled];
    [customButton setTitle:title forState:UIControlStateNormal];
    [customButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [customButton setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
    [customButton addTarget:seleted action:@selector(changeViewController:) forControlEvents:UIControlEventTouchUpInside];
    customButton.imageView.contentMode = UIViewContentModeCenter;
    customButton.titleLabel .textAlignment = NSTextAlignmentCenter;
    customButton.titleLabel.font = [UIFont systemFontOfSize:12];
    [_tabBarView addSubview:customButton];
}

#pragma mark 是否隐藏tabBar
-(void)hidesTabBar:(BOOL)yesOrNO animated:(BOOL)animated{
    self.tabBarHidden = yesOrNO;
    if (yesOrNO == YES) {
        if (self.tabBarView.frame.origin.y == self.view.frame.size.height) {
            return;
        }
        else{
            if (_tabBarView.frame.origin.y == self.view.frame.size.height - kTabBarHeight) {
                return;
            }
        }
        if (animated == YES) {
            [UIView beginAnimations:nil context:NULL];
            [UIView setAnimationDuration:0.3f];
            if (yesOrNO == YES) {
                _tabBarView.frame = CGRectMake(_tabBarView.frame.origin.x, _tabBarView.frame.origin.y + kTabBarHeight,_tabBarView.frame.size.width , _tabBarView.frame.size.height);
            }else{
                _tabBarView.frame = CGRectMake(_tabBarView.frame.origin.x, _tabBarView.frame.origin.y - kTabBarHeight, _tabBarView.frame.size.width, _tabBarView.frame.size.height);
            }
            [UIView commitAnimations];
        }
        else{
            [UIView beginAnimations:nil context:NULL];
            [UIView setAnimationDuration:0.3f];
            if (yesOrNO == YES) {
                _tabBarView.frame =CGRectMake(_tabBarView.frame.origin.x, _tabBarView.frame.origin.y + kTabBarHeight, _tabBarView.frame.size.width, _tabBarView.frame.size.height);
            }
            else{
                 _tabBarView.frame = CGRectMake(_tabBarView.frame.origin.x, _tabBarView.frame.origin.y - kTabBarHeight, _tabBarView.frame.size.width, _tabBarView.frame.size.height);
            }
            [UIView commitAnimations];
        }
    }
}
@end
