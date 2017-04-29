//
//  ApiBLL.h
//  WXOpenIMSampleRelease
//
//  Created by 袁杰 on 17/2/10.
//  Copyright © 2017年 taobao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ApiBLL : NSObject
+ (void)logWithUsername:(NSString *)userName
                 password:(NSString *)password
                 callback:(void(^)(BOOL isError,BOOL result))callback;
@end
