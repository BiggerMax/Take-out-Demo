//
//  WKWebView+OneKit.m
//  Ban8_Owner
//
//  Created by zhangjin on 16/8/24.
//  Copyright © 2016年 ban8.cn. All rights reserved.
//

#import "WKWebView+OneKit.h"
#import "OneKit.h"
@implementation WKWebView(OneKit)
- (void)loadUrl:(NSString*)url params:(NSDictionary*)params;
{
    NSURL* uri = [NSURL URLWithString:url];
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:uri];
    [request setValue:[CONFIG get:CONFIG_TOKEN] forHTTPHeaderField:@"COOKIE"];
    [request setValue:@"text/html" forHTTPHeaderField:@"content-type"];
    if(params){
        NSMutableData *data = [[NSMutableData alloc] init];
        [data appendData:[[JSON stringify:params] dataUsingEncoding:NSUTF8StringEncoding]];
        request.HTTPBody = data;
    }
    [self loadRequest:request];
}
+ (void)clear
{
    NSString *libraryDir = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory,
                                                               NSUserDomainMask, YES)[0];
    NSString *bundleId  =  [[[NSBundle mainBundle] infoDictionary]
                            objectForKey:@"CFBundleIdentifier"];
    NSString *webkitFolderInLib = [NSString stringWithFormat:@"%@/WebKit",libraryDir];
    NSString *webKitFolderInCaches = [NSString stringWithFormat:@"%@/Caches/%@/WebKit",libraryDir,bundleId];
    NSError *error;
    [[NSFileManager defaultManager] removeItemAtPath:webKitFolderInCaches error:&error];
    [[NSFileManager defaultManager] removeItemAtPath:webkitFolderInLib error:&error];
    //
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 9.0) {
        
        NSSet *websiteDataTypes
        
        = [NSSet setWithArray:@[
                                
                                WKWebsiteDataTypeDiskCache,
                                
                                //WKWebsiteDataTypeOfflineWebApplicationCache,
                                
                                WKWebsiteDataTypeMemoryCache,
                                
                                //WKWebsiteDataTypeLocalStorage,
                                
                                //WKWebsiteDataTypeCookies,
                                
                                //WKWebsiteDataTypeSessionStorage,
                                
                                //WKWebsiteDataTypeIndexedDBDatabases,
                                
                                //WKWebsiteDataTypeWebSQLDatabases
                                
                                ]];
        
        //// All kinds of data
        
        //NSSet *websiteDataTypes = [WKWebsiteDataStore allWebsiteDataTypes];
        
        //// Date from
        
        NSDate *dateFrom = [NSDate dateWithTimeIntervalSince1970:0];
        
        //// Execute
        
        [[WKWebsiteDataStore defaultDataStore] removeDataOfTypes:websiteDataTypes modifiedSince:dateFrom completionHandler:^{
            
            // Done
            
        }];
        
        
        
    } else {
        
        
        
        NSString *libraryPath = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) objectAtIndex:0];
        
        NSString *cookiesFolderPath = [libraryPath stringByAppendingString:@"/Cookies"];
        
        NSError *errors;
        
        [[NSFileManager defaultManager] removeItemAtPath:cookiesFolderPath error:&errors];
        
        
        
    }
}
@end
