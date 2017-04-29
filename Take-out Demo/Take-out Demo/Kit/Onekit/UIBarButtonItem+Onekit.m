//
//  UIBarButtonItem+Onekit.m
//  WXOpenIMSampleRelease
//
//  Created by ZhangJin on 2017/3/8.
//  Copyright © 2017年 taobao. All rights reserved.
//

#import "UIBarButtonItem+Onekit.h"

@implementation UIBarButtonItem(Onekit)
- (void)setTitle2:(NSString *)title2
{
    NSString* string = NSLocalizedString(title2,nil);
    [self setValue:string forKey:@"title"];
}
- (NSString*)title2
{
    return [self valueForKey:@"title"];
}
@end
