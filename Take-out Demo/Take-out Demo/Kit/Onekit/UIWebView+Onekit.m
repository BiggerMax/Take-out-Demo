//
//  UIWebView+Onekit.m
//  Ban8_Owner
//
//  Created by zhangjin on 16/8/24.
//  Copyright © 2016年 ban8.cn. All rights reserved.
//

#import "UIWebView+Onekit.h"
#import "OneKit.h"
@implementation UIWebView(Onekit)
- (void)loadUrl:(NSString*)url params:(NSDictionary*)params;
{
    NSURL* uri = [NSURL URLWithString:url];
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:uri];
    [request setValue:[CONFIG get2:@"TOKEN"] forHTTPHeaderField:@"COOKIE"];
    [request setValue:@"text/html" forHTTPHeaderField:@"content-type"];
    if(params){
        NSMutableData *data = [[NSMutableData alloc] init];
        [data appendData:[[JSON stringify:params] dataUsingEncoding:NSUTF8StringEncoding]];
        request.HTTPBody = data;
    }
    [self loadRequest:request];
}
@end
