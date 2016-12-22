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
    [[BaseTabBarViewController sharedController]hidesTabBar:YES animated:YES];
}
-(instancetype)initWithActivity:(YJActivity *)activity{
    self = [super init];
    self.activity = activity;
    return self;
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.view addSubview:self.webView];
    [self.webView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    NSString *urlStr = [NSString stringWithFormat:@"http://m.beequick.cn/show/active?id=%@&locationHash=dd89f1dQaciSSWjOXvfrV0V7EqgKmdGLU0/YJceSpQ5LLiEVS8oMovWAQ&zchtid=5624&location_time=1458523110&cityid=2&hide_cart=0&show_reload=1&activitygroup=%@&bigids=%@&__v=ios4.13",self.activity.aid,self.activity.ext_params.activitygroup,self.activity.ext_params.bigids];
    self.webView.delegate = self;
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlStr]]];
}

-(void)viewDidLoad{
    [super viewDidLoad];
    self.title = self.activity.name;
    self.webView = [[UIWebView alloc]init];
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(nonnull NSError *)error{
    NSLog(@"%@",error);
}

@end
