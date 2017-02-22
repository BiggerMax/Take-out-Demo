//
//  YJShoppingViewController.h
//  Take-out Demo
//
//  Created by 袁杰 on 16/12/20.
//  Copyright © 2016年 袁杰. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol YJShoppingViewControllerDelegate <NSObject>

-(void)didTableView:(UITableView *)tableView clickIndexPath:(NSIndexPath *)indexPath;

@end
@interface YJShoppingViewController : UIViewController
@property(nonatomic,weak)id<YJShoppingViewControllerDelegate>delegate;
@end
