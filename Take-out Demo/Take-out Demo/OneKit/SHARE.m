//
//  SHARE.m
//  Ban8_Agent
//
//  Created by zhangjin on 16/9/1.
//  Copyright © 2016年 ban8.cn. All rights reserved.
//

#import "SHARE.h"
#import "OneKit.h"
#import <ShareSDK/ShareSDK.h>
@implementation SHARE
+ (void)sharePlatfrom:(Platform)platfrom
            WithTitle:(NSString*)title
                 text:(NSString*)text
                image:(UIImage*)image
                  url:(NSString*)url
             callback:(void (^)(BOOL isError))callback
{
   /* NSDictionary *infoPlist = [[NSBundle mainBundle] infoDictionary];
    NSString *iconName = [[infoPlist valueForKeyPath:@"CFBundleIcons.CFBundlePrimaryIcon.CFBundleIconFiles"] lastObject];
    UIImage* icon = [UIImage imageNamed:iconName];
    //
    SSDKPlatformType platfromName;
    switch (platfrom) {
        case PlatformWeixinFriend: platfromName=SSDKPlatformSubTypeWechatSession; break;
        case PlatformEmail: platfromName=SSDKPlatformTypeMail; break;
        default: return;
    }

    NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
    [shareParams SSDKSetupShareParamsByText:text
                                     images:icon
                                        url:[NSURL URLWithString:url]
                                      title:title
                                       type:SSDKContentTypeWebPage];
    [ShareSDK share:platfromName parameters:shareParams onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
        switch (state) {
            case SSDKResponseStateSuccess:
            {
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"分享成功"
                                                                    message:nil
                                                                   delegate:nil
                                                          cancelButtonTitle:@"确定"
                                                          otherButtonTitles:nil];
                [alertView show];
                break;
            }
            case SSDKResponseStateFail:
            {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"分享失败"
                                                                message:[NSString stringWithFormat:@"%@",error]
                                                               delegate:nil
                                                      cancelButtonTitle:@"OK"
                                                      otherButtonTitles:nil, nil];
                [alert show];
                break;
            }
            default:
                break;
        }
    }];*/
}
@end
