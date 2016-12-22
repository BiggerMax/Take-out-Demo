//
//  YJBuyView.h
//  Take-out Demo
//
//  Created by 袁杰 on 16/12/22.
//  Copyright © 2016年 袁杰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YJGoods.h"
@interface YJBuyView : UIView
//是否显示0
@property(nonatomic,assign)BOOL zeroIsShow;
//关联商品模型
@property(nonatomic,strong)YJGoods *goods;
//不显示减号
@property(nonatomic,assign)BOOL minusNeverShow;
@end
