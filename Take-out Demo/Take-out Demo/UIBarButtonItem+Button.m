//
//  UIBarButtonItem+Button.m
//  Take-out Demo
//
//  Created by 袁杰 on 16/12/21.
//  Copyright © 2016年 袁杰. All rights reserved.
//

#import "UIBarButtonItem+Button.h"
#import "ItemCustomButton.h"
@implementation UIBarButtonItem (Button)
+(instancetype)barButtonItem:(NSString *)title image:(NSString *)image target:(id)target action:(SEL)action type:(ItemButtonType)type{
    UIButton *button;
    if (type == LeftItemButton) {
        button = [ItemLeftButton buttonWithType:UIButtonTypeCustom];
    }else{
        button = [ItemRighButton buttonWithType:UIButtonTypeCustom];
    }
    [button setTitle:title forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(0, 0, 60, 44);
    button.titleLabel.font = [UIFont systemFontOfSize:13];
    return [[UIBarButtonItem alloc]initWithCustomView:button];
}
@end
