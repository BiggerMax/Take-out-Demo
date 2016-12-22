//
//  YJHeadLineView.h
//  Take-out Demo
//
//  Created by 袁杰 on 16/12/22.
//  Copyright © 2016年 袁杰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YJHomeHeadData.h"
@interface YJHeadLineView : UIView
@property(nonatomic,strong)ActInfo *headLine;
@property(nonatomic,copy)ClikedCallback callBack;
@end
