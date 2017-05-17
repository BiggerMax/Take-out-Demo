//
//  YJCategoryCell.h
//  Take-out Demo
//
//  Created by 袁杰 on 17/2/21.
//  Copyright © 2017年 袁杰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YJCategorySource.h"
@interface YJCategoryCell : UITableViewCell
@property(nonatomic,strong) ProductCategory *categoryData;
@property(nonatomic,strong) NSArray *categoryData_;
@property UILabel *titleLabel;
+(instancetype)cellWithTable:(UITableView*)tableView;
@end
