//
//  YJFooterBannerData.h
//  Take-out Demo
//
//  Created by 袁杰 on 17/2/19.
//  Copyright © 2017年 袁杰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YJActivity.h"
@interface YJFooterBannerData : NSObject
@property(nonatomic,copy)NSString *code;
@property(nonatomic,copy)NSString *msg;
@property(nonatomic,copy)NSArray *data;
+(void)loadFooterBannerData:(CompleteBlock)complete;
@end
