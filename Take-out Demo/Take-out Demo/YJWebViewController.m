//
//  YJWebViewController.m
//  Take-out Demo
//
//  Created by 袁杰 on 16/12/22.
//  Copyright © 2016年 袁杰. All rights reserved.
//

#import "YJWebViewController.h"

@interface YJWebViewController ()<UIWebViewDelegate>
@property(nonatomic,strong)YJActivity *activity;
@property(nonatomic,strong)UIWebView *webView;
@end

@implementation YJWebViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.view.backgroundColor = [UIColor whiteColor];
    []
}



@end
