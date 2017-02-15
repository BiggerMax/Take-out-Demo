//
//  YJHomeCell.h
//  Take-out Demo
//
//  Created by 袁杰 on 16/12/22.
//  Copyright © 2016年 袁杰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YJGoods.h"

typedef void(^ClickedCallBack)(YJGoods *goods);

typedef enum : NSUInteger{
    AJHomeCellTypeVerticalScreen,
    AJHomeCellTypeCrossScreen
}YJHomeCellType;
@interface YJHomeCell : UICollectionViewCell
@property(nonatomic,strong)YJGoods *goods;
//不在显示减号
@property(nonatomic,assign)BOOL minusNeverShow;
@property(nonatomic,copy)ClickedCallBack callBack;
@end
