//
//  YJProgressHUDManager.m
//  Take-out Demo
//
//  Created by 袁杰 on 16/12/22.
//  Copyright © 2016年 袁杰. All rights reserved.
//

#import "YJProgressHUDManager.h"

@implementation YJProgressHUDManager
-(void)setBackgroundColor:(UIColor *)color{
    [SVProgressHUD setBackgroundColor:color];
}
-(void)showImage:(UIImage *)image string:(NSString *)string{
    [SVProgressHUD showImage:image  status:string];
}
@end
