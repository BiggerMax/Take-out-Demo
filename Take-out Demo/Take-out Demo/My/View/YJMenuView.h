//
//  YJMenuView.h
//  Take-out Demo
//
//  Created by 袁杰 on 17/2/19.
//  Copyright © 2017年 袁杰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YJTitleIconAction.h"
@interface YJMenuView : UIView
-(instancetype)initMenu:(NSArray<YJTitleIconAction *>*)menus withLine:(BOOL)line;
@end
