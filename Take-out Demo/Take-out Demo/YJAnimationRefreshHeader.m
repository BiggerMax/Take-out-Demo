//
//  YJAnimationRefreshHeader.m
//  Take-out Demo
//
//  Created by 袁杰 on 17/2/14.
//  Copyright © 2017年 袁杰. All rights reserved.
//

#import "YJAnimationRefreshHeader.h"

@implementation YJAnimationRefreshHeader
-(void)prepare{
    [super prepare];
    self.stateLabel.hidden = NO;
    self.lastUpdatedTimeLabel.hidden = YES;
    
    
    [self setTitle:@"下拉刷新" forState:MJRefreshStateIdle];
    [self setTitle:@"松开刷新" forState:MJRefreshStatePulling];
    [self setTitle:@"正在刷新" forState:MJRefreshStateRefreshing];
}

@end
