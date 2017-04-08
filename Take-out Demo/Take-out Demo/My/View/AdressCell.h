//
//  AdressCell.h
//  Take-out Demo
//
//  Created by 袁杰 on 17/4/9.
//  Copyright © 2017年 袁杰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AdressData.h"

typedef void(^ModifyCallback)(NSInteger tag);

@interface AdressCell : UITableViewCell
@property(nonatomic,strong)Adress *address;

+(instancetype)cellWithTable:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath callback:(ModifyCallback)callback;
@end
