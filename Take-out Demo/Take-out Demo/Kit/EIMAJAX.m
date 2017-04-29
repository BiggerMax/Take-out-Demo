//
//  EIMAJAX.m
//  OnekitIMdemo
//
//  Created by ZhangJin on 2016/12/31.
//  Copyright © 2016年 onekit.cn. All rights reserved.
//
#import "Onekit.h"
#import "EIMAJAX.h"
#import "SDWebImageManager.h"
#import "UIImageView+WebCache.h"

@implementation EIMAJAX

+ (NSString*)getUrlByAPI:(NSString*)api method:(NSString*)method
{
    return format(URL_API,method);
}
+ (void)getJSONWithAPI:(NSString*)api
                method:(NSString*)method
                params:(NSDictionary*)params
              callback:(void (^)(BOOL isError,NSDictionary* json))callback
{
    NSString* url = [self getUrlByAPI:api method:method];
    //[LOADING show];
    [AJAX getJSONWithUrl:url params:params mode:AJAXModePost callback:^(BOOL isError, NSDictionary *json) {
        //[LOADING hide];
        if(isError){
            callback(TRUE,nil);
            return;
        }
        if([json[@"code"] intValue]!=0){
            [DIALOG alert:format(@"[%@]%@",json[@"code"],json[@"message"]) callback:^{
                callback(TRUE,nil);
            }];
            return;
        }
        callback(FALSE,json[@"data"]);
    }];
}
+ (void)getDataWithAPI:(NSString*)api
                method:(NSString*)method
                params:(NSDictionary*)params
              callback:(void (^)(BOOL isError,NSData* data))callback
{
    NSString* url = [self getUrlByAPI:api method:method];
    //[LOADING show];
    [AJAX getDataWithUrl:url params:params mode:AJAXModePost callback:^(BOOL isError, NSData *data) {
        //[LOADING hide];
        if(isError){
            callback(TRUE,nil);
            return;
        }
        callback(FALSE,data);
    }];
}
/*+ (void)getAvatarWithUsername:(NSString*)username
 callback:(void (^)(BOOL isError,UIImage* image))callback;
 {
 // NSString* url = [NSString stringWithFormat:@"%@/data/avatar/%@.jpg",TEST?URL_SERVER:URL_SERVER2,username];
 NSString *url = [Common avatar:username];
 [AJAX getImageWithUrl:url
 callback:^(BOOL isError, UIImage *image) {
 if(isError){
 callback(TRUE,nil);
 return;
 }
 callback(FALSE,image);
 }];
 }*/
+ (void)getMyAvatarWithImageView:(UIImageView*)imageView
                        callback:(void (^)(BOOL isError,UIImage* image))callback
{
    NSDictionary* profile = [CONFIG get:@"PROFILE"];
    // NSString* _Nonnull url = [NSString stringWithFormat:@"%@/data/avatar/%@.jpg",TEST?URL_SERVER:URL_SERVER2,username];
    NSString *url = profile[@"avatar"];
    if (isEmpty(url)) {
        callback(true,nil);
        return;
    }
    
    [imageView sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:@"demo_head_120.png"] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        if(error){
            image = [UIImage imageNamed:@"demo_head_120.png"];
            
        }
        callback(error!=nil,image);
    }];
    
}
+ (void)uploadWithAPI:(NSString*)api
               method:(NSString*)method
               params:(NSDictionary*)params
               images:(NSDictionary<NSString*,UIImage*>*)images
             callback:(void (^)(BOOL isError,NSDictionary* json))callback
{
    NSMutableDictionary<NSString*,NSData*>* files = [NSMutableDictionary new];
    for(NSString* key in images.allKeys){
        UIImage* image = images[key];
        files[key] = UIImageJPEGRepresentation(image, 0.0);
    }
    [self uploadWithAPI:api
                 method:method
                 params:params
                  files:files
               callback:callback];
}
+ (void)uploadWithAPI:(NSString*)api
               method:(NSString*)method
               params:(NSDictionary*)params
                files:(NSDictionary<NSString*,NSData*>*)files
             callback:(void (^)(BOOL isError,NSDictionary* json))callback
{
    NSString* url = [self getUrlByAPI:api method:method];
    [AJAX uploadWithUrl:url
                 params:params
                  files:files
               callback:^(BOOL isError, NSDictionary *json) {
                   //                     [DIALOG done];
                   if(isError){
                       callback(TRUE,nil);
                       return;
                   }
                   
                   if([json[@"code"] intValue]!=0){
                       [DIALOG alert:format(@"[%@]%@",json[@"code"],json[@"message"]) callback:^{
                           callback(TRUE,nil);
                       }];
                       return;
                   }
                   callback(FALSE,json[@"data"]);
               }];
}
+ (AJAX*)downloadWithAPI:(NSString*)api
                  method:(NSString*)method
                  params:(NSDictionary *)params
                    mode:(AJAXMode)mode
                    save:(NSString*)save
               progress2:(void (^)(CGFloat process))callback2
                callback:(void (^)(BOOL isError))callback
{
    NSString* url = [self getUrlByAPI:api method:method];
    AJAX* ajax = [[AJAX alloc] init];
    [ajax downloadWithUrl:url
                   params:params
                     mode:mode
                     save:save
                progress2:callback2
                 callback:callback];
    return ajax;
}
@end
