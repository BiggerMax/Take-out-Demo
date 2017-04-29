//
//  CONFIG.h
//  WXOpenIMSampleRelease
//
//  Created by 袁杰 on 17/3/7.
//  Copyright © 2017年 taobao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Security/Security.h>
#define CFG_PASSWORD  @"com.shengdeshi.app.password"
#define CFG_USERNAME @"com.shengdeshi.app.username"
#define CFG_USERNAME_PASSWORD  @"com.shengdeshi.app.usernamepassword"
@interface CONFIG : NSObject

+(void)delete:(NSString *)service;
//
+(void)set:(NSString *)key value:(id)value;

//
+(id)get:(NSString *)key;
+ (void)set2:(NSString*)key
      value:(id)value;
+ (id)get2:(NSString*)key;
@end
