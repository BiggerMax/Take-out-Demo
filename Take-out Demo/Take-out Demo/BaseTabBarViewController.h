//
//  BaseTabBarViewController.h
//  Take-out Demo
//
//  Created by 袁杰 on 16/12/22.
//  Copyright © 2016年 袁杰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YJBaseNavigationController.h"

@interface BaseTabBarViewController : UITabBarController
@property(nonatomic,assign)BOOL tabBarHidden;

+(BaseTabBarViewController *)sharedController;

-(void)hidesTabBar:(BOOL)yesOrNO animated:(BOOL)animated;
-(void)addchileVc:(NSArray *)childVccs
           titlle:(NSArray *)titles
           images:(NSArray *)images
   selectedImages:(NSArray *)selectedImages
 tabBarNavChildVC:(YJBaseNavigationController *)tabBarNavChildVC;
@end
