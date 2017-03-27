//
//  RES.h
//  OneKit
//
//  Created by Visitors on 15/3/3.
//  Copyright (c) 2015年 visitors. All rights reserved.
//

//#import "OneKit.h"
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface RES : NSObject
+ (NSString*)pathForRes:(NSString*)path;
+ (NSData*)loadData:(NSString*)path;
+ (UIImage*)loadImage:(NSString*)path;
+ (NSString*)loadString:(NSString*)path;
+ (id)loadJSON:(NSString*)path;

+ (NSString*)pathForRes:(NSString*)resName
                resType:(NSString*)resType
             bundleName:(NSString*)bundleName
                 folder:(NSString*)folder;
+ (NSString*)pathForRes:(NSString*)path bundleName:(NSString*)bundleName;
+ (NSData*)loadData:(NSString*)path bundleName:(NSString*)bundleName;
+ (UIImage*)loadImage:(NSString*)path bundleName:(NSString*)bundleName;
+ (NSString*)loadString:(NSString*)path bundleName:(NSString*)bundleName;
+ (id)loadJSON:(NSString*)path bundleName:(NSString*)bundleName;
@end
