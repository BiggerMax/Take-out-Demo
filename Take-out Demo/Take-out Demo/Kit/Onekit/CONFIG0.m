//
//  CONFIG.m
//  Onekit
//
//  Created by www.onekit.cn on 15/3/3.
//  Copyright (c) 2015年 www.onekit.cn. All rights reserved.
//

#import "CONFIG0.h"

@implementation CONFIG0
+ (void)init
{
    //[Onekit init];
}
+(void)set:(NSString*)key value:(id)value
{
    [self init];
    [[NSUserDefaults standardUserDefaults] setObject:value forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+(id)get:(NSString*)key
{
    [self init];
    return [[NSUserDefaults standardUserDefaults] objectForKey:key];
}

@end
