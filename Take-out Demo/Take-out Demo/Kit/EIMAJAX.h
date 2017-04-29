//
//  EIMAJAX.h
//  OnekitIMdemo
//
//  Created by ZhangJin on 2016/12/31.
//  Copyright © 2016年 onekit.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OneKit.h"
@interface EIMAJAX : NSObject

+ (void)getJSONWithAPI:(NSString*)api
                method:(NSString*)method
                params:(NSDictionary*)params
              callback:(void (^)(BOOL isError,NSDictionary* json))callback;
+ (void)getDataWithAPI:(NSString*)api
                method:(NSString*)method
                params:(NSDictionary*)params
              callback:(void (^)(BOOL isError,NSData* data))callback;
/*+ (void)getAvatarWithUsername:(NSString*)username
                     callback:(void (^)(BOOL isError,UIImage* image))callback;*/
+ (void)getMyAvatarWithImageView:(UIImageView*)imageView
                        callback:(void (^)(BOOL isError,UIImage* image))callback;
+ (void)getAvatarWithUsername:(NSString*)username
                    imageView:(UIImageView*)imageView
                callback:(void (^)(BOOL isError,UIImage* image))callback;
+ (void)uploadWithAPI:(NSString*)api
               method:(NSString*)method
               params:(NSDictionary*)params
               images:(NSDictionary<NSString*,UIImage*>*)images
             callback:(void (^)(BOOL isError,NSDictionary* json))callback;
+ (void)uploadWithAPI:(NSString*)api
               method:(NSString*)method
               params:(NSDictionary*)params
                files:(NSDictionary<NSString*,NSData*>*)files
             callback:(void (^)(BOOL isError,NSDictionary* json))callback;
+ (AJAX*)downloadWithAPI:(NSString*)api
                 method:(NSString*)method
                 params:(NSDictionary *)params
                   mode:(AJAXMode)mode
                   save:(NSString*)save
              progress2:(void (^)(CGFloat process))callback2
               callback:(void (^)(BOOL isError))callback;
@end
