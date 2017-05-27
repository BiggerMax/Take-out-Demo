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
@property (strong, nonatomic) IBOutlet UIImageView *imageView1;
@property (strong, nonatomic) IBOutlet UIImageView *imageView2;
@property (strong, nonatomic) IBOutlet UIImageView *imageView3;
@property (strong, nonatomic) IBOutlet UIImageView *imageView4;
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) IBOutlet UIImageView *moreImg;
@property (nonatomic,assign)Order *order;

+(instancetype)cellWithTableView:(UITableView *)tableView;
@end
