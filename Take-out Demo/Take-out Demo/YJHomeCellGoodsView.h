//
//  YJHomeCellGoodsView.h
//  Take-out Demo
//
//  Created by 袁杰 on 16/12/23.
//  Copyright © 2016年 袁杰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YJHomeHeadData.h"
#import "YJHomeCell.h"
@interface YJHomeCellGoodsView : UIView
@property(nonatomic,strong)ActRow *actRow;
@property(nonatomic,copy)ClickedCellBack cellBack;
@end
