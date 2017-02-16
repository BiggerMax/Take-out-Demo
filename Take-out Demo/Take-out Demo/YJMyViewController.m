//
//  YJMyViewController.m
//  Take-out Demo
//
//  Created by 袁杰 on 16/12/20.
//  Copyright © 2016年 袁杰. All rights reserved.
//

#import "YJMyViewController.h"
#import "YJMyHeadView.h"
@interface YJMyViewController ()
@property(nonatomic,strong)NSArray *orderArr;
@property(nonatomic,strong)NSArray *mineArr;
@property(nonatomic,strong)UIScrollView *mainScrollView;
@property(nonatomic,strong)UIView *footerView;
@property(nonatomic,strong)YJMyHeadView *mainHeadView;
@end

@implementation YJMyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self buildHeadView];

}
-(void)buildHeadView{
    self.mainHeadView = [[YJMyHeadView alloc] init];
    [self.view addSubview:self.mainHeadView];
    [self.mainHeadView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.leading.and.trailing.equalTo(self.view);
        make.height.mas_equalTo(200);
    }];
}
-(void)buildScrollView{
    self.mainScrollView = [[UIScrollView alloc] init];
    self.mainScrollView.backgroundColor = self.view.backgroundColor;
    [self.view addSubview:_mainScrollView];
    
    [self.mainScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mainHeadView.mas_bottom);
        make.leading.trailing.equalTo(self.view);
        make.bottom.equalTo(self.view).offset(-49);
    }];
    //
    UIView *contenView = [[UIView alloc] init];
    [self.mainScrollView addSubview:contenView];
    [contenView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.mainScrollView);
        make.width.equalTo(self.mainScrollView);
    }];
    //
    
}
@end
