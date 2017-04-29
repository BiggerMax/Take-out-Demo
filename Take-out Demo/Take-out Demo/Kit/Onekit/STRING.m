//
//  STRING.m
//  Onekit
//
//  Created by HeYanTao on 15/9/28.
//  Copyright © 2015年 张瑾. All rights reserved.
//

#import "STRING.h"
#import "NSString+Onekit.h"
@implementation STRING
+ (void)init
{
    //[Onekit init];
}
+ (BOOL)isEmpty:(NSString*)str
{
    [self init];
   return [NSString isEmpty:str];
}
+ (NSString *)toString:(NSArray *)array seperator:(NSString*)seperator
{
    [self init];
    if (array==nil||array.count<=0) {
        return nil;
    }else{
        return [array componentsJoinedByString:seperator];
    }
}
+ (NSArray*)parse:(NSString*)str seperator:(NSString*)seperator
{
    [self init];
    if ([NSString isEmpty:str]) {
        return nil;
    }else{
        return [str componentsSeparatedByString:seperator];
    }
}
@end
