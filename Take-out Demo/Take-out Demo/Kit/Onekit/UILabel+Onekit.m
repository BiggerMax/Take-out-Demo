//
//  UILabel+Onekit.m
//  Ecen
//
//  Created by 张 瑾 on 14-4-10.
//  Copyright (c) 2014年 zhangjin. All rights reserved.
//
//#import "Onekit.h"
#import "UILabel+Onekit.h"
#import "NSString+Onekit.h"
@implementation UILabel (Onekit)
- (CGSize)autoSize
{
    NSString* str = self.text;
    if([NSString isEmpty:str]){
        return self.frame.size;
    }
    CGSize size = self.frame.size;
    UIFont* font = self.font;
    CGSize stringSize;
    stringSize = [str sizeWithSize:CGSizeMake(size.width-20, CGFLOAT_MAX) font:font];
    CGRect frame = self.frame;
    frame.size.width = stringSize.width+20;
    frame.size.height = stringSize.height+20;
    self.frame = frame;
    //
    return frame.size;
}
@end
