//
//  YJBaseNavigationController.m
//  Take-out Demo
//
//  Created by 袁杰 on 16/12/20.
//  Copyright © 2016年 袁杰. All rights reserved.
//

#import "YJBaseNavigationController.h"

@interface YJBaseNavigationController ()
@property(nonatomic,strong)UIButton *backBtn;
@end

@implementation YJBaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.backBtn = ({
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"v2_goback"] forState:UIControlStateNormal];
    btn.titleLabel.hidden = YES;
    [btn addTarget:self action:@selector(backBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    btn.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
    btn.frame = CGRectMake(0, 0, 44, 40);
        btn;
    });
}



@end
