//
//  Utility.m
//  Onekit
//
//  Created by www.onekit.cn on 15/3/6.
//  Copyright (c) 2015年 www.onekit.cn. All rights reserved.
//
#import "OneKit.h"
#import <objc/runtime.h>
@implementation Onekit
static BOOL checking = false;
//static NSDate *expire = nil;

+ (void)init
{
    if(checking){
        return;
    }
    checking = TRUE;
    /*NSDictionary *infoDict = [[NSBundle mainBundle] infoDictionary];
    NSString* appID = infoDict[(NSString*)kCFBundleIdentifierKey];
    NSURL* url = [NSURL URLWithString:format(@"http://www.onekit.cn/app/%@.txt",appID)];
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request
                                           queue:[NSOperationQueue mainQueue]
                               completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError)
         {
             if(connectionError){
                 
                 //[DIALOG alert:connectionError.description callback:^{
                    // [APP openUrl:@"http://www.onekit.cn"];
                     //exit(0);
                 //}];
                 return;
             }
             checking = FALSE;
             NSString *string = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
             if(isEmpty(string)){
                 [DIALOG alert:@"Onekit无效，请到www.onekit.cn购买正版。" callback:^{
                     [APP openUrl:@"http://www.onekit.cn"];
                     exit(0);
                 }];
                 return;
             }
             NSDate *expire = [NSDate parseWithString:string];
             if (isNull(expire)) {
                 [DIALOG alert:@"有效期无效，请到www.onekit.cn购买正版。" callback:^{
                     [APP openUrl:@"http://www.onekit.cn"];
                     exit(0);
                 }];
                 return;

             }
             NSDate* now = [NSDate date];
             if([now timeIntervalSinceDate:expire]>0){
                 [DIALOG alert:@"Onekit过期，请到www.onekit.cn续费。" callback:^{
                     [APP openUrl:@"http://www.onekit.cn"];
                     exit(0);
                 }];
                 return;
             }
            // [self init];
         }];
     
     
     return;
     */
    }
    /**/

/*
+ (id)invokeClassWithClass:(Class)cls object:(id)object method:(SEL)method arguments:(NSArray*)arguments
{
    NSMethodSignature *methodSignature = [cls instanceMethodSignatureForSelector:method];
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSignature];
    invocation.target = object;
    invocation.selector = method;
    for(int i=0;i<arguments.count;i++){
        id argument = arguments[i];
        [invocation setArgument:&argument atIndex:(i+2)];
    }
    [invocation retainArguments];
    [invocation invoke];
    const char *returnType = methodSignature.methodReturnType;
    id RESULT;
    if(!strcmp(returnType, @encode(void))){
        RESULT = nil;
    }else if(!strcmp(returnType, @encode(id))){
        [invocation getReturnValue:&RESULT];
    }else{
        RESULT = nil;
    }
    return RESULT;
}

+ (id)invokeClassWithClass:(Class)class method:(SEL)method arguments:(NSArray*)arguments
{
    return [self invokeClassWithClass:class object:nil method:method arguments:arguments];
}

+ (id)invokeObjectWithObject:(id)object method:(SEL)method arguments:(NSArray*)arguments
{
    return [self invokeClassWithClass:[object class] object:object method:method arguments:arguments];
}
*/
+ (void)setting:(NSObject*)obj
{
    NSMutableDictionary *props = [NSMutableDictionary dictionary];
    unsigned int outCount, i;
    objc_property_t *properties = class_copyPropertyList([obj class], &outCount);
    for (i = 0; i<outCount; i++)
    {
        objc_property_t property = properties[i];
        const char* char_f =property_getName(property);
        NSString *propertyName = [NSString stringWithUTF8String:char_f];
        @try {
            
            id propertyValue = [obj valueForKey:(NSString *)propertyName];
            if (propertyValue) [props setObject:propertyValue forKey:propertyName];
        } @catch (NSException *exception) {
            
        } @finally {
            
        }
    }
    NSLog(@"%@",props);
    free(properties);
}
+ (void)tree:(UIView*)view
{
    [self tree:view path:@""];
}
+ (void)tree:(UIView*)view path:(NSString*)path
{
    for (int i=0; i<view.subviews.count ; i++) {
        UIView* v = view.subviews[i];
        NSString* p = [NSString stringWithFormat:@"%@,%ld",path,(long)i];
        NSLog(@"****************%@****************",v);
        [self tree:v path:p];
    }
    
}
@end
