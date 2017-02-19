//
//  YJTitleIconAction.h
//  Take-out Demo
//
//  Created by 袁杰 on 17/2/19.
//  Copyright © 2017年 袁杰. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YJTitleIconAction : NSObject
@property(nonatomic,copy)NSString *title;
@property(nonatomic,strong)UIImage *icon;
@property(nonatomic,strong)UIViewController *controller;
@property(nonatomic,assign)NSInteger tag;

+(instancetype)titleIconWithTitle:(NSString*)title icon:(UIImage*)icon controller:(UIViewController*)controller tag:(NSInteger)tag;
@end
