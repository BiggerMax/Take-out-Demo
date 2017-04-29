//
//  UIView+Onekit.h
//  iOS7
//
//  Created by 张 瑾 on 13-9-17.
//  Copyright (c) 2013年 Edison. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Onekit)
@property NSString* placeholder2;
@property NSString* text2;
@property NSString* title2;

- (UIImage*)blur:(UIView*)backgroundView;
- (void)clear;
@end
