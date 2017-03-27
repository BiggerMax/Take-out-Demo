//
//  WKWebView+OneKit.h
//  Ban8_Owner
//
//  Created by zhangjin on 16/8/24.
//  Copyright © 2016年 ban8.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>
@interface WKWebView (OneKit)
- (void)loadUrl:(NSString*)url params:(NSDictionary*)params;
+ (void)clear;
@end
