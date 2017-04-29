//
//  NSArray+Onekit.m
//  Onekit
//
//  Created by www.onekit.cn on 15/3/4.
//  Copyright (c) 2015年 www.onekit.cn. All rights reserved.
//

#import "NSArray+Onekit.h"
#import "OneKit.h"
@implementation NSArray (Onekit)
+ (void)init
{
    //[Onekit init];
}
- (NSString *)toString
{
    [NSString init];
    return [self toStringWithSplit:@"|"];
}

- (NSString *)toStringWithSplit:(NSString *)split
{
    [NSString init];
    NSString *result = @"";
    for (id item in self) {
        result = [result stringByAppendingFormat:@"%@%@",split,[item description]];
    }
    if (result.length > 0) {
        result = [result substringFromIndex:1];
    }
    return result;
}

- (NSDictionary *)findItemWithValue:(NSDictionary*)value key:(NSString*)key
{
    for (int i=0;i<[self count];i++) {
        NSDictionary* temp = self[i];
        if([value[key] isEqual:temp[key]]){
            return temp;
        }
    }
    return nil;
}

- (NSInteger)indexOfObjectWithItem:(id)item key:(NSString*)key
{
    for (int i=0;i<[self count];i++) {
        NSDictionary* temp = self[i];
        if([item[key] isEqual:temp[key]]){
            return i;
        }
    }
    return -1;
}
- (NSInteger)containsObjectWithItem:(id)item key:(NSString*)key
{
    return [self indexOfObjectWithItem:item key:key]>=0;
}
@end
