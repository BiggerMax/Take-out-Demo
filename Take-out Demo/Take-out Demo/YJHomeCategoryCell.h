//
//  YJHomeCategoryCell.h
//  Take-out Demo
//
//  Created by 袁杰 on 16/12/23.
//  Copyright © 2016年 袁杰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YJHomeHeadData.h"
#import "YJHomeCellTitleView.h"
#import "YJHomeCellGoodsView.h"
@interface YJHomeCategoryCell : UICollectionViewCell
@property(nonatomic,strong)ActRow1 *cellInfo;
@property(nonatomic,copy)ClickedCallBack callBack;
@property(nonatomic,strong)YJHomeCellTitleView *titleView;
@property(nonatomic,strong)UIImageView *sortImage;
@property(nonatomic,strong)YJHomeCellGoodsView *goodsView;
@end
