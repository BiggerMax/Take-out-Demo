//
//  StatusCell.h
//  Take-out Demo
//
//  Created by 袁杰 on 2017/4/22.
//  Copyright © 2017年 袁杰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StatusCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *timeLabel;
@property (strong, nonatomic) IBOutlet UIButton *selectedBtn;
@property (strong, nonatomic) IBOutlet UILabel *statusLabel;
@property (strong, nonatomic) IBOutlet UIView *topLine;
@property (strong, nonatomic) IBOutlet UIView *bottomLine;

@end
