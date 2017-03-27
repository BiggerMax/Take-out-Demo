//
//  SHARE.h
//  Ban8_Agent
//
//  Created by zhangjin on 16/9/1.
//  Copyright © 2016年 ban8.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef enum{
    PlatformWeibo,
    PlatformQQ,
    PlatformRenRen,
    PlatformKaixin,
    PlatformQQFirent,
    PlatformWeixinFriend,
    PlatformWeixinTimeline,
    PlatformEmail,
    PlatformSMS,
    PlatformCopy
}Platform;
@interface SHARE : NSObject
+ (void)sharePlatfrom:(Platform)platfrom
            WithTitle:(NSString*)title
                 text:(NSString*)text
                image:(UIImage*)image
                  url:(NSString*)url
             callback:(void (^)(BOOL isError))callback;
@end
