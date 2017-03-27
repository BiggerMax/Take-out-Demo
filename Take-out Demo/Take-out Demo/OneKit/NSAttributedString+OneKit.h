//
//  NSAttributedString+OneKit.h
//  Onekit_Designer
//
//  Created by zhangjin on 16/12/13.
//  Copyright © 2016年 onekit.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSAttributedString(OneKit)
+ (NSAttributedString*)fromJSON:(NSArray*)jsons;
+ (NSArray*)toJSON:(NSAttributedString*)attributedString;
@end
