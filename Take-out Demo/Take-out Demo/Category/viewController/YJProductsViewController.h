//
//  YJProductsViewController.h
//  Take-out Demo
//
//  Created by 袁杰 on 17/2/22.
//  Copyright © 2017年 袁杰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YJBaseViewController.h"
#import "YJCategorySource.h"
#import "YJShoppingViewController.h"
@interface YJProductsViewController : YJBaseViewController<YJShoppingViewControllerDelegate>
@property(nonatomic,strong)SuperMarketData *superMarketData;
@property(nonatomic,strong)NSArray *cateArray;

@end
