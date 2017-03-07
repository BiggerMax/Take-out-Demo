//
//  YJTableFootView.h
//  Take-out Demo
//
//  Created by 袁杰 on 17/3/7.
//  Copyright © 2017年 袁杰. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol YJTableFootViewDelegate <NSObject>

-(void)didTableFootViewCommit;
@end
@interface YJTableFootView : UIView
@property(nonatomic,weak) id<YJTableFootViewDelegate>delegate;
@property(nonatomic,assign) CGFloat sumMoney;
@end
