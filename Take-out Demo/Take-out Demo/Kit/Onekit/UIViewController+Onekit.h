//
//  UIViewController+Onekit.h
//  Onekit
//
//  Created by 张瑾 on 15/6/30.
//  Copyright (c) 2015年 visitors. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController(Onekit)
+ (UIViewController*)current;
- (void)callback:(dispatch_block_t)callback;
@end
