//
//  UIBarButtonItem+Button.h
//  Take-out Demo
//
//  Created by 袁杰 on 16/12/21.
//  Copyright © 2016年 袁杰. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,ItemButtonType) {
    LeftItemButton,
    RightItemButton
};
@interface UIBarButtonItem (Button)
+(instancetype)barButtonItem:(NSString *)title image:(NSString *)image target:(id)target action:(SEL)action type:(ItemButtonType)type;
@end
