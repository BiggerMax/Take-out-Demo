//
//  YJHomeHeadView.h
//  Take-out Demo
//
//  Created by 袁杰 on 16/12/22.
//  Copyright © 2016年 袁杰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YJHomeHeadData.h"
#import "YJScrollPageView.h"
#import "YJHeadLineView.h"
#import "YJHotView.h"

@interface YJHomeHeadView : UIView
@property(nonatomic,strong)YJScrollPageView *scrollView;
@property(nonatomic,strong)YJHotView *hotView;
@property(nonatomic,strong)YJHeadLineView *headlineView;
@property(nonatomic,assign)CGFloat height;

-(instancetype)initWIthHeadData:(YJHomeHeadData *)headData;
@property(nonatomic,copy)ClikedCallback callback;
@end
