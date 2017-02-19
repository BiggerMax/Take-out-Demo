//
//  YJTitleIconAction.m
//  Take-out Demo
//
//  Created by 袁杰 on 17/2/19.
//  Copyright © 2017年 袁杰. All rights reserved.
//

#import "YJTitleIconAction.h"

@implementation YJTitleIconAction
+(instancetype)titleIconWithTitle:(NSString*)title icon:(UIImage*)icon controller:(UIViewController*)controller tag:(NSInteger)tag{
    YJTitleIconAction *titleIconAction = [[YJTitleIconAction alloc] init];
    titleIconAction.title = title;
    titleIconAction.icon = icon;
    titleIconAction.controller = controller;
    titleIconAction.tag = tag;
    return titleIconAction;
}
@end
