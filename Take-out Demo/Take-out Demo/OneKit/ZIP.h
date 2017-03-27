//
//  ZIP.h
//  Onekit_Studio
//
//  Created by zhangjin on 16/11/15.
//  Copyright © 2016年 onekit.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "ZipArchive.h"
@interface ZIP : NSObject
+ (void)zip:(NSString*)zip folder:(NSString*)folder;
+ (void)unzip:(NSString*)zip folder:(NSString*)folder;
@end
