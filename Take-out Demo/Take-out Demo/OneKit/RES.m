//
//  RES.m
//  OneKit
//
//  Created by Visitors on 15/3/3.
//  Copyright (c) 2015年 visitors. All rights reserved.
//

#import "RES.h"
#import "JSON.h"
#import "Macro.h"
#import "OneKit.h"
@implementation RES
+ (NSString*)pathForRes:(NSString*)path
{
    NSInteger pName = [path lastIndexOf:@"/"];
    NSInteger pExt = [path lastIndexOf:@"."];
    NSString* name = [path subString:pName+1 to:(pExt>=0?pExt-1:path.length)];
    NSString* ext = (pExt>=0?[path subString:pExt+1]:nil);
    path =  [[NSBundle mainBundle] pathForResource:name ofType:ext];
    return path;
}
+ (NSData*)loadData:(NSString*)path
{
    path = [RES pathForRes:path];
    return [NSData dataWithContentsOfFile:path];
}
+ (UIImage*)loadImage:(NSString*)path
{
    path = [RES pathForRes:path];
    return [UIImage imageWithContentsOfFile:path];
}
+ (NSString*)loadString:(NSString*)path
{
    path = [RES pathForRes:path];
    return [NSString stringWithContentsOfFile:path usedEncoding:NULL error:nil];
}
+ (id)loadJSON:(NSString*)path
{
    path = [RES pathForRes:path];
    NSString* string = [NSString stringWithContentsOfFile:path usedEncoding:NULL error:nil];
    return [JSON parse:string];
}
+ (NSString*)pathForRes:(NSString*)resName resType:(NSString*)resType bundleName:(NSString*)bundleName folder:(NSString*)folder
{
    NSString* bundlePath = [[NSBundle mainBundle] pathForResource:bundleName ofType:@"bundle"];
    NSBundle* bundle = [NSBundle bundleWithPath:bundlePath];
    NSString* path = [bundle pathForResource:resName ofType:resType inDirectory:folder];
    return path;
}
+ (NSString*)pathForRes:(NSString*)path bundleName:(NSString*)bundleName
{
    NSString* bundlePath = [[NSBundle mainBundle] pathForResource:bundleName ofType:@"bundle"];
    NSBundle* bundle = [NSBundle bundleWithPath:bundlePath];
    NSInteger pName = [path lastIndexOf:@"/"];
    NSInteger pExt = [path lastIndexOf:@"."];
    NSString* folder = (pName>=0?[path subString:0 to:pName]:nil);
    NSString* name = [path subString:pName+1 to:(pExt>=0?pExt:path.length)];
    NSString* ext = (pExt>=0?[path subString:pExt+1]:nil);
    path =  [bundle pathForResource:name ofType:ext inDirectory:folder];
    return path;
}
+ (NSData*)loadData:(NSString*)path bundleName:(NSString*)bundleName
{
    path = [RES pathForRes:path bundleName:bundleName];
    return [NSData dataWithContentsOfFile:path];
}
+ (UIImage*)loadImage:(NSString*)path bundleName:(NSString*)bundleName
{
    path = [RES pathForRes:path  bundleName:bundleName];
    return [UIImage imageWithContentsOfFile:path];
}
+ (NSString*)loadString:(NSString*)path bundleName:(NSString*)bundleName
{
    path = [RES pathForRes:path bundleName:bundleName];
    return [NSString stringWithContentsOfFile:path usedEncoding:NULL error:nil];
}
+ (id)loadJSON:(NSString*)path bundleName:(NSString*)bundleName
{
    path = [RES pathForRes:path bundleName:bundleName];
    NSString* string = [NSString stringWithContentsOfFile:path usedEncoding:NULL error:nil];
    return [JSON parse:string];
}
@end
