//
//  YJHomeHeadData.h
//  Take-out Demo
//
//  Created by 袁杰 on 16/12/22.
//  Copyright © 2016年 袁杰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YJGoods.h"
#import "YJActivity.h"
@class ActInfo;
@class ActRow;
@class HeadlineDetail;
@class CategoryDetail;
@interface YJHomeHeadData : NSObject
@property(nonatomic,copy)NSArray <ActInfo *>*act_info;

@property(nonatomic,strong)ActInfo *focus;
@property(nonatomic,strong)ActInfo *icon;
@property (nonatomic,strong) ActInfo *headline;
@property (nonatomic,strong) ActInfo *brand;
@property (nonatomic,strong) ActInfo *scene;
@property (nonatomic,strong) ActInfo *category;

+(void)loadHeadData:(CompleteBlock)complete;
@end

@interface ActInfo : NSObject
@property (nonatomic,strong) NSString *sort;
@property (nonatomic,strong) NSString *type;
@property (nonatomic,strong) NSString *head_img;
@property (nonatomic, strong) NSArray <ActRow *> *act_rows;
@end

@interface ActRow : NSObject
@property (nonatomic,strong) YJActivity *activity;
@property (nonatomic,strong) HeadlineDetail *headline_detail;
@property (nonatomic,strong) CategoryDetail *category_detail;
@end

@interface HeadlineDetail : NSObject
@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSString *content;
@end

@interface CategoryDetail : NSObject
@property (nonatomic,strong) NSString *category_id;
@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSArray<YJGoods *> *goods;
@property (nonatomic,strong) NSString *category_color;
@end
