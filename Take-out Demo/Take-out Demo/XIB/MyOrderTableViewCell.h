//
//  MyOrderTableViewCell.h
//  Take-out Demo
//
//  Created by 袁杰 on 2017/4/12.
//  Copyright © 2017年 袁杰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OrderData.h"
@interface MyOrderTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *timeLabel;
@property (strong, nonatomic) IBOutlet UILabel *statusLabel;
@property (strong, nonatomic) IBOutlet UIView *imageViews;
@property (strong, nonatomic) IBOutlet UILabel *numLabel;
@property (strong, nonatomic) IBOutlet UILabel *priceLabel;
@property (strong, nonatomic) IBOutlet UIButton *delButton;
@property(nonatomic,strong)Order *order;
+(instancetype)cellWithTableView:(UITableView *)tableView;
@end
