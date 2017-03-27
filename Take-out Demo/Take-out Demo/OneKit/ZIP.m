//
//  ZIP.m
//  Onekit_Studio
//
//  Created by zhangjin on 16/11/15.
//  Copyright © 2016年 onekit.cn. All rights reserved.
//

#import "ZIP.h"

@implementation ZIP
+ (void)zip:(NSString*)zip folder:(NSString*)folder
{
    [SSZipArchive createZipFileAtPath:zip withContentsOfDirectory:folder];
}
+ (void)unzip:(NSString*)zip folder:(NSString*)folder
{
    [SSZipArchive unzipFileAtPath:zip toDestination:folder];
}
@end
