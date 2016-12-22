//
//  UIColor+YJExpand.m
//  Take-out Demo
//
//  Created by 袁杰 on 16/12/23.
//  Copyright © 2016年 袁杰. All rights reserved.
//

#import "UIColor+YJExpand.h"

@implementation UIColor(YJExpand)
+(UIColor *)getColor:(NSString *)hexColor{
    unsigned int red,green,blue;
    NSRange range;
    range.length = 2;
    range.location = 0;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&red];
    range.location = 2;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]]scanHexInt:&green];
    range.location =4;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]]scanHexInt:&blue];
    
    return [UIColor colorWithRed:(float)(red/255.0f) green:(float)(green/255.0f) blue:(float)(blue/255.0) alpha:1.0f];
}
@end
