//
//  NSString+Extension.m
//  Take-out Demo
//
//  Created by 袁杰 on 16/12/21.
//  Copyright © 2016年 袁杰. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)
-(NSString *)cleanDecimalPointZear{
    NSInteger offset = self.length - 1;
    while (offset > 0 ) {
        NSString *s = [self substringWithRange:NSMakeRange(offset, 1)];
        if ([s isEqualToString:@"0"] || [s isEqualToString:@"."]) {
            offset--;
        }else{
            break;
        }
    }
    return [self substringToIndex:offset + 1];
}

@end
