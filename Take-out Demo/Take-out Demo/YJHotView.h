//
//  YJHotView.h
//  Take-out Demo
//
//  Created by 袁杰 on 16/12/22.
//  Copyright © 2016年 袁杰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YJHotView : UIView
-(instancetype)initWithImages:(NSArray<NSString *>*)images titles:(NSArray *)titles placeHolder:(UIImage *)image;
@property(nonatomic,copy)ClikedCallback callback;
@end
