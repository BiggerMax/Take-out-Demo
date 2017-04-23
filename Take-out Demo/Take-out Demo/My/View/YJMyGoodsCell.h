//
//  YJMyGoodsCell.h
//  Take-out Demo
//
//  Created by 袁杰 on 2017/4/21.
//  Copyright © 2017年 袁杰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OrderData.h"
@interface YJMyGoodsCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *goodsName;
@property (strong, nonatomic) IBOutlet UILabel *goodsCount;
@property (strong, nonatomic) IBOutlet UILabel *goodsPrice;
@property (nonatomic)OrderGoods *orderGoods;
@end
