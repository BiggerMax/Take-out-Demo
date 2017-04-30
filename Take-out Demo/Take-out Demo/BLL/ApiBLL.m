//
//  ApiBLL.m
//  WXOpenIMSampleRelease
//
//  Created by 袁杰 on 17/2/10.
//  Copyright © 2017年 taobao. All rights reserved.
//

#import "ApiBLL.h"
#import "Onekit.h"
#import "EIMAJAX.h"
//#import "Common.h"
#import "UIImageView+WebCache.h"
#import "AppDelegate.h"
#define API nil

@implementation ApiBLL
+ (void)logWithUsername:(NSString *)userName
                 password:(NSString *)password
                 callback:(void(^)(BOOL isError,BOOL result))callback
{

    NSMutableDictionary* params = [NSMutableDictionary new];
    params[@"name"] = userName;
    params[@"password"] = password;
    [EIMAJAX getJSONWithAPI:API method:@"log" params:params callback:^(BOOL isError, NSDictionary *json) {
        if(isError){
            callback(TRUE,FALSE);
            return;
        }
        BOOL result = [json[@"result"] boolValue];
        if(result){
           ((AppDelegate*)[UIApplication sharedApplication].delegate).DATA = json[@"profile"]; 
        }
        callback(FALSE,result);
    }];
}

    +(void)registerWithUsername:(NSString *)userName password:(NSString *)password telPhone:(NSInteger)telPhone callback:(void (^)(BOOL, BOOL))callback
    {
        BmobObject *registerObject = [BmobObject objectWithClassName:@"User"];
        [registerObject setObject:userName forKey:@"uname"];
        [registerObject setObject:password forKey:@"upsw"];
        [registerObject setObject:[NSNumber numberWithInteger:telPhone] forKey:@"phone"];
        [registerObject saveInBackgroundWithResultBlock:^(BOOL isSuccessful, NSError *error) {
            if (isSuccessful) {
                callback(false,true);
            }else if (error)
            callback(true,false);
        }];
        
    }
@end
